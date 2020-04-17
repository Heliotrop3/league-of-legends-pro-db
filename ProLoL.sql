/*
	The basic structure for the Tables
*/

-- A table holding the information related to a professional player. If using the region table, uncomment the sections relating to CountryID
CREATE TABLE IF NOT EXISTS ProLoL.Players(
    PlayerID INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Gender VARCHAR(1) NOT NULL CHECK(Gender IS 'M' OR Gender IS 'F'),
    ProHandle VARCHAR(25) NOT NULL,
    RoleID INTEGER NOT NULL,
	ContractID INTEGER,
	--CountryID INTEGER NOT NULL,
	
    FOREIGN KEY (RoleID)
        REFERENCES InGameRoles (InGameRoleID)
	/*FOREIGN KEY (CountryID)
		REFERENCES Countries (CountryID) */
);

-- A table for in-game roles
CREATE TABLE IF NOT EXISTS ProLoL.InGameRoles(
    InGameRoleID INTEGER NOT NULL PRIMARY KEY,
    RoleName VARCHAR(20) NOT NULL UNIQUE,
	RoleAbbrv VARCHAR(10) NOT NULL UNIQUE
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
