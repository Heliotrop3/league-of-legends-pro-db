import pandas
import pathlib

from functools import wraps
from typing import Tuple

def load_data(clean_func):
    
    @wraps(clean_func)
    def _load_data(data_folder: pathlib.Path) -> pandas.DataFrame:
        data = pandas.DataFrame()

        for file in data_folder.iterdir():
            temp = pandas.read_csv(file)

            data = pandas.concat([data,temp])
        return clean_func(data)
    return _load_data


def clean_data(subset_func):
    
    @wraps(subset_func)
    def _clean_data(data: pandas.DataFrame) -> pandas.DataFrame:
        derivable_stats = [
                   'teamkills',
                   'teamdeaths',
                   'team kpm',
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
                   'elementaldrakes',
                   'opp_killsat10',
                   'opp_assistsat10',
                   'opp_deathsat10',
                   'opp_killsat15',
                   'opp_assistsat15',
                   'opp_deathsat15',
                   'monsterkills',
                   'damagetakenperminute',
                   'firstblood'
                   ]

        renamed_cols= {
            'year'                    : 'Year',
            'date'                    : 'Date',
            'team'                    : 'TeamID',
            'playerid'                : 'PlayerID',
            'player'                  : 'Player',
            'gameid'                  : 'GameID',
            'url'                     : 'URL',
            'league'                  : 'League',
            'split'                   : 'Split',
            'playoffs'                : 'Playoffs',
            'game'                    : 'Game',
            'patch'                   : 'Patch',
            'side'                    : 'Side',
            'position'                : 'Position',
            'gamelength'              : 'GameLength',
            'result'                  : 'Result',
            'firstdragon'             : 'FirstDrake',
            'infernals'               : 'InfernalDrakes',
            'mountains'               : 'MountainDrakes',
            'clouds'                  : 'CloudDrakes',
            'oceans'                  : 'OceanDrakes',
            'elders'                  : 'ElderDrakes',
            'heralds'                 : 'Heralds',
            'barons'                  : 'Barons',
            'firstherald'             : 'FirstHerald',
            'firstbaron'              : 'FirstBaron',
            'firsttower'              : 'FirstTower',
            'towers'                  : 'Towers',
            'firstmidtower'           : 'FirstMidTower',
            'firsttothreetowers'      : 'FirstToThreeTowers',
            'inhibitors'              : 'Inhibitors',
            'assists'                 : 'Assists',
            'champion'                : 'ChampionID',
            'controlwardsbought'      : 'ControlWardsBought',
            'csat10'                  : 'CsAt10',
            'csat15'                  : 'CsAt15',
            'total cs'                : 'TotalCs',
            'damagetochampions'       : 'DamageToChampions',
            'deaths'                  : 'Deaths',
            'doublekills'             : 'DoubleKills',
            'earnedgold'              : 'EarnedGold',
            'firstbloodassist'        : 'FirstBloodAssist',
            'firstbloodkill'          : 'FirstBloodKill',
            'firstbloodvictim'        : 'FirstBloodVictim',
            'goldat10'                : 'GoldAt10',
            'killsat10'               : 'KillsAt10',
            'deathsat10'              : 'DeathsAt10',
            'assistsat10'             : 'AssistsAt10',
            'goldspent'               : 'GoldSpent',
            'goldat15'                : 'GoldAt15',
            'killsat15'               : 'KillsAt15',
            'deathsat15'              : 'DeathsAt15',
            'assistsat15'             : 'AssistsAt15',
            'minionkills'             : 'MinionKills',
            'monsterkillsenemyjungle' : 'EnemyMonstersKilled',
            'monsterkillsownjungle'   : 'FriendlyMonstersKilled',
            'pentakills'              : 'PentaKills',
            'quadrakills'             : 'QuadraKills',
            'triplekills'             : 'TripleKills',
            'kills'                   : 'SingleKills',
            'totalgold'               : 'TotalGold',
            'visionscore'             : 'VisionScore',
            'wardskilled'             : 'WardsKilled',
            'wardsplaced'             : 'WardsPlaced',
            'xpat10'                  : 'XpAt10',
            'xpat15'                  : 'XpAt15',

            }
        data.drop(derivable_stats, axis = 1, inplace=True)
        data.rename(columns = renamed_cols, inplace=True)

        return subset_func(data)
    return _clean_data

# Probably a gross misuse of decorators buuut I wanted to learn how to use them.
@load_data
@clean_data
def subset_players_and_teams(data: pandas.DataFrame
                            ) -> Tuple[pandas.DataFrame, pandas.DataFrame]:
    player_cols = [
            'Player',
            'ChampionID',
            'Deaths',
            'Assists',
            'SingleKills',
            'DoubleKills',
            'TripleKills',
            'QuadraKills',
            'PentaKills',
            'FirstBloodKill',
            'FirstBloodAssist',
            'FirstBloodVictim',
            'DamageToChampions',
            'WardsPlaced',
            'WardsKilled',
            'ControlWardsBought',
            'VisionScore',
            'TotalGold',
            'EarnedGold',
            'GoldSpent',
            'TotalCs',
            'MinionKills',
            'FriendlyMonstersKilled',
            'EnemyMonstersKilled',
            'GoldAt10',
            'XpAt10',
            'CsAt10',
            'KillsAt10',
            'DeathsAt10',
            'AssistsAt10',
            'GoldAt15',
            'XpAt15',
            'CsAt15',
            'KillsAt15',
            'DeathsAt15',
            'AssistsAt15',
        ]

    players = data[data.Position != 'team']
    teams   = data[data.Position == 'team']

    teams = teams.drop(player_cols, axis=1)

    team_cols = [col for col in teams.columns if col not in player_cols]
    players = players.drop(team_cols, axis=1)


    return players, teams

# Path to data
data_folder = r"C:\Users\T\Documents\GitHub\league-of-legends-pro-db\RawData"
data_folder = pathlib.Path(data_folder)

p_data, t_data = subset_players_and_teams(data_folder)

