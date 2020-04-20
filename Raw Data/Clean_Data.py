# Author: Tyler Huffman
# Last Modified: 2020-04-20
# TODO: Comment the code, fix the Constraint fail Objectives is generating, figure out if there's a more effecient way to generate the SQL queries
from datetime import date, datetime
from collections import defaultdict, namedtuple
from itertools import chain
import pandas as pd
import sqlite3
import time


###########################################

def find_player_pos(Dictionary, Player):
    for key in position_ids:
        if position_ids[key] == Player.position:
            Dictionary[Player.gameid]["".join([Player.side,"Side",key,"ID"])] = int(Player.playerid)
    return Dictionary


######
# I can 100% combine these functions.
# A task for a later time.
def record_player_performance(Dictionary, Player):
    metrics = ['Kills', 'Deaths', 'Assists', 'DoubleKills', 'TripleKills', 'QuadraKills', 'PentaKills',
               'FirstBloodKill', 'FirstBloodAssist', 'FirstBloodVictim', 'DamageToChampions', 'WardsPlaced', 'WardsKilled',
               'ControlWardsBought', 'VisionScore', 'TotalGold', 'EarnedGold', 'GoldSpent', 'MinionKills', 'FriendlyMonstersKilled',
               'EnemyMonstersKilled','GoldAtTen', 'XpAtTen','CsAtTen', 'GoldAtFifteen', 'XpAtFifteen', 'CsAtFifteen', 'PlayerID']
    performance = {word: int(getattr(Player, word)) for word in metrics}
    Dictionary[Player.gameid][Player.playerid] = performance
    return Dictionary


def record_team_objectives(Dictionary, Match):
    metrics = ['FirstDrake', 'Drakes','InfernalDrakes',
               'MountainDrakes', 'CloudDrakes', 'OceanDrakes', 'ElderDrakes',
               'Heralds', 'FirstBaron', 'Barons', 'FirstTower', 'Towers',
                'FirstMidTower', 'FirstToThreeTowers', 'Inhibitors', 'TeamID']
    performance = {word: int(getattr(Match, word)) for word in metrics}
    Dictionary[Match.gameid][Match.TeamID] = performance
    return Dictionary

#####

"""
Provide a named tuple, the table where you want to add the data, and a GameID
to the function. The function will return a string representing a SQL query.
"""
def prep_write(NamedTuple, TableToWrite, GameID):
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

###########################################

# Convert the GameLength from seconds to a datetime object
def parse_game_length(seconds):
    return datetime.strptime((":".join([str(int(seconds / 3600)), str(int((seconds % 3600) /60 )), str(int((seconds % 60)% 60))])),'%H:%M:%S').time()

# Connect to the database
conn = sqlite3.connect('PATH TO DATABASE')
# Create an object to interact with the db
c = conn.cursor()

# Grab the db's association of Players with PlayerIDs
player_ids = {}
for row in c.execute('SELECT PlayerID, ProHandle FROM Players;'):
    player_ids[row[1]] = int(row[0])
#print(player_ids)

# Grab the db's association of Teams with TeamIDs
team_ids = {}
for row in c.execute('SELECT TeamID, TeamName FROM Teams;'):
    team_ids[row[1]] = int(row[0])   
#print(team_ids)

# Grab the db's association of Champions with ChampionIDs
champion_ids = {}
for row in c.execute('SELECT ChampionID, ChampionName FROM Champions;'):
    champion_ids[row[1]] = int(row[0])
#print(champion_ids)

# Grab the db's association of Positions with PositionIDs
position_ids = {}
for row in c.execute('SELECT PositionID, PositionAbbrv FROM Positions;'):
    position_ids[row[1]] = int(row[0])
#print(position_ids)

# Read in the CSV file containing the data
data = pd.read_csv("2020-spring-match-data-OraclesElixir-2020-04-13d.csv",low_memory=False)

# I'm aiming to have a database in 3rd Normalized form. In short, I don't want any data I can derive.
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
                   'csdiffat15']

# Drop all derivable stats
data = data.drop(derivable_stats, axis = 1)
# Rename the columns. Essential during the SQL generation phase
data.rename(columns = {
                       'playerid'                : 'PlayerID',
                       'firstdragon'             : 'FirstDrake',
                       'dragons'                 : 'Drakes',
                       'elementaldrakes'         : 'ElementalDrakes',
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
data['player'] = data['player'].replace({'huhi':'Huhi', 'aphromoo':'Aphromoo'})
data['ChampionID'] = data['ChampionID'].replace({'Kai\'sa':'Kai\'Sa',
                                                 'Vel\'koz':'Vel\'Koz',
                                                 'Kha\'zix': 'Kha\'Zix',
                                                 'Cho\'gath':'Cho\'Gath',
                                                 'Kog\'maw':'Kog\'Maw'})

##### Grab onlt the LCS and Academy Teams. If not filtering by region, comment out the below line
data =  data[data['league'].isin(['LCS','LCS.A'])]
#####

# Capitalize the position abbreviations. This enables the mapping of our db's PositionIDs over the provided abbreviations
data['position'] = data['position'].str.capitalize()
# Substitute our PlayerIDs, TeamIDs, ChampionIDs, and PositionIDs in place of the provided values.
data.loc[:,'playerid'] = data['player'].map(player_ids)
data.loc[:,'TeamID'] = data['TeamID'].map(team_ids)
data.loc[:,'ChampionID'] = data['ChampionID'].replace(champion_ids)
data.loc[:,'position'] = data['position'].replace(position_ids)

# Grab the rows consisting of the team objective stats
Teams = data[data['playerid'].isnull()]     # Alternatively, something like "NATeams['position'] == 'team'" would also work

# Find any  players not in the database. (Because I have a contract aspect to the db currently I'm manually adding players to the db and SQL files)
missing = Teams[(Teams.playerid) & (Teams.player.notnull())]
if len(set(missing['player'])) > 0:
    print("Error: {} Player(s) are missing from the Dictionary".format(len(set(missing['player']))))
    print(set(missing['player']))
    input()

# Drop the team rows from the Player Dataframe
Players = data[data['player'].notnull()]
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
                    'Drakes',
                    'ElementalDrakes',
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

# From the dataframe consisting of the pro's performance, drop all stats not relating to the player
Players = Players.drop(non_player_stats,axis=1)

## Uncomment and open the file generated by the below line to see what the Players df looks like
##Players.to_csv('Player Stats.csv', index=False)


# As it stands, I need this information in both dataframes. So I sneak it to the front of the list
non_player_stats.insert(0,'patch')
non_player_stats.insert(0,'result')
non_player_stats.insert(0,'side')
non_player_stats.insert(0,'TeamID')
non_player_stats.insert(0,'gameid')

# From the dataframe consisting of the team's performance, drop all stats NOT related to the objectives
Teams = Teams[non_player_stats]

## Uncomment the below line to see what the Teams df looks like before applying the ChampionIDs across the team's bans
### Teams.to_csv('Pre Change.csv',index=False)

Teams.loc[:,'ban1'] = Teams['ban1'].replace(champion_ids)
Teams.loc[:,'ban2'] = Teams['ban2'].replace(champion_ids)
Teams.loc[:,'ban3'] = Teams['ban3'].replace(champion_ids)
Teams.loc[:,'ban4'] = Teams['ban4'].replace(champion_ids)
Teams.loc[:,'ban5'] = Teams['ban5'].replace(champion_ids)

## Uncomment the below line to see what the Teams df looks like after the mapping
##Teams.to_csv('Team_Stats.csv', index=False)

"""
I need to work on the below code. Pretty sure there exists a more effecient way to handle data.
As I'm typing this I've been coding for roughly 12+ hours and to say I wasn't too concerned with
efficiency on the tail end would be accurate.

I'll come back and refactor this section of code once I have a working version.
"""

# Use defaultdict and lambda to create nested dictionaries to store the results of parsing the data
MatchResults = defaultdict(lambda: defaultdict(dict))
PlayerPerformances = defaultdict(lambda: defaultdict(dict))
TeamObjectives = defaultdict(lambda: defaultdict(dict))

# 
for TeamResult in Teams.itertuples():
    if TeamResult.gameid not in MatchResults:
        # Parse the date
        MatchResults[TeamResult.gameid]['DatePlayed'] = datetime.strptime(TeamResult.date, '%m/%d/%Y %M:%S')
        # Parse the game length
        MatchResults[TeamResult.gameid]['GameLength'] = parse_game_length(TeamResult.gamelength)
        # Grab the patch
        MatchResults[TeamResult.gameid]['OnPatch'] = TeamResult.patch

    TeamObjectives = record_team_objectives(TeamObjectives, TeamResult)

    if TeamResult.side == 'Blue':
        MatchResults[TeamResult.gameid]['BlueSideTeamID'] = TeamResult.TeamID
    else:
        MatchResults[TeamResult.gameid]['RedSideTeamID'] = TeamResult.TeamID
    if TeamResult.result == 1:          
        MatchResults[TeamResult.gameid]['WinningTeamID'] = TeamResult.TeamID
        
    temp = Players.loc[(Players['gameid'] == TeamResult.gameid) & (Players['TeamID'] == TeamResult.TeamID)]
    for Player in temp.itertuples():
        MatchResults = find_player_pos(MatchResults, Player)
        PlayerPerformances = record_player_performance(PlayerPerformances, Player)
        
print("Parsing Data Completed")

#### DEBUGGING STATEMENTS
##print(TeamObjectives.keys())
##input()
##print(TeamObjectives['ESPORTSTMNT01/1291177'].values())
##print(TeamObjectives['ESPORTSTMNT01/1291177'])
##input()
##print(sorted(TeamObjectives['ESPORTSTMNT01/1291177'].keys()))
##input()
####

from datetime import time  # Without this here (no placing it at the top of the file doesn't work), the "isinstance(...)" checks will throw an error. 

# Create named tuples to facilitate converting the data into SQL statements
MatchResultsTuple = namedtuple('MatchResultsTuple', sorted(MatchResults['ESPORTSTMNT01/1291177']))
PlayerPerformanceTuple = namedtuple('PlayerPerformanceTuple',sorted(PlayerPerformances['ESPORTSTMNT01/1291177'][18.0]))
TeamObjectivesTuple = namedtuple('TeamObjectivesTuple',sorted(TeamObjectives['ESPORTSTMNT01/1291177'][16]))

"""
I need to figure out if theres a better way to transform the data from the csv and into SQL.
For some reason, I don't think having 3+ I/O Operations running in unison is effecient.
"""
f = open("Matches.sql", "w")
f.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

g = open("PlayerPerformances.sql", "w")
g.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

e = open("Objectives.sql", "w")
e.write('--- Auto-Generated SQL Queries ---\n\nBEGIN TRANSACTION;\n\n')

# Initialize a psuedo GameID
x = 1
# Iterate over the recorded matches
for match in MatchResults:
    # Store the contents of the match into our named tuple
    MatchTemp = MatchResultsTuple(**MatchResults[match])
    # Iterate across the players in the match
    for player in sorted(PlayerPerformances[match]):
        # Store the player data into another of our named tuples
        PlayerTemp = PlayerPerformanceTuple(**PlayerPerformances[match][player])
        # Write the returned SQL query to the file associated with the Player's performance
        g.write(prep_write(PlayerTemp, "Performances", x))
    # Iterate across the team's objective control stats of the given match
    for team in sorted(TeamObjectives[match]):
        # Store the team's objective stats in the named tuple associated with the Objectives
        ObjectivesTemp = TeamObjectivesTuple(**TeamObjectives[match][team])
        # Write the returned SQL query to the file associated with the Teams's Objective Control
        e.write(prep_write(ObjectivesTemp, "Objectives", x))
    # Write the returned SQL query relating to when, what patch, and who played in the game to the appropriate file
    f.write(prep_write(MatchTemp, "Games", x))
    # Increase the psuedo GameID
    x += 1
    
f.write("\n\nEND TRANSACTION;")
g.write("\n\nEND TRANSACTION;")
e.write("\n\nEND TRANSACTION;")
f.close()
g.close()
e.close()
