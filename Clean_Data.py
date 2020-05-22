"""
Author: Tyler Huffman
Last Modified: 2020-04-21
TODO: Clean up try and except statements, see about scraping OCE data,
      add comments and doc strings, and create better variable names
      for the functions
"""

from datetime import date, datetime, time
from collections import defaultdict, namedtuple
import sqlite3
import os
import pandas as pd
import numpy as np

#--------- Functions --------- #

def parse_game_length(Seconds):
    """Convert and return an integer value to a time object"""
    return datetime.strptime(
        (":".join([
            str(int(Seconds / 3600)),
            str(int((Seconds % 3600) / 60)),
            str(int((Seconds % 60) % 60))
            ]
            )
         ),'%H:%M:%S').time()


def find_player_pos(Dictionary, Player):
    """
    
    """
    gameID = Player.gameid
    try:
        for key in position_ids:
            if key == Player.position:
                laneID = "".join([Player.side,"Side",key,"ID"])
                Dictionary[gameID][laneID] = int(Player.PlayerID)
        return Dictionary
    
    except ValueError:
        print(("Error: Problem finding {}'s "
               "position\n").format(Player.player),Player)
        try:
            print(player_ids[Player.PlayerID])
        except KeyError:
            print(("Error: {} is not registered"
                  "in player_ids").format(Player.player))
        input()

def update_ledger(Dictionary, NamedTuple, Metrics):
    try:
        """"""
        result = {word: int(getattr(NamedTuple,
                                    word
                                    )
                            ) for word in Metrics}
    except ValueError:
        print("Value Error with Team")
        print("Match URL: {}".format(getattr(NamedTuple, 'url')))
        for x in Metrics:
            print(("Metric: {} "
                  "NamedTuple Value: {}").format(x,
                                                 getattr(NamedTuple,
                                                         x
                                                         )
                                                 )
                  )
        input()
    except TypeError:
        print("Type Error with Team")
        print("Match URL: {}".format(getattr(NamedTuple, 'url')))
        for x in Metrics:
            print(("Metric: {}"
                  "NamedTuple Value: {}").format(x,
                                                 getattr(NamedTuple,
                                                         x
                                                         )
                                                 )
                  )
        input()
        
    """
    Store the generated dictionary in the passed Dictionary
    under the given game and appropriate team    
    """
    Dictionary[NamedTuple.gameid][NamedTuple.TeamID] = result
    return Dictionary

def player_update_ledger(Dictionary, NamedTuple, Metrics):
    """
    --Expand/Refine--
    Same idea as update_ledger EXCEPT the
    results are stored under the player's ID rather than the team's
    """
    try:
        result = {word: int(getattr(NamedTuple, word)) for word in Metrics}
    except ValueError:
        print("Value Error with Player")
        print(NamedTuple)
        for x in Metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
    except TypeError:
        print("Type Error with Player")
        for x in Metrics:
            print("Metric: {}  NamedTuple Value: {}".format(x,getattr(NamedTuple, x)))
        input()
    #### THIS LINE IS WHY update_ledger AND player_update_ledger ARE SEPERATED! ####
    # Store the generated dictionary in the passed Dictionary under the
    # given game and respective player
    Dictionary[NamedTuple.gameid][NamedTuple.PlayerID] = result 
    ############################################################
    return Dictionary

"""
Provide a named tuple, the table where you want to add the data,
and a GameID to the function. The function will return a string
representing a SQL query.
"""
def create_sql(NamedTuple, TableToWrite, GameID):
    str1 = "INSERT INTO {} (GameID,".format(TableToWrite)
    str2 = "VALUES({},".format(GameID)
    for i in range(len(NamedTuple._fields)-1):
        attrib_name = sorted(NamedTuple._fields)[i]
        str1 = " ".join([
                         str1,
                         "{},".format(attrib_name)
                         ]
                        )
        
        if isinstance(getattr(NamedTuple,
                              sorted(NamedTuple._fields)[i]
                              ),
                      datetime
                      ):
            date_played = getattr(NamedTuple,
                                  sorted(NamedTuple._fields)[i]
                                  )
            str2 = " ".join([
                             str2,
                             "DATETIME(\'{}\'),".format(date_played)
                             ]
                            )

        elif isinstance(getattr(NamedTuple,
                                sorted(NamedTuple._fields)[i]
                                ),
                        time
                        ):
            game_length = getattr(NamedTuple,
                                  sorted(NamedTuple._fields)[i]
                                  )
            str2 = " ".join([
                             str2,
                             "TIME(\'{}\'),".format(game_length)
                             ]
                            )
        else:
            attrib_value = getattr(NamedTuple,
                                   sorted(NamedTuple._fields)[i]
                                   )
            str2 = " ".join([
                             str2,
                             "{},".format(attrib_value)
                             ]
                            )
    final_attrib_name = sorted(NamedTuple._fields)[i+1]
    final_attrib_value = getattr(NamedTuple,
                                 sorted(NamedTuple._fields)[i+1]
                                 )
    str1 = " ".join([
                     str1,
                     "{})".format(final_attrib_name)
                     ]
                    )
    str2 = " ".join([
                     str2,
                     "{});\n".format(final_attrib_value)
                     ]
                    )
    return(" ".join([
                     str1,
                     str2
                     ]
                    )
           )

def create_bans_sql(BanID, GameID, TeamID, ChampID, BanPos):
    sql_str = ("INSERT INTO Bans (BanID, GameID, TeamID, "
               "ChampionID, BanPosition) VALUES({}, {}, {}, {}, {});"
               "").format(BanID, GameID, TeamID, ChampID, BanPos)
    BanID += 1
    return sql_str, BanID
# 
def init_max_counter(Dictionary):
    if not Dictionary:
        return 0
    return max(Dictionary.values())


def identify_unknown_elements(DataFrame, ColumnToSearch, Dictionary):
    missing = set()
    CurrMax = init_max_counter(Dictionary)
    
    for entity in set(DataFrame[ColumnToSearch]):
        if entity not in list(Dictionary.keys()):
            CurrMax += 1
            Dictionary[entity] = CurrMax
            missing.add(entity)
    return Dictionary, missing, CurrMax
#--------- End of Functions ---------#


player_ids = {}     # Use the player's prohandle as keys and a unique integer as a value
team_ids = {}       # Create a dictionary where the team name is the key and the value is a unique integer
champion_ids = {}   # Create a dictionary where the champion name is the key and the value is a unique integer
position_ids = {}   # Create a dictionary where the position name is the key and the value is a unique integer
league_ids = defaultdict(lambda: defaultdict(dict))     # Create a dictionary 

# Connect to the database
conn = sqlite3.connect('ProLoL.db')
# Create an object to interact with the db
c = conn.cursor()

"""
Try and grab data from the database. In the exception where a table does
not exist then I assume none of the tables exist. Python will then grab
and execute the schema to create the tables and run the SQL file which
populates the newly created Regions and Positions table. Otherwise we
grab the names and associated ids from specific tables currently in the
database.
"""
try:
    # Grab the db's association of Players with PlayerIDs
    for row in c.execute(("SELECT PlayerID, ProHandle "
                         "FROM Players;"
                          )
                         ):
        player_ids[row[1]] = int(row[0])

    # Grab the db's association of Teams with TeamIDs
    for row in c.execute('SELECT TeamID, TeamName FROM Teams;'):
        team_ids[row[1]] = int(row[0])   

    # Grab the db's association of Champions with ChampionIDs
    for row in c.execute(("SELECT ChampionID, ChampionName"
                         "FROM Champions;"
                          )
                         ):
        champion_ids[row[1]] = int(row[0])

# If the table does not exist then
# execute the SQL file containing the schema
except sqlite3.OperationalError:
    with open('Tables/ProLoL.sql', 'r') as sql_query:
        schema =  sql_query.read()
    c.executescript(schema)
    
    with open('Initialize.sql', 'r') as sql_query:
        init = sql_query.read()
    c.executescript(init)
    conn.commit()

# Grab the db's association of Positions with PositionIDs
for row in c.execute('SELECT PositionID, PositionAbbrv FROM Positions;'):
    position_ids[row[1]] = int(row[0])

# Grab the db's association of Regions with RegionIDs
for row in c.execute('SELECT LeagueID, RegionID, LeagueAbbrv FROM Leagues;'):
    league_ids[row[-1]]['LeagueID'] = int(row[0])
    league_ids[row[-1]]['RegionID'] = int(row[1])
 
# Initialize a counter representing the total number
# of champions recorded for adding champs to the DB
champion_id_curr_max = init_max_counter(champion_ids)
# Assign 
champion_ids['Missed Ban'] = 0

data = pd.read_csv(("Raw Data/"
                    "2020 spring match data OraclesElixir "
                    "2020-05-15.csv"
                    ),
                   low_memory=False,
                   na_filter=True
                   )

# Grab all teams except the LPL as they don't 
# provide detailed data regarding their games
data = data[data['league'].isin([
                                 'LCS',
                                 'LCS.A',
                                 'CBLOL',
                                 'LEC',
                                 'PCS',
                                 'LCK',
                                 'TCL'
                                 ]
                                )
            ]

# I'm aiming to have a database in strictly 3rd Normalized form.
# In short, I don't want any data I can derive.
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

# Drop all derivable stats
data = data.drop(derivable_stats, axis = 1)

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

# Personal preference to capitalize Huhi and Aphro.
# I could probably use a string method to blanket this preference
# and if I notice a plethora of lower cased name I probably will.
data['player'] = data.player.replace({'huhi':'Huhi',
                                      'aphromoo':'Aphromoo'})

# The multiple locations where champions are found
champion_cols = ['ChampionID',
                 'ban1',
                 'ban2',
                 'ban3',
                 'ban4',
                 'ban5']

# Make sure any column that holds a champion name conforms to a uniform
# spelling of certain champion names.  
for col in champion_cols:
    # There's an instance where a champion name is blank...
    data[col] = data[col].str.strip().replace('',np.nan)
    data[col] = data[col].replace({'Kai\'sa':'Kai\'Sa',
                                   'Vel\'koz':'Vel\'Koz',
                                   'Kha\'zix': 'Kha\'Zix',
                                   'Cho\'gath':'Cho\'Gath',
                                   'Kog\'maw':'Kog\'Maw',
                                   'Nunu': 'Nunu & Willump'
                                   }
                                  )
    
    for champion in set(data[col]):
        champ_keys = list(champion_ids.keys())
        is_null = pd.isnull(champion)
        if (champion not in champ_keys) and (is_null == False):
            champion_id_curr_max += 1
            champion_ids[champion] = champion_id_curr_max
            c.execute(("INSERT INTO Champions (ChampionID,"
                      "ChampionName) VALUES(?,?);"),
                      ([
                          champion_id_curr_max,
                          champion
                        ]
                       )
                      )
conn.commit()

pros = data[(data.player.notnull())]

(player_ids,
 missing_pros,
 player_id_curr_max
 ) = identify_unknown_elements(pros,
                               'player',
                               player_ids
                               )

teams = data[data['position'] == 'team']
(team_ids,
 missing_teams,
 team_id_curr_max) = identify_unknown_elements(teams,
                                               'TeamID',
                                               team_ids
                                               )

"""

"""
if(len(missing_teams) > 0):
    for team in missing_teams:
        # Find the frequency of which lanes they played in
        temp = teams[(teams.TeamID == team)].league.value_counts()
        # Grab the lane/position id
        leagueabbrv = temp.keys().tolist()[0]
        c.execute(("INSERT INTO Teams (TeamID, TeamName, LeagueID,"
                   "RegionID) VALUES(?,?,?,?)"),
                  ([team_ids[team],
                    team, league_ids[leagueabbrv]['LeagueID'],
                    league_ids[leagueabbrv]['RegionID']
                    ]
                   )
                  )
    # Commit the inserts to the db
    conn.commit()

# Substitute our PlayerIDs, TeamIDs, ChampionIDs, and PositionIDs
# in place of the provided values.
data.loc[:,'PlayerID'] = data['player'].replace(player_ids)
data.loc[:,'TeamID'] = data['TeamID'].replace(team_ids)
data.loc[:,'ChampionID'] = data['ChampionID'].replace(champion_ids)
data.loc[:,'position'] = data['position'].replace(position_ids)

# Capitalize the position abbreviations enables easier mapping
# of our db's PositionIDs over the provided abbreviations
data['position'] = data['position'].str.capitalize()

# Subset the data and grab all rows related
# to the team's performance for their matches 
Teams = data[data['player'].isnull()]

# Subset the data and grab all rows related
# to a player's performance for a given match
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

# From the dataframe consisting of the pro's performance,
# drop all stats not relating to the player
Players = Players.drop(non_player_stats,axis=1)

# As it stands, this information is needed in both
# the Players dataframes. So I sneak it to the front of the list
## I dont think this is needed. Need to investigate.
non_player_stats.insert(0,'patch')
non_player_stats.insert(0,'result')
non_player_stats.insert(0,'side')
non_player_stats.insert(0,'TeamID')
non_player_stats.insert(0,'gameid')

# From the dataframe consisting of the team's performance,
# drop all stats NOT related to the objectives
Teams = Teams[non_player_stats]

# If any of the bans contain an nan, then a team
# failed to ban.  Convert the nan to the value
# associated with the "Missed Ban" key in the database
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

"""
After converting the positions to their integer value we add the
players to the database.  By default Oracle Elixir's match dataset
does not provide what role a player *generally* plays.  Instead it
notes which lane a player resided in during laning phase.

This leads to the edge case for assigning positions to a player when
a player has played in more than one lane.  This is generally the
result of a team making a strategic decision to obtain a more
favorable lane matchup.  As conseqeunce, the swapped players are
noted to have played in their non-native lane.

The following for statement guards against the possibility of
falsely assigning a player's position.  By using pandas'
value_counts() we obtain the frequency with which a player has
played in a particular lane.  From there we assign their position by
choosing the lane with the highest frequency.
"""
# Check if there are any pros which need to be added to the database
if(len(missing_pros) > 0):
    for pro in missing_pros:
        # Grab the pro's ID from the dictionary
        player_id = player_ids[pro]
        # Find the frequency of which lanes they played in
        temp = Players[(Players.player == pro)].position.value_counts()
        # Grab the lane/position id
        pos_id = temp.keys().tolist()[0]
        # Utilize Python's auto-concatenate function
        # to meet PEP 8 standards
        c.execute(
            ("INSERT INTO Players (PlayerID, ProHandle, PositionID) "
             "VALUES(?,?,?);"),
                  ([player_id,
                    pro,
                    pos_id]
                   )
                  )
    # Commit the inserts to the database
    conn.commit()
    
"""
When data regarding the number of objectives a team secured is missing
I am able to manually correct the errors after investigating the match
url or reviewing the vod.  Player performance data isn't as straight
forward as counting the number or types of dragons a team secured.
There are a lot of factors that influence the amount of EXP, CS, and
Gold a player can have at the 10 and 15 minute mark.  My solution is
to subset the data at a player level and fill in missing values with
the median value of their performance for a given field. 
"""

# Subset the pro's performance data and grab
# all rows with missing values.
missing_data = Players[Players.isna().any(axis=1)]
# Grab the names of pros who have gaps in their data
pros = set(missing_data.player)
for pro in pros:
    # Subset the data and grab only the performance
    # data associated with the player
    temp = Players[(Players['player'] == pro)]
    # Create a list containing the indices of which rows
    # have the nan values
    rows = temp.index[temp.isna().any(axis=1)].tolist()
    
    for idx in rows:
        # Extract a list of the columns containing
        # nan values for the row
        cols = temp.columns[temp.isna().any()].tolist()
        # Calculate the median value for each missing metric
        # and overwrite the nan value at the given index in
        for metric in cols:
            Players.at[idx, metric] = temp[metric].median(skipna=True)

# Use defaultdict and lambda to create
# nested dictionaries to store the parsed data
MatchResults = defaultdict(lambda: defaultdict(dict))
PlayerPerfs = defaultdict(lambda: defaultdict(dict))
TeamObjs = defaultdict(lambda: defaultdict(dict))
TeamBans = defaultdict(lambda: defaultdict(dict))


BanMetrics = ['ban1', 'ban2', 'ban3', 'ban4', 'ban5']

TeamObjMetrics = ['FirstDrake', 'InfernalDrakes','MountainDrakes',
                  'CloudDrakes','OceanDrakes', 'ElderDrakes', 'Heralds',
                  'FirstBaron', 'Barons', 'FirstTower', 'Towers',
                  'FirstMidTower', 'FirstToThreeTowers','Inhibitors',
                  'TeamID'
                  ]

PlayerPerfMetrics = ['PlayerID','ChampionID','Kills', 'Deaths',
                     'Assists', 'DoubleKills', 'TripleKills',
                     'QuadraKills', 'PentaKills', 'FirstBloodKill',
                     'FirstBloodAssist', 'FirstBloodVictim',
                     'DamageToChampions', 'WardsPlaced', 'WardsKilled',
                     'ControlWardsBought', 'VisionScore', 'TotalGold',
                     'EarnedGold', 'GoldSpent', 'MinionKills',
                     'FriendlyMonstersKilled', 'EnemyMonstersKilled',
                     'GoldAtTen', 'XpAtTen','CsAtTen', 'GoldAtFifteen',
                     'XpAtFifteen', 'CsAtFifteen'
                     ]

# Iterate over each row in the Teams dataframe as named tuples
for TeamRes in Teams.itertuples():
    team_id = TeamRes.TeamID
    game_id = TeamRes.gameid
    game_length = TeamRes.gamelength
    game_url = '\'' + TeamRes.url + '\''
    game_date = TeamRes.date
    
    # If this is the first time looking at this match we record the date
    # played, the duration of the match, the patch played on, and the
    # URL to the game on Riotofficial site.
    if game_id not in MatchResults:
        # Parse and add the date to the dict  '%Y-%m-%d %H:%M:%S')
        MatchResults[game_id]['DatePlayed'] = datetime.strptime(
            game_date,
            '%m/%d/%Y %M:%S'
            )
        MatchResults[game_id]['GameLength'] = parse_game_length(
            game_length
            )
        MatchResults[game_id]['OnPatch'] = TeamRes.patch
        MatchResults[game_id]['GameURL'] = game_url

    # Parse the champions banned by the team
    TeamBans = update_ledger(TeamBans, TeamRes, BanMetrics)
    # Parse the objectives secured by the team
    TeamObjs = update_ledger(TeamObjs, TeamRes, TeamObjMetrics)

    # Record which side the team played from
    if TeamRes.side == 'Blue':                   
        MatchResults[game_id]['BlueSideTeamID'] = team_id
    else:
        MatchResults[game_id]['RedSideTeamID'] = team_id

    # Record whether the given team was the victor
    if TeamRes.result == 1:
        MatchResults[game_id]['WinningTeamID'] = team_id     

    # Grab the players who played for the tean in the match 
    temp = Players.loc[(Players['gameid'] == game_id)
                       & (Players['TeamID'] == team_id)]
    
    # Iterate over the named tuples of the participating players 
    for Player in temp.itertuples():
        # Record which position they played in the match
        MatchResults = find_player_pos(MatchResults, Player)
        # Record the player's performance in the given match
        PlayerPerfs = player_update_ledger(PlayerPerfs,
                                           Player,
                                           PlayerPerfMetrics)

print("Parsing Data Completed")

ex_match_id = list(PlayerPerfs.keys())[0]
ex_player_id = list(PlayerPerfs[ex_match_id].keys())[0]
ex_team_id = list(TeamBans[ex_match_id].keys())[0]

# Create named tuples to facilitate
# converting the data into SQL statements
MatchResTuple = namedtuple('MatchResTuple',
                               sorted(MatchResults[ex_match_id])
                               )
PlayerPerfTuple = namedtuple('PlayerPerfTuple',
                             sorted(PlayerPerfs[ex_match_id][ex_player_id
                                                             ]
                                    )
                             )
TeamBansTuple = namedtuple('TeamBansTuple',
                           sorted(TeamBans[ex_match_id][ex_team_id])
                           )
TeamObjectivesTuple = namedtuple('TeamObjectivesTuple',
                                 sorted(TeamObjs[ex_match_id][ex_team_id
                                                              ]
                                        )
                                 )

"""
  No no, I need to do the following to
  initialize a BanID and GameID counter:

  # Get starting GameID
  GameID = c.execute("SELECT COUNT(G.GameID)+1 FROM Games G")
  # Get starting BanID
  BanID = c.execute("SELECT COUNT(B.BanID)+1 FROM Bans B")
"""
GameID = 1                                                                                      
BanID = 1

for match in MatchResults:
    # Store the contents of the match into the appropriate named tuple
    MatchTemp = MatchResTuple(**MatchResults[match])
    # Transform the data into a SQL DDL query
    MatchQuery = create_sql(MatchTemp, "Games", GameID)
    # Execute the query in the database
    c.execute(MatchQuery)
    
    for player in sorted(PlayerPerfs[match]):
        # Store the contents of the match
        # into the appropriate named tuple
        PlayerTemp = PlayerPerfTuple(
            **PlayerPerfs[match][player]
            )
        # Transform the data into a SQL DDL query
        PlayerPerfQuery = create_sql(PlayerTemp,
                                     "Performances",
                                     GameID
                                     )
        # Execute the query in the database
        c.execute(PlayerPerfQuery)
        
    for team in sorted(TeamObjs[match]):
        # Store the contents of the match
        # into the appropriate named tuple
        ObjectivesTemp = TeamObjectivesTuple(
            **TeamObjs[match][team]
            )
        # Transform the data into a SQL DDL query
        TeamObjectivesQuery = create_sql(ObjectivesTemp,
                                         "Objectives",
                                         GameID
                                         )
        # Execute the query in the database
        c.execute(TeamObjectivesQuery)

        for ban in TeamBans[match][team]:
            # Grab the banned champion
            ChampionID = TeamBans[match][team][ban]
            #Grab their position in the ban
            BanPosition = ban[-1]
            # Transform the data into a SQL
            # DDL query and update the BanID
            sql_query, BanID = create_bans_sql(BanID,
                                               GameID,
                                               team,
                                               ChampionID,
                                               BanPosition
                                               )
            # Execute the query in the database
            c.execute(sql_query)
    GameID += 1
# Commit the changes to the database
conn.commit()
