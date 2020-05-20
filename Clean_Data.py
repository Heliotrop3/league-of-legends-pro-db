# Author: Tyler Huffman
# Last Modified: 2020-04-21
# TODO: Figure out if there's a more effecient way to generate the SQL queries
from datetime import date, datetime, time
from collections import defaultdict, namedtuple
import pandas as pd
import numpy as np
import sqlite3, os

################--- Functions ---################

# Convert the GameLength from seconds to a datetime object
def parse_game_length(seconds):
    return datetime.strptime((":".join([str(int(seconds / 3600)), str(int((seconds % 3600) /60 )), str(int((seconds % 60)% 60))])),'%H:%M:%S').time()

# Given a PlayerID, determine their position
def find_player_pos(Dictionary, Player):
    try:
        for key in position_ids:
            if position_ids[key] == Player.position:
                Dictionary[Player.gameid]["".join([Player.side,"Side",key,"ID"])] = int(Player.PlayerID)
        return Dictionary
    except ValueError:
        print(player_ids[Player.PlayerID])
        print(Player)
        input()

# Given a named tuple and a list of metrics, transfer the metrics from the tuple to the dict
def update_ledger(Dictionary, NamedTuple, metrics):
    try:
        result = {word: int(getattr(NamedTuple, word)) for word in metrics}  # Create a dictionary via grabbing the desired metrics as keys and their associated values as... well values.
    except ValueError:
        print("Value Error with Team")
        print("Match URL: {}".format(getattr(NamedTuple, 'url')))
        for x in metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
    except TypeError:
        print("Type Error with Team")
        print("Match URL: {}".format(getattr(NamedTuple, 'url')))
        for x in metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
        
    Dictionary[NamedTuple.gameid][NamedTuple.TeamID] = result            # Store the generated dictionary in the passed Dictionary under the given game and appropriate team
    return Dictionary

"""
Given a named tuple and a list of metrics, transfer the metrics from the tuple to the dict
Same idea as update_ledger EXCEPT we store the results under the player instead of the team.

-- Look into combining update_ledger with and this
"""
def player_update_ledger(Dictionary, NamedTuple, metrics):
    try:
        result = {word: int(getattr(NamedTuple, word)) for word in metrics}  # Create a dictionary via grabbing the desired metrics as keys and their associated values as... well values.
    except ValueError:
        print("Value Error with Player")
        print(NamedTuple)
        for x in metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
    except TypeError:
        print("Type Error with Player")
        for x in metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
    #### THIS LINE IS WHY update_ledger AND player_update_ledger ARE SEPERATED! ####
    Dictionary[NamedTuple.gameid][NamedTuple.PlayerID] = result            # Store the generated dictionary in the passed Dictionary under the given game and respective player
    ##############################################
    return Dictionary

"""
Provide a named tuple, the table where you want to add the data, and a GameID
to the function. The function will return a string representing a SQL query.
"""
def create_sql(NamedTuple, TableToWrite, GameID):
    str1 = "INSERT INTO {} (GameID,".format(TableToWrite)
    str2 = "VALUES({},".format(GameID)    
    for i in range(len(NamedTuple._fields)-1):
        str1 = " ".join([str1, "{},".format(sorted(NamedTuple._fields)[i])])
        
        if isinstance(getattr(NamedTuple,sorted(NamedTuple._fields)[i]), datetime):
            str2 = " ".join([str2, "DATETIME(\'{}\'),".format(getattr(NamedTuple,sorted(NamedTuple._fields)[i]))])

        elif isinstance(getattr(NamedTuple,sorted(NamedTuple._fields)[i]), time):
            str2 = " ".join([str2, "TIME(\'{}\'),".format(getattr(NamedTuple,sorted(NamedTuple._fields)[i]))])
            
        else:
            str2 = " ".join([str2, "{},".format(getattr(NamedTuple,sorted(NamedTuple._fields)[i]))])
    str1 = " ".join([str1, "{})".format(sorted(NamedTuple._fields)[i+1])])
    str2 = " ".join([str2, "{});\n".format(getattr(NamedTuple,sorted(NamedTuple._fields)[i+1]))])
    return(" ".join([str1,str2]))

"""
Create a SQL query for inserting a teams bans

-- Tracking ban order should be added for next ban predicitions
"""
def create_bans_sql(ChampionID, GameID, BanID, TeamID):
    sql_str = "INSERT INTO Bans (BanID, GameID, TeamID, ChampionID) VALUES({}, {}, {}, {});\n".format(BanID, GameID, TeamID, ChampionID)
    BanID += 1
    return sql_str, BanID

###############################################
conn = sqlite3.connect('ProLoL.db') # Connect to the database
c = conn.cursor()                   # Create an object to interact with the db

player_ids = {}                                                    # Use the player's prohandle as keys and a unique integer as a value
for row in c.execute('SELECT PlayerID, ProHandle FROM Players;'):  # Grab the db's association of Players with PlayerIDs
    player_ids[row[1]] = int(row[0])
player_id_curr_max = max(player_ids.values())                      # Start a counter representing the total number of players recorded for adding players to the DB

team_ids = {}                                                # Create a dictionary where the team name is the key and the value is a unique integer
for row in c.execute('SELECT TeamID, TeamName FROM Teams;'): # Grab the db's association of Teams with TeamIDs
    team_ids[row[1]] = int(row[0])   
team_id_curr_max = max(team_ids.values())                    # Start a counter representing the total number of teams recorded for adding teams to the DB

champion_ids = {}                                                        # Create a dictionary where the champion name is the key and the value is a unique integer
for row in c.execute('SELECT ChampionID, ChampionName FROM Champions;'): # Grab the db's association of Champions with ChampionIDs
    champion_ids[row[1]] = int(row[0])
champion_id_curr_max = max(champion_ids.values())                        # Start a counter representing the total number of champions recorded for adding champs to the DB

position_ids = {}                                                         # Create a dictionary where the position name is the key and the value is a unique integer
for row in c.execute('SELECT PositionID, PositionAbbrv FROM Positions;'): # Grab the db's association of Positions with PositionIDs
    position_ids[row[1]] = int(row[0])

os.chdir('Raw Data')                                                                                       # Change working directory to where the csv file is stored

data = pd.read_csv("2020 spring match data OraclesElixir 2020-05-15.csv",low_memory=False, na_filter=True) # Read in the CSV file containing the data

# I'm aiming to have a database in strictly 3rd Normalized form. In short, I don't want any data I can derive.
derivable_stats = ['teamkills',
                   'teamdeaths',
                   "team kpm",
                   'ckpm',
                   'dpm',
                   'damageshare',
                   'wpm',
                   'wcpm',
                   'vspm',
                   'earned gpm',
                   'earnedgoldshare',
                   'gspd',
                   'cspm',
                   'opp_barons',
                   'opp_dragons',
                   'opp_elementaldrakes',
                   'opp_elders',
                   'opp_heralds',
                   'opp_towers',
                   'opp_inhibitors',
                   'opp_goldat10',
                   'opp_xpat10',
                   'opp_csat10',
                   'golddiffat10',
                   'xpdiffat10',
                   'csdiffat10',
                   'opp_goldat15',
                   'opp_xpat15',
                   'opp_csat15',
                   'golddiffat15',
                   'xpdiffat15',
                   'csdiffat15',
                   'dragons',
                   'dragons (type unknown)',
                   'elementaldrakes'
                   ]

data = data.drop(derivable_stats, axis = 1)  # Drop all derivable stats

# Rename the columns. Essential during the SQL generation phase
data.rename(columns = {
                       'playerid'                : 'PlayerID',
                       'firstdragon'             : 'FirstDrake',
                       'infernals'               : 'InfernalDrakes',
                       'mountains'               : 'MountainDrakes',
                       'clouds'                  : 'CloudDrakes',
                       'oceans'                  : 'OceanDrakes',
                       'elders'                  : 'ElderDrakes',
                       'heralds'                 : 'Heralds',
                       'firstbaron'              : 'FirstBaron',
                       'barons'                  : 'Barons',
                       'firsttower'              : 'FirstTower',
                       'towers'                  : 'Towers',
                       'firstmidtower'           : 'FirstMidTower',
                       'firsttothreetowers'      : 'FirstToThreeTowers',
                       'inhibitors'              : 'Inhibitors',
                       'assists'                 : 'Assists',
                       'champion'                : 'ChampionID',
                       'controlwardsbought'      : 'ControlWardsBought',
                       'csat10'                  : 'CsAtTen',
                       'csat15'                  : 'CsAtFifteen',
                       'damagetochampions'       : 'DamageToChampions',
                       'deaths'                  : 'Deaths',
                       'doublekills'             : 'DoubleKills',
                       'earnedgold'              : 'EarnedGold',
                       'firstbloodassist'        : 'FirstBloodAssist',
                       'firstbloodkill'          : 'FirstBloodKill',
                       'firstbloodvictim'        : 'FirstBloodVictim',
                       'goldat10'                : 'GoldAtTen',
                       'goldat15'                : 'GoldAtFifteen',
                       'goldspent'               : 'GoldSpent',
                       'kills'                   : 'Kills',
                       'minionkills'             : 'MinionKills',
                       'monsterkillsenemyjungle' : 'EnemyMonstersKilled',
                       'monsterkillsownjungle'   : 'FriendlyMonstersKilled',
                       'pentakills'              : 'PentaKills',
                       'quadrakills'             : 'QuadraKills',
                       'totalgold'               : 'TotalGold',
                       'triplekills'             : 'TripleKills',
                       'visionscore'             : 'VisionScore',
                       'wardskilled'             : 'WardsKilled',
                       'wardsplaced'             : 'WardsPlaced',
                       'xpat10'                  : 'XpAtTen',
                       'xpat15'                  : 'XpAtFifteen',
                       'team'                    : 'TeamID'
                       }, inplace=True)

# In my database Aphromoo and Huhi are capitalized and champions with an apostrophe have the letter after the apostrophe capitalized
data['player'] = data.player.replace({'huhi':'Huhi', 'aphromoo':'Aphromoo'})

champion_cols = ['ChampionID','ban1','ban2','ban3','ban4','ban5']
for col in champion_cols:
    data[col] = data[col].replace({'Kai\'sa':'Kai\'Sa',
                                     'Vel\'koz':'Vel\'Koz',
                                     'Kha\'zix': 'Kha\'Zix',
                                     'Cho\'gath':'Cho\'Gath',
                                     'Kog\'maw':'Kog\'Maw',
                                     'Nunu': 'Nunu & Willump'})
# There's an instance where a champion name is blank...
data['ChampionID'] = data['ChampionID'].str.strip().replace('',np.nan)

### Turn into function
players = data[(data.player.notnull())]
for player in set(players['player']):
    if player not in list(player_ids.keys()):
        player_id_curr_max += 1
        player_ids[player] = player_id_curr_max
        #print("{} was added to the dictionary with id {}".format(player, player_id_curr_max))
#print()

champions = data[data['ChampionID'].notnull()]
for champion in set(champions['ChampionID']):
    if champion not in list(champion_ids.keys()):
        champion_id_curr_max += 1
        champion_ids[champion] = champion_id_curr_max
        print("{} was added to the dictionary with id {}".format(champion, champion_id_curr_max))
#print()

teams = data[data['position'] == 'team']
for team in set(teams['TeamID']):
    if team not in list(team_ids.keys()):
        team_id_curr_max += 1
        team_ids[team] = team_id_curr_max
        #print("{} was added to the dictionary with id {}".format(team, team_id_curr_max))
#print()
####


data = data[data['league'].isin(['LCS','LCS.A', 'CBLOL', 'LEC', 'PCS', 'LCK', 'TCL'])] # Grab all teams except the LPL as they don't provide detailed data regarding their games

data['position'] = data['position'].str.capitalize()                                   # Capitalize the position abbreviations. This enables the mapping of our db's PositionIDs over the provided abbreviations

# Substitute our PlayerIDs, TeamIDs, ChampionIDs, and PositionIDs in place of the provided values.
data.loc[:,'PlayerID'] = data['player'].replace(player_ids)
data.loc[:,'TeamID'] = data['TeamID'].replace(team_ids)
data.loc[:,'ChampionID'] = data['ChampionID'].replace(champion_ids)
data.loc[:,'position'] = data['position'].replace(position_ids)

Teams = data[data['player'].isnull()]   # Grab the rows consisting of the team objective stats

## Uncomment the below line to export the Teams df to a spreadsheet
##Teams.to_csv('Team_Stats.csv', index=False)

Players = data[data['player'].notnull()] # Drop the team rows from the Player Dataframe

# Create a list of non-player performance metrics
non_player_stats = ['url',
                    'date',
                    'ban1',
                    'ban2',
                    'ban3',
                    'ban4',
                    'ban5',
                    'gamelength',
                    'result',
                    'FirstDrake',
                    'InfernalDrakes',
                    'MountainDrakes',
                    'CloudDrakes',
                    'OceanDrakes',
                    'ElderDrakes',
                    'Heralds',
                    'FirstBaron',
                    'Barons',
                    'FirstTower',
                    'Towers',
                    'FirstMidTower',
                    'FirstToThreeTowers',
                    'Inhibitors']

Players = Players.drop(non_player_stats,axis=1) # From the dataframe consisting of the pro's performance, drop all stats not relating to the player
###Players.to_csv('Player Stats.csv', index=False) ### Uncomment to see what the Players df looks like

# As it stands, I need this information in both dataframes. So I sneak it to the front of the list
non_player_stats.insert(0,'patch')
non_player_stats.insert(0,'result')
non_player_stats.insert(0,'side')
non_player_stats.insert(0,'TeamID')
non_player_stats.insert(0,'gameid')

Teams = Teams[non_player_stats]                # From the dataframe consisting of the team's performance, drop all stats NOT related to the objectives
### Teams.to_csv('Pre Change.csv',index=False) ### Uncomment the below line to see what the Teams df looks like before applying the ChampionIDs across the team's bans

"""
  If any of the bans contain an nan, then a team failed to ban.
  Convert the nan to the value associated with the "Missed Ban" key in the database
"""
Teams.loc[:,'ban1'] = Teams['ban1'].fillna('Missed Ban')
Teams.loc[:,'ban2'] = Teams['ban2'].fillna('Missed Ban')
Teams.loc[:,'ban3'] = Teams['ban3'].fillna('Missed Ban')
Teams.loc[:,'ban4'] = Teams['ban4'].fillna('Missed Ban')
Teams.loc[:,'ban5'] = Teams['ban5'].fillna('Missed Ban')

# Convert the champion names, or lack thereof, to their associated IDs
Teams.loc[:,'ban1'] = Teams['ban1'].replace(champion_ids)
Teams.loc[:,'ban2'] = Teams['ban2'].replace(champion_ids)
Teams.loc[:,'ban3'] = Teams['ban3'].replace(champion_ids)
Teams.loc[:,'ban4'] = Teams['ban4'].replace(champion_ids)
Teams.loc[:,'ban5'] = Teams['ban5'].replace(champion_ids)

##Teams.to_csv('Team_Stats.csv', index=False) ### Uncomment to see what the Teams df looks like after the mapping

#####################
"""
    Replace any nan values with the **player's** median value
    
    I could just use pandas' median function and fill in all nan values with the
    median of the dataset but I prefer to subset the data and use the median of
    the player's performance.

    A more complex 
"""
#####
missing_data = Players[Players.isna().any(axis=1)]              # Grab the rows with missing values
##print(missing_data.shape)

pros = set(missing_data.player)                                 # Extract the pros who have nan values
for pro in pros:                                                # Iterate over each player with nan values
    temp = Players[(Players['player'] == pro)]                  # Grab the matches associated with the player
    rows = temp.index[temp.isna().any(axis=1)].tolist()         # Extract a list containing the index of the rows with the nan values      

    for loc in rows:                                                  # Iterate across each row with nan values
        cols = temp.columns[temp.isna().any()].tolist()               # Extract a list of the columns containing the nan values for the row
        for metric in cols:                                           # Calculate the median value for each missing metric and overwrite the nan value
            Players.at[loc, metric] = temp[metric].median(skipna=True)
            
missing_data = Players[Players.isna().any(axis=1)]              # Grab the rows with missing values
##print(missing_data.shape)
##input()

#####################

"""
I need to work on the below code. Pretty sure there exists a more effecient way to handle data.
As I'm typing this I've been coding for roughly 12+ hours and to say I wasn't too concerned with
efficiency on the tail end would be accurate.

I'll come back and refactor this section of code once I have a working version.
"""

# Use defaultdict and lambda to create nested dictionaries to store the parsed data
MatchResults = defaultdict(lambda: defaultdict(dict))
PlayerPerformances = defaultdict(lambda: defaultdict(dict))
TeamObjectives = defaultdict(lambda: defaultdict(dict))
TeamBans = defaultdict(lambda: defaultdict(dict))

# Define which fields/keys we want for the TeamBans, TeamObjectives, and PlayerPerformances dicts
BanMetrics = ['ban1', 'ban2', 'ban3', 'ban4', 'ban5',  'TeamID']
TeamObjectiveMetrics = ['FirstDrake', 'InfernalDrakes','MountainDrakes', 'CloudDrakes',
                        'OceanDrakes', 'ElderDrakes', 'Heralds', 'FirstBaron', 'Barons',
                        'FirstTower', 'Towers', 'FirstMidTower', 'FirstToThreeTowers',
                        'Inhibitors', 'TeamID']
PlayerPerformanceMetrics = ['PlayerID','Kills', 'Deaths', 'Assists', 'DoubleKills', 'TripleKills', 'QuadraKills', 'PentaKills',
                            'FirstBloodKill', 'FirstBloodAssist', 'FirstBloodVictim', 'DamageToChampions', 'WardsPlaced', 'WardsKilled',
                            'ControlWardsBought', 'VisionScore', 'TotalGold', 'EarnedGold', 'GoldSpent', 'MinionKills', 'FriendlyMonstersKilled',
                            'EnemyMonstersKilled','GoldAtTen', 'XpAtTen','CsAtTen', 'GoldAtFifteen', 'XpAtFifteen', 'CsAtFifteen']


## Thought: Move the writing of the player performances here. If successful, investigate moving other file operations here
for TeamResult in Teams.itertuples():                                                                        # Iterate over the Team rows as named tuples

    ### DEBUGGING ###
##    print("Team Result\n" + ("="*15)+ "\n{}".format(TeamResult))
##    input()
    #################
    
    if TeamResult.gameid not in MatchResults:                                                                # If the match has not been recorded
        MatchResults[TeamResult.gameid]['DatePlayed'] = datetime.strptime(TeamResult.date, '%m/%d/%Y %M:%S') # Parse and add the date to the dict  '%Y-%m-%d %H:%M:%S')
        MatchResults[TeamResult.gameid]['GameLength'] = parse_game_length(TeamResult.gamelength)             # Parse and add the game length to the dict
        MatchResults[TeamResult.gameid]['OnPatch'] = TeamResult.patch                                        # Record and add the game patch to the dict

    TeamObjectives = update_ledger(TeamObjectives, TeamResult, TeamObjectiveMetrics)                         # Parse the objectives secured by the team
    TeamBans = update_ledger(TeamBans, TeamResult, BanMetrics)                                               # Parse the champions banned by the team

    ### DEBUGGING ###
##    print(TeamBans)
    #################
    
    if TeamResult.side == 'Blue':                                                                            # Record which side the team played from                           
        MatchResults[TeamResult.gameid]['BlueSideTeamID'] = TeamResult.TeamID    
    else:
        MatchResults[TeamResult.gameid]['RedSideTeamID'] = TeamResult.TeamID
    if TeamResult.result == 1:                                                                               # Record whether the given team won the match
        MatchResults[TeamResult.gameid]['WinningTeamID'] = TeamResult.TeamID     
        
    temp = Players.loc[(Players['gameid'] == TeamResult.gameid) & (Players['TeamID'] == TeamResult.TeamID)]  # Grab the players who played in the match for the team
    for Player in temp.itertuples():                                                                         # Iterate over the named tuples of the participating players 
        ### DEBUGGING ###
        ##print("Player\n" + ("="*15)+ "\n{}".format(Player))
        ##input()
        #################

        MatchResults = find_player_pos(MatchResults, Player)                                                 # Record which position they played in the match
        PlayerPerformances = player_update_ledger(PlayerPerformances, Player, PlayerPerformanceMetrics)      # Record the player's performance in the given match
        
print("Parsing Data Completed")

#### DEBUGGING ###
##print(MatchResults.keys())
##input()
##print(PlayerPerformances['ESPORTSTMNT01/1291177'][16])
##print(TeamObjectives['ESPORTSTMNT01/1291177'][13])
##input()
##print(sorted(TeamObjectives['ESPORTSTMNT01/1291177'].keys()))
##input()
###################

# Create named tuples to facilitate converting the data into SQL statements
MatchResultsTuple = namedtuple('MatchResultsTuple', sorted(MatchResults['ESPORTSTMNT01/1291177']))
PlayerPerformanceTuple = namedtuple('PlayerPerformanceTuple',sorted(PlayerPerformances['ESPORTSTMNT01/1291177'][16]))
TeamBansTuple = namedtuple('TeamBansTuple',sorted(TeamBans['ESPORTSTMNT01/1291177'][16]))
TeamObjectivesTuple = namedtuple('TeamObjectivesTuple',sorted(TeamObjectives['ESPORTSTMNT01/1291177'][13]))

"""
Create files to hold the SQL queries generated by our functions

I need to figure out if theres a better way to transform the data from the csv and into SQL.
For some reason, I don't think having 3+ I/O Operations running in unison is an effecient solution.

I could just execute the queries directly in the database through python
"""
f = open("Matches.sql", "w")
f.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

g = open("PlayerPerformances.sql", "w")
g.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

e = open("Objectives.sql", "w")
e.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

m = open("Bans.sql", "w")
m.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

GameID = 1                                                                                      # Initialize a psuedo GameID and BanID
BanID = 1
for match in MatchResults:                                                                      # Iterate over the recorded matches
    MatchTemp = MatchResultsTuple(**MatchResults[match])                                        # Store the contents of the match into the appropriate named tuple
    f.write(create_sql(MatchTemp, "Games", GameID))                                             # Write the returned SQL query relating to when, what patch, and who played in the game to the appropriate file

    for player in sorted(PlayerPerformances[match]):                                            # Iterate across the players in the match
        PlayerTemp = PlayerPerformanceTuple(**PlayerPerformances[match][player])                # Store the player data into the appropriate named tuple
        PlayerPerformanceQuery = create_sql(PlayerTemp, "Performances", GameID)                 # Pass the named tuple to a function which parses the data into a SQL string
        g.write(PlayerPerformanceQuery)                                                         # Write the SQL query to the SQL file associated with the Player's performance
        
    for team in sorted(TeamObjectives[match]):                                                  # Iterate across each team in a given match
        ObjectivesTemp = TeamObjectivesTuple(**TeamObjectives[match][team])                     # Store the teams objective control stats into the appropriate named tuple
        TeamObjectivesQuery = create_sql(ObjectivesTemp, "Objectives", GameID)                  # Pass the named tuple to a function which parses the data into a SQL string
        e.write(TeamObjectivesQuery)                                                            # Write the SQL query to the SQL file associated with the Team's Objective control performance                                                   # 

        for ban in TeamBans[match][team]:                                                       # Iterate over the team's bans for the game
            sql_query, BanID = create_bans_sql(TeamBans[match][team][ban], GameID, BanID, team) # Generate a SQL query based off of the ChampionID, GameID, BanID and TeamID
            m.write(sql_query)                                                                  # Write the SQL query to the SQL file associated with the Team's bans
    GameID += 1                                                                                 # Increase the psuedo GameID

# Add an End Transaction statement to the end of each file
f.write("\n\nEND TRANSACTION;")
g.write("\n\nEND TRANSACTION;")
e.write("\n\nEND TRANSACTION;")
m.write("\n\nEND TRANSACTION;")
# Close the files
f.close()
g.close()
e.close()
m.close()
