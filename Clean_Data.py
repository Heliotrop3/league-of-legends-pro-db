"""
Author: Tyler Huffman
Last Modified: 2020-04-21
TODO: Clean up try and except statements, see about scraping OCE data,
      add comments and doc strings to functions, and create better variable names
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
        result = {word: int(getattr(NamedTuple,
                                    word
                                    )
                            ) for word in Metrics}
    except ValueError:
        print("Value Error with Player")
        print(NamedTuple)
        for x in Metrics:
            print(("Metric: {}  "
                  "NamedTuple Value: {}").format(x,
                                                 getattr(NamedTuple,
                                                         x
                                                         )
                                                 )
                  )
        input()
    except TypeError:
        print("Type Error with Player")
        for x in Metrics:
            print(("Metric: {}  "
                  "NamedTuple Value: {}").format(x,
                                                 getattr(NamedTuple,
                                                         x
                                                         )
                                                 )
                  )
        input()
    #### THIS LINE IS WHY update_ledger AND player_update_ledger
    #### ARE SEPERATED!
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


# Create four regular dictionaries to retrieve pre-existing data from
# the database and catalogue new information.  The dicts store the
# information where the name of the entity is the key and the value is
# the entity's unique identifier.  It's important to note the key value
# for the team_ids dict is the full team name and NOT the team's
# abbreviation. This contrasts the key value of the position_ids dict
# which is a title cased abbreviation of the role.
#
# For example,
#    Player  : player_ids["Huhi"] = 1
#    Champion: champion_ids["Annie"] = 2
#    Team    : team_ids["Counter Logic Gaming"] = 3
#    Position: position_ids["Jng"] = 4

player_ids = {}
team_ids = {}
champion_ids = {}
position_ids = {}


league_ids = defaultdict(lambda: defaultdict(dict))

# Connect to the database
conn = sqlite3.connect('ProLoL.db')
# Create an object to interact with the db
c = conn.cursor()

# Try and grab data from the database.  In the exception where a table
# does not exist then I assume none of the tables exist. Python will
# then grab and execute the schema to create the tables and run the SQL
# file which populates the newly created Regions and Positions table.
# Otherwise we grab the names and associated ids from specific tables
# currently in the database.
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

# Grab the db's association of
for row in c.execute(("SELECT LeagueID, RegionID, LeagueAbbrv"
                     "FROM Leagues;")):
    league_ids[row[-1]]['LeagueID'] = int(row[0])
    league_ids[row[-1]]['RegionID'] = int(row[1])
 
# Initialize a counter representing the total number
# of champions recorded for adding champs to the DB
champion_id_curr_max = init_max_counter(champion_ids)

# Ensure we can handle the case where a team failed to ban a champion
champion_ids['Missed Ban'] = 0

# Read in the data
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

# Personal preference to capitalize Huhi and Aphro.  I could probably
# use a string method to blanket this preference across all pro names
# and if I notice a plethora of lower cased names I probably will.
data['player'] = data.player.replace({'huhi':'Huhi',
                                      'aphromoo':'Aphromoo'})

# Store the column names of where champion names occur
champion_cols = ['ChampionID',
                 'ban1',
                 'ban2',
                 'ban3',
                 'ban4',
                 'ban5']

# Make sure the columns containing champion names are clean
# and ready to map their associated ID values to
for col in champion_cols:
    # There's an instance where a champion name is blank...
    data[col] = data[col].str.strip().replace('',np.nan)
    
    # Ensure certain champion names are either correctly capitalized
    data[col] = data[col].replace({'Kai\'sa':'Kai\'Sa',
                                   'Vel\'koz':'Vel\'Koz',
                                   'Kha\'zix': 'Kha\'Zix',
                                   'Cho\'gath':'Cho\'Gath',
                                   'Kog\'maw':'Kog\'Maw',
                                   'Nunu': 'Nunu & Willump'
                                   }
                                  )
    
    # Grab and iterate over the list of unique
    # champions in the current column.
    for champion in set(data[col]):
        # Grab the list of current champion names
        champ_keys = list(champion_ids.keys())

        # Determine if the value of champion is nan
        is_null = pd.isnull(champion)

        # If the champion is NOT recorded AND NOT nan then the
        # counter representing the current max ID value is increased
        # by one, the champion is added to the dict, and the champion
        # is added into the database.
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
# Commit the changes to the database
conn.commit()

# Subset the data and grab all rows related to player performance
Pros = data[(data.player.notnull())]

# Find any player's who are NOT in the database
(player_ids,
 missing_pros,
 player_id_curr_max
 ) = identify_unknown_elements(Pros,
                               'player',
                               player_ids
                               )
# Subset the data and grab only the rows related to team performance
Teams = data[data['position'] == 'team']

# Find any teams that are NOT in the database
(team_ids,
 missing_teams,
 team_id_curr_max) = identify_unknown_elements(teams,
                                               'TeamID',
                                               team_ids
                                               )

# I handle adding teams into the database like players: assign their
# region based on frequency of playing in said region. For Oracle's
# dataset I don't think this is necessary.  If/When I create one giant
# spreadsheet of aggregated data from various seasons and tourneys is
# when I think this method would be necessary.  This method would
# incorrectly label teams that only ever participated in tournaments
# and where never part of the professional scene. Specifically thinking
# about the early years of league.
if(len(missing_teams) > 0):
    for team in missing_teams:
        # Find the frequency of which regions they played in
        temp = teams[(teams.TeamID == team)].league.value_counts()
        # Grab the lane/position id
        leagueabbrv = temp.keys().tolist()[0]
        # Insert the team into the database
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

# Substitute the PlayerIDs, TeamIDs, ChampionIDs, and PositionIDs
# for the provided values of the main dataframe
data.loc[:,'PlayerID'] = data['player'].replace(player_ids)
data.loc[:,'TeamID'] = data['TeamID'].replace(team_ids)
data.loc[:,'ChampionID'] = data['ChampionID'].replace(champion_ids)
data.loc[:,'position'] = data['position'].replace(position_ids)

# Capitalize the position abbreviations enables easier mapping
# of our db's PositionIDs over the provided abbreviations
data['position'] = data['position'].str.capitalize()

# Re-subset the transformed data again grabbing all rows related
# to a team's performance for a given match
Teams = data[data['player'].isnull()]

# Re-Subset the transformed data again grabbing all rows related
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
## I don't think this is needed. Need to investigate.
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


# After converting the positions to their integer value we add the
# players to the database.  By default Oracle Elixir's match dataset
# does not provide what role a player *generally* plays.  Instead it
# notes which lane a player resided in during laning phase.
#
# This leads to the edge case for assigning positions to a player when
# a player has played in more than one lane.  This is generally the
# result of a team making a strategic decision to obtain a more
# favorable lane matchup.  As consequence, the swapped players are
# noted to have played in their non-native lane.
#
# The following for statement guards against the possibility of
# falsely assigning a player's position.  By using pandas'
# value_counts() we obtain the frequency with which a player has
# played in a particular lane.  From there we assign their position by
# choosing the lane with the highest frequency.

# Check if there are any pros which need to be added to the database
if(len(missing_pros) > 0):
    for pro in missing_pros:
        # Grab the pro's ID from the dictionary
        player_id = player_ids[pro]
        
        # Find the frequency of which lanes they played in
        temp = Players[(Players.player == pro)].position.value_counts()
        
        # Grab the lane/position id
        pos_id = temp.keys().tolist()[0]
        
        # Insert the pro's information into the database
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
    
# When data regarding the number of objectives a team secured is missing
# I am able to manually correct the errors after investigating the match
# url or reviewing the vod.  Player performance data isn't as straight
# forward as counting the number or types of dragons a team secured.
# There are a lot of factors that influence the amount of EXP, CS, and
# Gold a player can have at the 10 and 15 minute mark.  My solution is
# to subset the data at a player level and fill in missing values with
# the median value of their performance for a given field.
#
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

BanCols = ['ban1', 'ban2', 'ban3', 'ban4', 'ban5']

# A list containing the column names of metrics related to a team's
# ability to secure objectives for the given match
TeamObjMetrics = ['FirstDrake', 'InfernalDrakes','MountainDrakes',
                  'CloudDrakes','OceanDrakes', 'ElderDrakes', 'Heralds',
                  'FirstBaron', 'Barons', 'FirstTower', 'Towers',
                  'FirstMidTower', 'FirstToThreeTowers','Inhibitors',
                  'TeamID'
                  ]

# A list containing the column names of metrics related to a player's
# performance for a given match
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

# Iterate over each team's match performance
for TeamRes in Teams.itertuples():
    # Grab the team's ID
    team_id = TeamRes.TeamID
    
    # Grab the provided unique game ID
    game_id = TeamRes.gameid

    # Grab and convert the duration of the game to a time object
    game_length = parse_game_length(TeamRes.gamelength)
    

    # Grab the url and encapsulate in apostrophes to make storing
    # the url in the database less painful later on
    game_url = '\'' + TeamRes.url + '\''

    # Grab the day and time the match was played at
    game_date = TeamRes.date
    
    # If this is the first time looking at this match we record the date
    # played, the duration of the match, the patch played on, and the
    # URL to the game on Riotofficial site.
    if game_id not in MatchResults:
        # Parse and add the date to the dict.
        #
        # For some reason, when parsing an updated copy of the data
        # for the first time, the script throws an error saying the time
        # format is incorrect.  Changing the time format to what it
        # says it expecting, '%Y-%m-%d %H:%M:%S', and re-running the
        # script will again throw the same error.  However the error says
        # the expected time format is what was originally the format
        # ('%m/%d/%Y %M:%S').  The script will successfully parse the
        # data after the format is reverted.
        MatchResults[game_id]['DatePlayed'] = datetime.strptime(
            game_date,
            '%m/%d/%Y %M:%S'
            )

        # Store the time taken for the team to win/lose
        MatchResults[game_id]['GameLength'] = game_length

        # Store which patch the game was played on
        MatchResults[game_id]['OnPatch'] = TeamRes.patch

        # Store the url to Riot's official match page
        MatchResults[game_id]['GameURL'] = game_url

    # Parse the champions banned by the team
    TeamBans = update_ledger(TeamBans, TeamRes, BanCols)
    
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

    # Grab the players who played for the team in the match
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

# I need to revisit whether or not I should even be using named
# tuples.  At the time when I initially wrote the code I had been
# programming for something like 12 hours straight and to say my
# brain was fried would be pretty accurate.  I think my logic started
# out as using namedtuple will improve readability which is generally
# true...  Until you look at the monstrosity of a function "create_sql"
# is and realize it's the Freddy Kreuger of readable code (Seriously,
# that function haunts my dreams).  I need to sit down and invest time
# into creating a function that accomplishes the same thing except nicer
# and using dictionaries.  Computer science wise I'm curious how the
# access time of namedtuple compares to that of dict.
#
# In order to use a namedtuple we have to provide an example of what
# fields our namedtuple will hold.
# Grab a match ID
ex_match_id = list(PlayerPerfs.keys())[0]
# Grab a random player ID from the previously grabbed match
ex_player_id = list(PlayerPerfs[ex_match_id].keys())[0]
# Grab a random team ID from the previously grabbed match
ex_team_id = list(TeamBans[ex_match_id].keys())[0]

# Create a named tuple based on a match in the MatchResults dict
## Check if sorting the dict like this actually does anything.
## I don't think dicts are sortable in this fashion...
MatchResTuple = namedtuple('MatchResTuple',
                               sorted(MatchResults[ex_match_id])
                               )

# Create a named tuple based on a player's performance for a given match
PlayerPerfTuple = namedtuple('PlayerPerfTuple',
                             sorted(PlayerPerfs[ex_match_id][ex_player_id]
                                    )
                             )

# Create a named tuple based on a team's ability
# to control objectives for a given match
TeamObjectivesTuple = namedtuple('TeamObjectivesTuple',
                                 sorted(TeamObjs[ex_match_id][ex_team_id]
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

        # Parse and add the team's bans to the database
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
