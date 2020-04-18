
/*
	Populate the database
*/

-- Add the Countries
INSERT INTO Countries (CountryID, CountryName, CountryAbbrv) VALUES (1,'United States', 'NA');
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

/* Add the Roles 

   The  '%*% Laner' generality is due to the specific descriptors of ADC, APC, or Tanks/Bruisers fitting more within 
   describing specific champions rather than the lane taken. I.E WildTurtle could play Xerath bot lane and he wouldn't 
   be an Attack Damage Carry but he would still be IMT's bot laner
*/
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (1,'Bot Laner', 'Bot' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (2,'Support', 'Supp'  );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (3,'Mid Laner', 'Mid' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (4,'Top Laner', 'Top' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (5,'Jungler', 'Jg'    );

-- Add Orgs: 
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (1 , 'Team Liquid', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (2 , 'Cloud9', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (3 , '100 Thieves', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (4 , 'Team Dignitas', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (5 , 'Flyquest', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (6 , 'Counter Logic Gaming', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (7 , 'Evil Geniuses', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (8 , 'Golden Guardians', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (9 , 'Immortals', 1);
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (10, 'Team SoloMid', 1);

/*
	Add Players (Players who are listed on rosters as subs are at the end)
	Source of Contract Data is the team's roster page minus FakeGod whose contract end date was found on:
		pagehttps://lol.gamepedia.com/Archive:Global_Contract_Database/NA/Current
	
	Cloud 9 Roster: Source - https://lol.gamepedia.com/Cloud9#Player_Roster
*/
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(1, 'Eric'    , 'Ritchie'    , 'M', 'Licorice', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(2, 'Robert'  , 'Huang'      , 'M', 'Blaber'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(3, 'Yasin'   , 'Dinçer'     , 'M', 'Nisqy'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(4, 'Jesper'  , 'Svenningsen', 'M', 'Zven'    , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(5, 'Philippe', 'Laflamme'   , 'M', 'Vulcan'  , 2 );

-- Cloud 9 Academy: Source - https://lol.gamepedia.com/Cloud9_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(6, 'Ibrahim' , 'Allami' , 'M', 'Fudge'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(7, 'Rami'    , 'Charagh', 'M', 'Inori'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(8, 'Cristian', 'Palafox', 'M', 'Palafox', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(9, 'Calvin'  , 'Truong' , 'M', 'K1ng'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(10,'David'   , 'Bérubé' , 'M', 'Vulcan' , 2 );

-- Cloud9 Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(1 , 2, 1 , DATE('2017-11-22'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(2 , 2, 2 , DATE('2018-07-21'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(3 , 2, 3 , DATE('2018-11-23'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(4 , 2, 4 , DATE('2019-11-19'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(5 , 2, 5 , DATE('2019-11-19'), DATE('2022-11-15');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(6 , 2, 6 , DATE('2019-12-13'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(7 , 2, 7 , DATE('2020-01-07'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(8 , 2, 8 , DATE('2019-11-20'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(9 , 2, 9 , DATE('2019-12-02'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(10, 2, 10, DATE('2018-11-26'), DATE('2022-11-15');


-- 100 Thieves: Source - https://lol.gamepedia.com/100_Theives#Player_Roster  
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(11, 'Kim'    , 'Chan-ho', 'M', 'Ssumday' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(12, 'William', 'Hartman', 'M', 'Meteos'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(13, 'Tommy'  , 'Le'     , 'M', 'Ryoma'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(14, 'Cody'   , 'Sun'    , 'M', 'Cody Sun', 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(15, 'William', 'Chen'   , 'M', 'Stunt'   , 2 );
-- 100 Thieves Academy: Source - https://lol.gamepedia.com/100_Thieves_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(16, 'Aaron'  , 'Lee'      , 'M', 'FakeGod'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(17, 'Juan'   , 'Garcia'   , 'M', 'Contractz', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(18, 'Max'    , 'Soong'    , 'M', 'Soligo'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(19, 'Calvin' , 'Feinstein', 'M', 'Prismal'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(20, 'Brindon', 'Keesey'   , 'M', 'Breezyyy' , 2 );

-- 100 Thieves Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(11, 3, 11, DATE('2017-11-22'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(12, 3, 12, DATE('2019-11-19'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(13, 3, 13, DATE('2019-11-26'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(14, 3, 14, DATE('2019-11-26'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(15, 3, 15, DATE('2019-11-25'), DATE('2022-11-15');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(16, 3, 16, DATE('2018-12-14'), DATE('2022-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(17, 3, 17, DATE('2019-12-02'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(18, 3, 18, DATE('2019-06-12'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(19, 3, 19, DATE('2018-12-14'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(20, 3, 20, DATE('2019-12-02'), DATE('2021-11-16');


-- Evil Geniuses: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(21, 'Colin'  , 'Zhao'    , 'M', 'Kumo'      , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(22, 'Dennis' , 'Johnsen' , 'M', 'Svenskeren', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(23, 'Daniele', 'di Mauro', 'M', 'Jiizuke'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(24, 'Bae'    , 'Jun-sik' , 'M', 'Bang'      , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(25, 'Tristan', 'Stidam'  , 'M', 'Zeyzal'    , 2 );
-- Evil Geniuses: Source - https://lol.gamepedia.com/Evil_Geniuses.NA#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(26, 'Brandon', 'Chen'  , 'M', 'Brandini', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(27, 'Andy'   , 'Hoan'  , 'M', 'AnDa'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(28, 'Ahmad'  , 'Charif', 'M', 'Giyuu'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(29, 'Matthew', 'Chen'  , 'M', 'Deftly'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(30, 'Matthew', 'Elento', 'M', 'Matt'    , 2 );

-- Evil Geniuses Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(21, 7, 21, DATE('2019-11-26'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(22, 7, 22, DATE('2019-11-19'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(23, 7, 23, DATE('2019-12-05'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(24, 7, 24, DATE('2019-11-22'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(25, 7, 25, DATE('2019-11-20'), DATE('2022-11-15');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(26, 7, 26, DATE('2020-01-03'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(27, 7, 27, DATE('2020-01-29'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(28, 7, 28, DATE('2020-01-07'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(29, 7, 29, DATE('2020-01-02'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(30, 7, 30, DATE('2020-01-02'), DATE('2020-11-17');


-- Fly Quest: Source - https://lol.gamepedia.com/FlyQuest#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(31, 'Omran'  , 'Shoura'           , 'M', 'V1per'      , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(32, 'Lucas'  , 'Tao Kilmer Larsen', 'M', 'Santorin'   , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(33, 'Tristan', 'Scharge'          , 'M', 'PowerOfEvil', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(34, 'Jason'  , 'Tran'             , 'M', 'WildTurtle' , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(35, 'Lee'    , 'Dong-geun'        , 'M', 'IgNar'      , 2 );

-- Fly Quest Acadmey: Source - https://lol.gamepedia.com/FlyQuest_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(36, 'Mohamed', 'Kaddoura', 'M', 'Revenge' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(37, 'Gabriel', 'Saucier' , 'M', 'Fanatiik', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(38, 'Stephen', 'Li'      , 'M', 'Triple'  , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(39, 'Brandon', 'Phan'    , 'M', 'Mash'    , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(40, 'Juan'   , 'Guibert' , 'M', 'JayJ'    , 2 );

-- Fly Quest Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(31, 5, 31, DATE('2018-11-27'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(32, 5, 32, DATE('2018-05-08'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(33, 5, 33, DATE('2019-11-27'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(34, 5, 34, DATE('2017-05-25'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(35, 5, 35, DATE('2019-11-20'), DATE('2021-11-16');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(36, 5, 36, DATE('2019-07-09'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(37, 5, 37, DATE('2019-12-05'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(38, 5, 38, DATE('2019-12-04'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(39, 5, 39, DATE('2019-12-03'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(40, 5, 40, DATE('2019-12-05'), DATE('2020-11-17');

-- Team Liquid: Source - https://lol.gamepedia.com/Team_Liquid#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(41, 'Jung'   , 'Eon-yeong'     , 'M', 'Impact'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(42, 'Mads'   , 'Brock-Pedersen', 'M', 'Broxah'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(43, 'Nicolaj', 'Jensen'        , 'M', 'Jensen'    , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(44, 'Yiliang', 'Peng'          , 'M', 'Doublelift', 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(45, 'Edward' , 'Ra'            , 'M', 'Tactical'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(46, 'Jo'     , 'Yong-in'       , 'M', 'CoreJJ'    , 2 );
-- Team Liquid Academy: Source - https://lol.gamepedia.com/Team_Liquid_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(47, 'Thomas' , 'Tran'      , 'M', 'Jenkins'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(48, 'Shern'  , 'Tai'       , 'M', 'Shernfire', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(49, 'David'  , 'Bloomquist', 'M', 'Yusui'    , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(50, 'Richard', 'Samuel Oh' , 'M', 'Rikara'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(51, 'Johnson', 'Cao'       , 'M', 'Cao'      , 2 );

-- Team Liquid Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(41, 1, 41, DATE('2017-11-28'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(42, 1, 42, DATE('2019-11-19'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(43, 1, 43, DATE('2018-11-19'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(44, 1, 44, DATE('2017-11-24'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(45, 1, 45, DATE('2020-02-28'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(46, 1, 46, DATE('2018-11-20'), DATE('2022-11-15');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(47, 1, 47, DATE('2019-01-08'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(48, 1, 48, DATE('2019-11-25'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(49, 1, 49, DATE('2019-12-13'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(50, 1, 50, DATE('2020-03-03'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(51, 1, 51, DATE('2019-12-13'), DATE('2021-11-16');


-- Counter Logic Gaming: Source - https://lol.gamepedia.com/Counter_Logic_Gaming#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(52, 'Kim'    , 'Hyeong-min', 'M', 'Ruin'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(53, 'Raymond', 'Griffin'   , 'M', 'Wiggily' , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(54, 'Eugene' , 'Park'      , 'M', 'Pobelter', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(55, 'Trevor' , 'Hayes'     , 'M', 'Stixxay' , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(56, 'Oh'     , 'Myeong-jin', 'M', 'Wind'    , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(57, 'Andy'   , 'Ta'        , 'M', 'Smoothie', 2 );
-- Counter Logic Gaming Academy: Source - https://lol.gamepedia.com/CLG_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(58, 'Alexey'        , 'Zatorski', 'M', 'Deus'   , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(59, 'Kristopher'    , 'Myhal'   , 'M', 'Fragas' , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(60, 'Jean-Sébastien', 'Thery'   , 'M', 'Tuesday', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(61, 'Lee'           , 'Hyo-won' , 'M', 'Fill'   , 2 );

-- Counter Logic Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(52, 6, 52, DATE('2019-05-13'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(53, 6, 53, DATE('2018-08-18'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(54, 6, 54, DATE('2020-02-19'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(55, 6, 55, DATE('2015-11-20'), DATE('2021-11-16'); -- Source for Stixxay's time at CLG: https://lol.gamepedia.com/Stixxay#Team_History  (Use exact on the table)
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(56, 6, 56, DATE('2020-03-06'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(57, 6, 57, DATE('2019-11-18'), DATE('2021-11-16');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(58, 6, 58, DATE('2019-11-27'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(59, 6, 59, DATE('2019-12-03'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(60, 6, 60, DATE('2019-12-06'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(61, 6, 61, DATE('2019-12-06'), DATE('2020-11-16');


-- Dignitas: Source - https://lol.gamepedia.com/Dignitas#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(62, 'Heo'     , 'Seung-hoon'  , 'M', 'Huni'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(63, 'Matthew' , 'Higginbotham', 'M', 'Akaadian', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(64, 'Jonathan', 'Armao'       , 'M', 'Grig'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(65, 'Henrik'  , 'Hansen'      , 'M', 'Froggen' , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(66, 'Johnson' , 'Nguyen'      , 'M', 'Johnsun' , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(67, 'Zaqueri' , 'Black'       , 'M', 'Aphromoo', 2 );
-- Dignitas Academy: Source - https://lol.gamepedia.com/Dignitas_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(68, 'Samson', 'Jackson' , 'M', 'Lourlo' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(69, 'Tanner', 'Damonte' , 'M', 'Damonte', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(70, 'Kim'   , 'Jae-hun' , 'M', 'Fenix'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(71, 'Kim'   , 'Joo-sung', 'M', 'Olleh'  , 2 );

-- Dignitas Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(62, 4, 62, DATE('2019-10-28'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(63, 4, 63, DATE('2020-03-05'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(64, 4, 64, DATE('2019-12-06'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(65, 4, 65, DATE('2019-12-09'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(66, 4, 66, DATE('2019-11-27'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(67, 4, 67, DATE('2019-12-05'), DATE('2021-11-16');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(68, 4, 21, DATE('2020-01-07'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(69, 4, 22, DATE('2019-12-16'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(70, 4, 23, DATE('2019-12-10'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(71, 4, 24, DATE('2020-01-07'), DATE('2021-11-16');

-- Golden Guardians: Source - https://lol.gamepedia.com/Golden_Guardians#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(72, 'Kevin'  , 'Yarnell' , 'M', 'Hauntzer'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(73, 'Can'    , 'Çelik'   , 'M', 'Closer'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(74, 'Greyson', 'Gilmer'  , 'M', 'Goldenglue', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(75, 'Victor' , 'Huang'   , 'M', 'FBI'       , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(76, 'Choi'   , 'Jae-hyun', 'M', 'Huhi'      , 2 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(77, 'Yuri'   , 'Jew'     , 'M', 'Keith'     , 2 );
-- Golden Guardian Academy: Source - https://lol.gamepedia.com/Golden_Guardians_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(78, 'Darshan' , 'Upadhyaya'     , 'M', 'ZionSpartan', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(79, 'Anthony' , 'Barkhotsev'    , 'M', 'Hard'       , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(80, 'Nicholas', 'Antonio Abbott', 'M', 'Ablazeolive', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(81, 'Alex'    , 'Gorcia'        , 'M', 'Gorcia'     , 1 );

-- Golden Guardians Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(72, 8, 72, DATE('2018-11-29'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(73, 8, 73, DATE('2019-11-20'), DATE('2022-11-15');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(74, 8, 74, DATE('2019-11-20'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(75, 8, 75, DATE('2019-07-05'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(76, 8, 76, DATE('2019-07-05'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(77, 8, 77, DATE('2019-11-22'), DATE('2020-11-17');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(78, 8, 78, DATE('2019-05-28'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(79, 8, 79, DATE('2018-12-18'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(80, 8, 80, DATE('2019-12-04'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(81, 8, 81, DATE('2019-12-04'), DATE('2021-11-16');


-- Immortals: Source - https://lol.gamepedia.com/Immortals#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(82, 'Paul'    , 'Boyer'     , 'M', 'sOAZ'   , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(83, 'Jake'    , 'Puchero'   , 'M', 'Xmithie', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(84, 'Jérémy'  , 'Valdenaire', 'M', 'Eika'   , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(85, 'Johnny'  , 'Ru'        , 'M', 'Altec'  , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(86, 'Apollo'  , 'Price'     , 'M', 'Apollo' , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(87, 'Nickolas', 'Surgent'   , 'M', 'Hakuho' , 2 );
-- Immortals Academy: Source - https://lol.gamepedia.com/Immortals_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(88, 'Kieran'  , 'Logue'  , 'M', 'Allorim' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(89, 'Nicholas', 'Pollock', 'M', 'Potluck' , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(90, 'David'   , 'Challe' , 'M', 'Insanity', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(91, 'Austin'  , 'Yu'     , 'M', 'Gate'    , 2 );

-- Immortal Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(82, 9, 82, DATE('2019-12-12'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(83, 9, 83, DATE('2019-11-21'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(84, 9, 84, DATE('2019-11-23'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(85, 9, 85, DATE('2019-12-04'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(86, 9, 86, DATE('2020-02-28'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(87, 9, 87, DATE('2019-12-04'), DATE('2021-11-16');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(88, 9, 21, DATE('2019-10-09'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(89, 9, 22, DATE('2020-01-01'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(90, 9, 23, DATE('2020-01-01'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(91, 9, 24, DATE('2019-10-09'), DATE('2020-11-17');


-- Team Solo Mid: Source - https://lol.gamepedia.com/Team_SoloMid#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(92, 'Sergen' , 'Çelik'   , 'M', 'Broken Blade', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(93, 'Joshua' , 'Hartnett', 'M', 'Dardoch'     , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(94, 'Søren'  , 'Bjerg'   , 'M', 'Bjergsen'    , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(95, 'Kasper' , 'Kobberup', 'M', 'Kobbe'       , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(96, 'Vincent', 'Wang'    , 'M', 'Biodaddy'    , 2 );
-- Team Solo Mid Academy: Source - https://lol.gamepedia.com/TSM_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(97, 'Niship'   , 'Doshi' , 'M', 'Dhokla' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(98, 'Mingyi'   , 'Lu'    , 'M', 'Spica'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(99, 'Jackson'  , 'Dohan' , 'M', 'Evolved', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(100, 'Lawrence', 'Hui'   , 'M', 'Lost'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(101, 'Erik'    , 'Wessén', 'M', 'Treatz' , 2 );

-- Team Solo Mid Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(92, 10, 92, DATE('2018-11-25'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(93, 10, 93, DATE('2019-11-22'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(94, 10, 94, DATE('2013-11-02'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(95, 10, 95, DATE('2019-11-24'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(96, 10, 96, DATE('2019-11-20'), DATE('2022-11-15');
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(97, 10, 97, DATE('2019-12-03'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(98, 10, 98, DATE('2019-05-26'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(99, 10, 99, DATE('2019-12-03'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(100, 10, 100, DATE('2019-12-03'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(101, 10, 101, DATE('2018-12-14'), DATE('2020-11-17');


-- Add the Substitutes
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(102, 'Colin'   , 'Earnest'  , 'M', 'Solo'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(103, 'Ashkan'  , 'Homayouni', 'M', 'TF Blade', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(104, 'Rafael'  , 'Knittel'  , 'M', 'Rakin'   , 3 );

-- Substitute Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(102, 5, 102, DATE('2020-03-04'), DATE('2021-11-16');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(103, 1, 103, DATE('2019-01-17'), DATE('2020-11-17');
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(104, 1, 104, DATE('2018-12-12'), DATE('2020-11-17');
