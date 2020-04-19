from datetime import date, time, datetime
from collections import defaultdict
import pandas as pd
import sqlite3
import time

def find_player_pos(Dictionary, Player):
    for key in position_ids:
        if position_ids[key] == Player.position:
            Dictionary[Player.gameid]["".join([Player.side,"Side",key,"ID"])] = int(Player.playerid)
    return Dictionary


######
# These are similiar enough I could probably merge them into one function
# A task for a later time
def record_player_performance(Dictionary, Player):
    gameid = Player.gameid
    metrics = ['champion', 'kills', 'deaths', 'assists', 'doublekills', 'triplekills', 'quadrakills', 'pentakills',
               'firstbloodkill', 'firstbloodassist', 'firstbloodvictim', 'damagetochampions', 'wardsplaced', 'wardskilled',
               'controlwardsbought', 'visionscore', 'totalgold', 'earnedgold', 'goldspent', 'minionkills', 'monsterkills',
               'monsterkillsownjungle', 'monsterkillsenemyjungle','goldat10', 'xpat10','csat10', 'goldat15', 'xpat15',
               'csat15']
    performance = {word: getattr(Player, word) for word in metrics}
    Dictionary[gameid][Player.playerid][Player.gameid] = performance
    return Dictionary


def record_team_objectives(Dictionary, Match):
    gameid = Match.gameid
    metrics = ['firsttower', 'firstmidtower','firsttothreetowers', 'firstdragon',
               'firstbaron', 'barons', 'heralds', 'towers', 'dragons', 'elementaldrakes',
               'infernals', 'mountains', 'clouds', 'oceans', 'elders', 'inhibitors'
               ]
    performance = {word: getattr(Match, word) for word in metrics}
    Dictionary[gameid][Match.team][Match.gameid] = performance
    return Dictionary
#####

def parse_game_length(seconds):
    return datetime.strptime((":".join([str(int(seconds / 3600)), str(int((seconds % 3600) /60 )), str(int((seconds % 60)% 60))])),'%H:%M:%S').time()


conn = sqlite3.connect('PATH TO DATABASE')
c = conn.cursor()
# Grab the Database's association of Players with PlayerIDs
player_ids = {}
for row in c.execute('SELECT PlayerID, ProHandle FROM Players;'):
    player_ids[row[1]] = int(row[0])
#print(player_ids)

# Grab the Database's association of Teams with TeamIDs
team_ids = {}
for row in c.execute('SELECT TeamID, TeamName FROM Teams;'):
    team_ids[row[1]] = int(row[0])   
#print(team_ids)

champion_ids = {}
for row in c.execute('SELECT ChampionID, ChampionName FROM Champions;'):
    champion_ids[row[1]] = int(row[0])
#print(champion_ids)

position_ids = {}
for row in c.execute('SELECT PositionID, PositionAbbrv FROM Positions;'):
    position_ids[row[1]] = int(row[0])
#print(position_ids)

data = pd.read_csv("2020-spring-match-data-OraclesElixir-2020-04-13d.csv",low_memory=False)

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

# In my database Aphromoo and Huhi are capitalized 
data['player'] = data['player'].replace({'huhi':'Huhi', 'aphromoo':'Aphromoo'})

# Grab onlt the LCS and Academy Teams
data =  data[data['league'].isin(['LCS','LCS.A'])]
data.loc[:,'playerid'] = data['player'].map(player_ids)
data.loc[:,'team'] = data['team'].replace(team_ids)

# Grab the rows consisting of the team objective stats
Teams = data[data['playerid'].isnull()]     # Alternatively, something like "NATeams['position'] == 'team'" would also work
# Find the players not in the database
missing = Teams[(Teams.playerid.isnull()) & (Teams.player.notnull())]
if len(set(missing['player'])) > 0:
    print("Error: Players are missing from the Dictionary")
    print(missing)
    input()
              
#Drop the team rows from the Player Dataframe
Players = data[data['player'].notnull()]
non_player_stats = ['url',
                    'date',
                    'ban1',
                    'ban2',
                    'ban3',
                    'ban4',
                    'ban5',
                    'gamelength',
                    'result',
                    'firstdragon',
                    'dragons',
                    'elementaldrakes',
                    'infernals',
                    'mountains',
                    'clouds',
                    'oceans',
                    'elders',
                    'heralds',
                    'firstbaron',
                    'barons',
                    'firsttower',
                    'towers',
                    'firstmidtower',
                    'firsttothreetowers',
                    'inhibitors']

# From the dataframe consisting of the pro's performance, drop all stats relating to objectives
Players = Players.drop(non_player_stats,axis=1)
Players.loc[:,'champion'] = Players['champion'].replace(champion_ids)
Players['position'] = Players['position'].str.capitalize()
Players.loc[:,'position'] = Players['position'].replace(position_ids)

##Players.to_csv('Player Stats.csv', index=False)

# From the dataframe consisting of the team's performance, dropp all stats NOT related to the objectives
non_player_stats.insert(0,'result')
non_player_stats.insert(0,'side')
non_player_stats.insert(0,'team')
non_player_stats.insert(0,'gameid')


Teams = Teams[non_player_stats]
Teams.to_csv('Pre Change.csv',index=False)
Teams.loc[:,'ban1'] = Teams['ban1'].replace(champion_ids)
Teams.loc[:,'ban2'] = Teams['ban2'].replace(champion_ids)
Teams.loc[:,'ban3'] = Teams['ban3'].replace(champion_ids)
Teams.loc[:,'ban4'] = Teams['ban4'].replace(champion_ids)
Teams.loc[:,'ban5'] = Teams['ban5'].replace(champion_ids)

Teams.to_csv('Team_Stats.csv', index=False)

MatchResults = defaultdict(lambda: defaultdict(dict))
PlayerPerformances = defaultdict(lambda: defaultdict(dict))
TeamObjectives = defaultdict(lambda: defaultdict(dict))

for TeamResult in Teams.itertuples():
    if TeamResult.gameid not in MatchResults:
        # Parse the date
        MatchResults[TeamResult.gameid]['DatePlayed'] = datetime.strptime(TeamResult.date, '%m/%d/%Y %M:%S')
        # Parse the game length
        MatchResults[TeamResult.gameid]['GameLength'] = parse_game_length(TeamResult.gamelength)

    ###print(TeamResult)
    TeamObjectives = record_team_objectives(TeamObjectives, TeamResult)
    ###print(TeamObjectives)
    ###input()
    if TeamResult.side == 'Blue':
        MatchResults[TeamResult.gameid]['BlueSideTeamID'] = TeamResult.team
    else:
        MatchResults[TeamResult.gameid]['RedSideTeamID'] = TeamResult.team
    if TeamResult.result == 1:          
        MatchResults[TeamResult.gameid]['WinningTeamID'] = TeamResult.team
    ###print(MatchResults)
        
    temp = Players.loc[(Players['gameid'] == TeamResult.gameid) & (Players['team'] == TeamResult.team)]
    for Player in temp.itertuples():
        #print(row)
        MatchResults = find_player_pos(MatchResults, Player)
        PlayerPerformances = record_player_performance(PlayerPerformances, Player)
        #print(row)

        ###print(PlayerPerformances)
        ###input()
print("Parsing Data Completed")
print(MatchResults.keys())
print(MatchResults['ESPORTSTMNT06/1170837'])
##with open('Matches.sql', 'w+'):
##    f.write('--- Auto-Generated SQL Queries ---\n\n')
##        for match in MatchResults.key():
##            f.write('INSERT INTO Games ) (GameID, OnPatch, DatePlayed, GameLength, BlueSideTeamID, RedSideTeamID, WinningTeam, RedSideTopID, RedSideJungleID, RedSideMidID, RedSideBottomID, RedSideSupportID, BlueSideTopID, BlueSideJungleID, BlueSideMidID, BlueSideBottomID, BlueSideSupportID)

