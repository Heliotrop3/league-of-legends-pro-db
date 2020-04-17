/*
	The basic structure for the Tables
*/

-- A table holding the information related to a professional player. If using the region table, uncomment the sections relating to CountryID
CREATE TABLE IF NOT EXISTS ProLoL.Players(
    PlayerID INTEGER NOT NULL PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Age INTEGER NOT NULL CHECK(Age > 10 AND Age <110),      /* */
    Gender VARCHAR(1) NOT NULL CHECK(Gender IS 'M' OR Gender IS 'F'),
    ProHandle VARCHAR(25) NOT NULL,
    RoleID INTEGER NOT NULL,
	ContractID INTEGER
	--CountryID INTEGER NOT NULL,
	
    FOREIGN KEY (Role)
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

/* A table for holding the countries where the official professional scene is hosted 
   In a more advanced databsee this table would transform to hold a CountryName, CountryId
   and a RegionID where the RegionID references the server region the country plays on.
   For example, Canada and the United States are different countries who both play on 
   the North American Server. Thus, they would both  have the RegionID associated with 
   the North American Server, Germany, Norway, France etc would have the RegionID
   associated with the European Union server. To that end, a Regions table is included
   but not utilized.
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
	TeamID INTEGER NOT NULL,
	PlayerID INTEGER NOT NULL,
	StartDate DATE,
	EndDate DATE NOT NULL
	
	FOREIGN KEY TeamID
		REFERENCES Teams (TeamID)
	FOREIGN KEY PlayerID
		REFERENCES Players (PlayerID)
)

-- Add the Countries
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (1,'United States', 'NA');
/*
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (2,'Europe', 'EU');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (3,'South Korea', 'KR');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (4,'China', 'CN');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (5,'Southeast Asia', 'PCS');  --Specifically Taiwan, Hong Kong, Macau, and Southeast Asia minus Veitnam
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (6,'Vietnam', 'VN');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (7,'Russia', 'CIS');          --Formally known as the Commonwealth of Independent States
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (8,'Turkey', 'TR');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (9,'Brazil', 'BR');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (10,'Latin America', 'LAT');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (11,'Japan', 'JP');
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (12,'Oceania', 'OCE');
*/

/* Add the Roles 

   The  '%*% Laner' generality is due to the specific descriptors of ADC, APC, or Tanks/Bruisers fitting more within 
   describing specific champions rather than the lane taken. I.E WildTurtle could play Xerath bot lane and he wouldn't 
   be an Attack Damage Carry but he would still be IMT's bot laner
*/
INSERT INTO InGameRoles (InGameRoleID, RoleName, RoleAbbrv) VALUES (1,'Bot Laner', 'Bot' );
INSERT INTO InGameRoles (InGameRoleID, RoleName, RoleAbbrv) VALUES (2,'Support', 'Supp'  );
INSERT INTO InGameRoles (InGameRoleID, RoleName, RoleAbbrv) VALUES (3,'Mid Laner', 'Mid' );
INSERT INTO InGameRoles (InGameRoleID, RoleName, RoleAbbrv) VALUES (4,'Top Laner', 'Top' );
INSERT INTO InGameRoles (InGameRoleID, RoleName, RoleAbbrv) VALUES (5,'Jungler', 'Jg'    );

-- Add Teams
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (1,'Team Liquid', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (2,'Cloud9', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (3,'100 Thieves', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (4,'Team Dignitas', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (5,'Flyquest', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (6,'Counter Logic Gaming', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (7,'Evil Geniuses', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (8,'Golden Guardians', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (9,'Immortals', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (10,'Team SoloMid', 1);

-- Add Players
-- Cloud 9 Source: Source - https://lol.gamepedia.com/Cloud9#Player_Roster  
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(1, 'Eric'    , 'Ritchie'    , 'M', 'Licorice', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(2, 'Robert'  , 'Huang'      , 'M', 'Blaber'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(3, 'Yasin'   , 'Dinçer'     , 'M', 'Nisqy'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(4, 'Jesper'  , 'Svenningsen', 'M', 'Zven'    , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(5, 'Philippe', 'Laflamme'   , 'M', 'Vulcan'  , 2 );
-- Cloud 9 Academy: Source - https://lol.gamepedia.com/Cloud9_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(6, 'Ibrahim' , 'Allami' , 'M', 'Fudge'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(7, 'Rami'    , 'Charagh', 'M', 'Inori'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(8, 'Cristian', 'Palafox', 'M', 'Palafox', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(9, 'Calvin'  , 'Truong' , 'M', 'K1ng'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(10,'David'   , 'Bérubé' , 'M', 'Vulcan' , 2 );

-- 100 Thieves: Source - https://lol.gamepedia.com/100_Theives#Player_Roster  
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(11, 'Kim'    , 'Chan-ho', 'M', 'Ssumday' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(12, 'William', 'Hartman', 'M', 'Meteos'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(13, 'Tommy'  , 'Le'     , 'M', 'Ryoma'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(14, 'Cody'   , 'Sun'    , 'M', 'Cody Sun', 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(15, 'William', 'Chen'   , 'M', 'Stunt'   , 2 );
-- 100 Thieves Academy: Source - https://lol.gamepedia.com/100_Thieves_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(16, 'Aaron'  , 'Lee'      , 'M', 'FakeGod'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(17, 'Juan'   , 'Garcia'   , 'M', 'Contractz', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(18, 'Max'    , 'Soong'    , 'M', 'Soligo'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(19, 'Calvin' , 'Feinstein', 'M', 'Prismal'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(20, 'Brindon', 'Keesey'   , 'M', 'Breezyyy' , 2 );

-- Evil Geniuses: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(21, 'Colin'  , 'Zhao'    , 'M', 'Kumo'      , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(22, 'Dennis' , 'Johnsen' , 'M', 'Svenskeren', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(23, 'Daniele', 'di Mauro', 'M', 'Jiizuke'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(24, 'Bae'    , 'Jun-sik' , 'M', 'Bang'      , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(25, 'Tristan', 'Stidam'  , 'M', 'Zeyzal'    , 2 );
-- Evil Geniuses: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(26, 'Brandon', 'Chen'  , 'M', 'Brandini', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(27, 'Andy'   , 'Hoan'  , 'M', 'AnDa'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(28, 'Ahmad'  , 'Charif', 'M', 'Giyuu'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(29, 'Matthew', 'Chen'  , 'M', 'Deftly'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(30, 'Matthew', 'Elento', 'M', 'Matt'    , 2 );

-- Fly Quest: Source - https://lol.gamepedia.com/FlyQuest#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(31, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(32, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(33, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(34, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(35, '', ''   , 'M', ''   ,2 );
-- Fly Quest Acadmey: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(36, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(37, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(38, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(39, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(40, '', ''   , 'M', ''   ,2 );

-- Team Liquid: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(41, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(42, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(43, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(44, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(45, '', ''   , 'M', ''   ,2 );
-- Team Liquid Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(46, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(47, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(48, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(49, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(50, '', ''   , 'M', ''   ,2 );

-- Counter Logic Gaming: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(51, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(52, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(53, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(54, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(55, '', ''   , 'M', ''   ,2 );
-- Counter Logic Gaming Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(56, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(57, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(58, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(59, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(60, '', ''   , 'M', ''   ,2 );
-
-- Dignitas: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(61, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(62, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(63, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(64, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(65, '', ''   , 'M', ''   ,2 );
-- Dignitas Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(66, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(67, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(68, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(69, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(70, '', ''   , 'M', ''   ,2 );

-- Golden Guardians: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(71, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(72, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(73, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(74, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(75, '', ''   , 'M', ''   ,2 );
-- Golden Guardian Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(76, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(77, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(78, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(79, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(80, '', ''   , 'M', ''   ,2 );

-- Immortals: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(81, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(82, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(83, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(84, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(85, '', ''   , 'M', ''   ,2 );
-- Immortals Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(86, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(87, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(88, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(89, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(90, '', ''   , 'M', ''   ,2 );

-- Team Solo Mid: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(91, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(92, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(93, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(94, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(95, '', ''   , 'M', ''   ,2 );
-- Team Solo Mid Academy: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(96, ''    , '', 'M', '' ,4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(97, '', '', 'M', ''  ,5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(98, ''  , ''     , 'M', ''   ,3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(99, ''   , ''    , 'M', '',1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, RoleID ) VALUES(100, '', ''   , 'M', ''   ,2 );
