CREATE TABLE IF NOT EXISTS ProLoL.Players(
    PlayerID INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Gender VARCHAR(1) NOT NULL CHECK(Gender IS 'M' OR Gender IS 'F'),
    ProHandle VARCHAR(25) NOT NULL,
    PositionID INTEGER NOT NULL,
	ContractID INTEGER,
	--CountryID INTEGER NOT NULL,
	
    FOREIGN KEY (PositionID)
        REFERENCES Positions (PositionID)
	/*FOREIGN KEY (CountryID)
		REFERENCES Countries (CountryID) */
);

-- A table for in-game roles
CREATE TABLE IF NOT EXISTS ProLoL.Positions(
    PositionID INTEGER NOT NULL PRIMARY KEY,
    PositionName VARCHAR(20) NOT NULL UNIQUE,
	PositionAbbrv VARCHAR(10) NOT NULL UNIQUE
);

-- A table containing the a team and their associated information
CREATE TABLE IF NOT EXISTS ProLoL.Teams(
    TeamID INTEGER NOT NULL PRIMARY KEY,
    TeamName VARCHAR(50) NOT NULL UNIQUE,
    CountryID INTEGER NOT NULL,
	
	FOREIGN KEY (CountryID)
		REFERENCES Countries (CountryID)
);

/* A table for holding the countries where the official professional scene is hosted in. A more advanced database would transform this table to hold a CountryName,
   CountryId and a RegionID where the RegionID references the server region the country plays on. For example, Canada and the United States are different countries 
   who both play on the North American Server. Thus, they would both  have the RegionID associated with the North American Server, Germany, Norway, France etc 
   would have the RegionID associated with the European Union server. To that end, a Regions table is included but not (currently) utilized.
*/
CREATE TABLE IF NOT EXISTS ProLoL.Countries(
    CountryID INTEGER NOT NULL PRIMARY KEY,
    CountryName VARCHAR(20) NOT NULL UNIQUE,
	-- RegionID INTEGER NOT NULL, 
	CountryAbbrv VARCHAR(5) NOT NULL UNIQUE
	
	/*
	FOREIGN KEY (RegionID)
		REFERENCES Regions (RegionID)
	*/
);
/*
CREATE TABLE IF NOT EXISTS ProLoL.Regions(
    RegionID INTEGER NOT NULL PRIMARY KEY,
    RegionName VARCHAR(20) NOT NULL UNIQUE,
	RegionAbbrv VARCHAR(5) NOT NULL UNIQUE
);
*/

CREATE TABLE IF NOT EXISTS ProLoL.Contracts(
	ContractID INTEGER NOT NULL PRIMARY KEY,
	TeamID INTEGER NOT NULL,
	PlayerID INTEGER NOT NULL,
	StartDate DATE,
	EndDate DATE NOT NULL,
	
	FOREIGN KEY (TeamID)
		REFERENCES Teams (TeamID)
	FOREIGN KEY (PlayerID)
		REFERENCES Players (PlayerID)
);
-- Table for the champions in the game
CREATE TABLE IF NOT EXISTS ProLoL.Champions(
	ChampionID INTEGER NOT NULL PRIMARY KEY,
	ChampionName VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS ProLoL.Splits(
	SplitID INTEGER NOT NULL PRIMARY KEY,
	SplitSeason VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS ProLoL.Games(
	GameID INTEGER PRIMARY KEY,
	OnPatch FLOAT NOT NULL,
    DatePlayed DATE NOT NULL,
	GameLength TIME NOT NULL,
    BlueSideTeamID INTEGER NOT NULL,
    RedSideTeamID INTEGER NOT NULL,
	WinningTeamID INTEGER NOT NULL,
	
	RedSideTopID INTEGER NOT NULL,
	RedSideJngID INTEGER NOT NULL,
	RedSideMidID INTEGER NOT NULL,
	RedSideBotID INTEGER NOT NULL,
	RedSideSupID INTEGER NOT NULL,
	
	BlueSideTopID INTEGER NOT NULL,
	BlueSideJngID INTEGER NOT NULL,
	BlueSideMidID INTEGER NOT NULL,
	BlueSideBotID INTEGER NOT NULL,
	BlueSideSupID INTEGER NOT NULL,
	
	FOREIGN KEY (BlueSideTeamID) 
        REFERENCES Teams (TeamID)
    FOREIGN KEY (RedSideTeamID) 
        REFERENCES Teams (TeamID)
		
    FOREIGN KEY (RedSideTopID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideJngID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideMidID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideBotID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideSupID) 
        REFERENCES Players (PlayerID)
		
	FOREIGN KEY (BlueSideTopID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideJngID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideMidID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideBotID) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideSupID) 
        REFERENCES Players (PlayerID)
	
);

CREATE TABLE IF NOT EXISTS ProLoL.Performances(
	GameID INTEGER NOT NULL,
	PlayerID INTEGER NOT NULL,
	
	Kills INTEGER NOT NULL CHECK(Kills >= 0),
	Deaths INTEGER NOT NULL CHECK(Deaths >= 0),
	Assists INTEGER NOT NULL CHECK(Assists >= 0),
	DoubleKills INTEGER NOT NULL CHECK(DoubleKills >= 0),
	TripleKills INTEGER NOT NULL CHECK(TripleKills >=0) ,
	QuadraKills INTEGER NOT NULL CHECK(QuadraKills >= 0),
	PentaKills INTEGER NOT NULL CHECK(PentaKills >= 0),
	FirstBloodKill INTEGER NOT NULL CHECK(FirstBloodKill IS 1 OR FirstBloodKill IS 0),
	FirstBloodAssist INTEGER NOT NULL CHECK(FirstBloodAssist IS 1 OR FirstBloodAssist IS 0),
	FirstBloodVictim INTEGER NOT NULL CHECK(FirstBloodVictim IS 1 OR FirstBloodVictim IS 0),
	DamageToChampions INTEGER NOT NULL CHECK(DamageToChampions >= 0),
	WardsPlaced INTEGER NOT NULL CHECK(WardsPlaced >= 0),
	WardsKilled INTEGER NOT NULL CHECK(WardsKilled >= 0),
	ControlWardsBought INTEGER NOT NULL CHECK(ControlWardsBought >= 0),
	VisionScore INTEGER NOT NULL CHECK(VisionScore >=0),   --Due to how this metric is calculated, I cannot derive the value. Source: https://leagueoflegends.fandom.com/wiki/Vision_score
	TotalGold INTEGER NOT NULL CHECK(TotalGold >= 0),
	EarnedGold INTEGER NOT NULL CHECK(EarnedGold >= 0),   -- The total gold earned minus the earned gold and the gold generation. Perhaps I could derive this? Would need to know the formula for gold generation over time.
	GoldSpent INTEGER NOT NULL CHECK(GoldSpent >= 0),
	MinionKills INTEGER NOT NULL CHECK(MinionKills >= 0),
	FriendlyMonstersKilled INTEGER NOT NULL CHECK(FriendlyMonstersKilled >= 0),  -- How many jungle camps on your side did they take
	EnemyMonstersKilled INTEGER NOT NULL CHECK(EnemyMonstersKilled >= 0),        -- How many jungle camps on the enemy side did they take
	GoldAtTen INTEGER NOT NULL CHECK(GoldAtTen >= 0),
	XpAtTen INTEGER NOT NULL CHECK(XpAtTen >=0 ),
	CsAtTen INTEGER NOT NULL CHECK(CsAtTen >= 0),
	GoldAtFifteen INTEGER NOT NULL CHECK(GoldAtFifteen >= 0),
	XpAtFifteen INTEGER NOT NULL CHECK(XpAtFifteen >= 0),
	CsAtFifteen INTEGER NOT NULL CHECK(CsAtFifteen >= 0),
	
	PRIMARY KEY (GameID, PlayerID) -- Composite Key
	
	FOREIGN KEY (GameID)
		REFERENCES Games (GameID)
	FOREIGN KEY (PlayerID)
		REFERENCES Players (PlayerID)
);

CREATE TABLE IF NOT EXISTS ProLoL.Objectives(
	GameID INTEGER NOT NULL,
	TeamID INTEGER NOT NULL,
	
	FirstTower INTEGER NOT NULL CHECK(FirstTower IS 1 OR FirstTower IS 0),
	FirstMidTower INTEGER NOT NULL CHECK(FirstMidTower IS 1 OR FirstMidTower IS 0),
	FirstToThreeTowers INTEGER NOT NULL CHECK(FirstToThreeTowers IS 1 OR FirstToThreeTowers IS 0),
	FirstDrake INTEGER NOT NULL CHECK(FirstDrake IS 1 OR FirstDrake IS 0),
	FirstBaron INTEGER NOT NULL CHECK(FirstBaron IS 1 OR FirstBaron IS 0),
	Heralds INTEGER NOT NULL CHECK(Heralds >= 0),
	Barons INTEGER NOT NULL CHECK(Barons >= 0),
	Drakes INTEGER NOT NULL CHECK(Drakes >= 0 AND Drakes < 6),
	InfernalDrakes INTEGER NOT NULL CHECK(InfernalDrakes >= 0 AND InfernalDrakes < 6),
	MountainDrakes INTEGER NOT NULL CHECK(MountainDrakes >= 0 AND MountainDrakes < 6),
	CloudDrakes INTEGER NOT NULL CHECK(CloudDrakes >= 0 AND CloudDrakes < 6),
	OceanDrakes INTEGER NOT NULL CHECK(OceanDrakes >= 0 AND OceanDrakes < 6),
	ElderDrakes INTEGER NOT NULL CHECK(ElderDrakes >= 0),           -- Technically not an upper bound on the number of Elder Drakes a team could theoretically obtain.
	Towers INTEGER NOT NULL CHECK(Towers >= 0),           -- While Towers don't respawn I'm not sure if destroying Azir towers would count towards this number. If they do, then in the edge case no limit exists on the upper bound.
	Inhibitors INTEGER NOT NULL CHECK(Inhibitors >= 0),        
	
	PRIMARY KEY (GameID, TeamID) -- Composite Key
	FOREIGN KEY (GameID)
		REFERENCES Games (GameID)
	FOREIGN KEY (TeamID)
		REFERENCES Teams (TeamID)
);

CREATE TABLE IF NOT EXISTS ProLoL.Bans(
	BanID INTEGER NOT NULL PRIMARY KEY,
    GameID INTEGER NOT NULL,
    TeamID INTEGER NOT NULL,
    ChampionID INTEGER NOT NULL,
    
    FOREIGN KEY (GameID) 
        REFERENCES Games (GameID)
    FOREIGN KEY (TeamID) 
        REFERENCES Teams (TeamID)
    FOREIGN KEY (ChampionID) 
        REFERENCES Champions (ChampionID)
);