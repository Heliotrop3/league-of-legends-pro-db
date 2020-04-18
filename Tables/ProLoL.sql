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
	
	RedSideTop INTEGER NOT NULL,
	RedSideJungle INTEGER NOT NULL,
	RedSideMid INTEGER NOT NULL,
	RedSideBottom INTEGER NOT NULL,
	RedSideSupport INTEGER NOT NULL,
	
	BlueSideTop INTEGER NOT NULL,
	BlueSideJungle INTEGER NOT NULL,
	BlueSideMid INTEGER NOT NULL,
	BlueSideBottom INTEGER NOT NULL,
	BlueSideSupport INTEGER NOT NULL,
	
	FOREIGN KEY (BlueSideTeamID) 
        REFERENCES Teams (TeamID)
    FOREIGN KEY (RedSideTeamID) 
        REFERENCES Teams (TeamID)
		
    FOREIGN KEY (RedSideTop) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideJungle) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideMid) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideBottom) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (RedSideSupport) 
        REFERENCES Players (PlayerID)
		
	FOREIGN KEY (BlueSideTop) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideJungle) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideMid) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideBottom) 
        REFERENCES Players (PlayerID)
	FOREIGN KEY (BlueSideSupport) 
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
	FriendlyMonsterKills INTEGER NOT NULL CHECK(FriendlyMonsterKills >= 0),  -- How many jungle camps on your side did they take
	EnemyMonsterKills INTEGER NOT NULL CHECK(EnemyMonsterKills >= 0),        -- How many jungle camps on the enemy side did they take
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
	ObjectiveID INTEGER PRIMARY KEY,
	ObjectiveName VARCHAR(20) NOT NULL
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