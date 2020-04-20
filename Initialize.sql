-- Add the countries
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
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (2,'Support'  , 'Sup' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (3,'Mid Laner', 'Mid' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (4,'Top Laner', 'Top' );
INSERT INTO Positions (PositionID, PositionName, PositionAbbrv) VALUES (5,'Jungler'  , 'Jng' );

-- Add Teams:
/*
	
*/
BEGIN TRANSACTION;
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (1,  'Team Liquid'         , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (2,  'Cloud9'              , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (3,  '100 Thieves'         , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (4,  'Dignitas'       , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (5,  'FlyQuest'            , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (6,  'Counter Logic Gaming', 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (7,  'Evil Geniuses'       , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (8,  'Golden Guardians'    , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (9,  'Immortals'           , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (10, 'Team SoloMid'        , 1 );

INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (11, 'Team Liquid Academy'     , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (12, 'Cloud9 Academy'          , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (13, '100 Thieves Academy'     , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (14, 'Dignitas Academy'        , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (15, 'FlyQuest Academy'        , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (16, 'CLG Academy'             , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (17, 'Evil Geniuses Academy'   , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (18, 'Golden Guardians Academy', 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (19, 'Immortals Academy'       , 1 );
INSERT INTO Teams (TeamID, TeamName, CountryID ) VALUES (20, 'TSM Academy'             , 1 );
END TRANSACTION;

BEGIN TRANSACTION;
/*
	Add Players (Players who are listed on rosters as subs are at the end)
	Source of Contract Data is the team's roster page minus FakeGod whose contract end date was found on:
		pagehttps://lol.gamepedia.com/Archive:Global_Contract_Database/NA/Current
*/
-- Cloud 9 Roster: Source - https://lol.gamepedia.com/Cloud9#Player_Roster
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
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(10,'David'   , 'Bérubé' , 'M', 'Diamond' , 2 );


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


-- Golden Guardians: Source - https://lol.gamepedia.com/Golden_Guardians#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(72, 'Kevin'  , 'Yarnell' , 'M', 'Hauntzer'  , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(73, 'Can'    , 'Çelik'   , 'M', 'Closer'    , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(74, 'Greyson', 'Gilmer'  , 'M', 'Goldenglue', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(75, 'Victor' , 'Huang'   , 'M', 'FBI'       , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(76, 'Choi'   , 'Jae-hyun', 'M', 'Huhi'      , 2 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(77, 'Yuri'   , 'Jew'     , 'M', 'Keith'     , 2 );
-- Golden Guardian Academy: Source - https://lol.gamepedia.com/Golden_Guardians_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(78, 'Darshan'  , 'Upadhyaya'     , 'M', 'ZionSpartan', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(79, 'Anthony'  , 'Barkhotsev'    , 'M', 'Hard'       , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(80, 'Nicholas' , 'Antonio Abbott', 'M', 'Ablazeolive', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(81, 'Alexander', 'Gorica'        , 'M', 'Gorica'     , 1 );


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


-- Team Solo Mid: Source - https://lol.gamepedia.com/Team_SoloMid#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(92, 'Sergen' , 'Çelik'   , 'M', 'Broken Blade', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(93, 'Joshua' , 'Hartnett', 'M', 'Dardoch'     , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(94, 'Søren'  , 'Bjerg'   , 'M', 'Bjergsen'    , 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(95, 'Kasper' , 'Kobberup', 'M', 'Kobbe'       , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(96, 'Vincent', 'Wang'    , 'M', 'Biofrost'    , 2 );
-- Team Solo Mid Academy: Source - https://lol.gamepedia.com/TSM_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(97, 'Niship'   , 'Doshi' , 'M', 'Dhokla' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(98, 'Mingyi'   , 'Lu'    , 'M', 'Spica'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(99, 'Jackson'  , 'Dohan' , 'M', 'Evolved', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(100, 'Lawrence', 'Hui'   , 'M', 'Lost'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(101, 'Erik'    , 'Wessén', 'M', 'Treatz' , 2 );


-- Add the Substitutes
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(102, 'Colin' , 'Earnest'  , 'M', 'Solo'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(103, 'Ashkan', 'Homayouni', 'M', 'TF Blade', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(104, 'Rafael', 'Knittel'  , 'M', 'Rakin'   , 3 );
-- The Free Agents
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(105, 'Aidan', 'Reckamp', 'M', '5fire', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(106, 'Mike' , 'Yeung'  , 'M', 'MikeYeung', 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(107, 'Lee' , 'Min-ho'  , 'M', 'Crown', 3 );

END TRANSACTION;

BEGIN TRANSACTION;
-- Cloud9 Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(1 , 2, 1 , DATE('2017-11-22'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(2 , 2, 2 , DATE('2018-07-21'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(3 , 2, 3 , DATE('2018-11-23'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(4 , 2, 4 , DATE('2019-11-19'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(5 , 2, 5 , DATE('2019-11-19'), DATE('2022-11-15'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(6 , 12, 6 , DATE('2019-12-13'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(7 , 12, 7 , DATE('2020-01-07'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(8 , 12, 8 , DATE('2019-11-20'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(9 , 12, 9 , DATE('2019-12-02'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(10, 12, 10, DATE('2018-11-26'), DATE('2022-11-15'));


-- 100 Thieves Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(11, 3, 11, DATE('2017-11-22'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(12, 3, 12, DATE('2019-11-19'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(13, 3, 13, DATE('2019-11-26'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(14, 3, 14, DATE('2019-11-26'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(15, 3, 15, DATE('2019-11-25'), DATE('2022-11-15'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(16, 13, 16, DATE('2018-12-14'), DATE('2022-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(17, 13, 17, DATE('2019-12-02'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(18, 13, 18, DATE('2019-06-12'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(19, 13, 19, DATE('2018-12-14'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(20, 13, 20, DATE('2019-12-02'), DATE('2021-11-16'));


-- Evil Geniuses Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(21, 7, 21, DATE('2019-11-26'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(22, 7, 22, DATE('2019-11-19'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(23, 7, 23, DATE('2019-12-05'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(24, 7, 24, DATE('2019-11-22'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(25, 7, 25, DATE('2019-11-20'), DATE('2022-11-15'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(26, 17, 26, DATE('2020-01-03'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(27, 17, 27, DATE('2020-01-29'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(28, 17, 28, DATE('2020-01-07'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(29, 17, 29, DATE('2020-01-02'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(30, 17, 30, DATE('2020-01-02'), DATE('2020-11-17'));


-- Fly Quest Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(31, 5, 31, DATE('2018-11-27'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(32, 5, 32, DATE('2018-05-08'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(33, 5, 33, DATE('2019-11-27'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(34, 5, 34, DATE('2017-05-25'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(35, 5, 35, DATE('2019-11-20'), DATE('2021-11-16'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(36, 15, 36, DATE('2019-07-09'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(37, 15, 37, DATE('2019-12-05'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(38, 15, 38, DATE('2019-12-04'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(39, 15, 39, DATE('2019-12-03'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(40, 15, 40, DATE('2019-12-05'), DATE('2020-11-17'));


-- Team Liquid Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(41, 1, 41, DATE('2017-11-28'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(42, 1, 42, DATE('2019-11-19'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(43, 1, 43, DATE('2018-11-19'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(44, 1, 44, DATE('2017-11-24'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(45, 1, 45, DATE('2020-02-28'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(46, 1, 46, DATE('2018-11-20'), DATE('2022-11-15'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(47, 11, 47, DATE('2019-01-08'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(48, 11, 48, DATE('2019-11-25'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(49, 11, 49, DATE('2019-12-13'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(50, 11, 50, DATE('2020-03-03'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(51, 11, 51, DATE('2019-12-13'), DATE('2021-11-16'));


-- Counter Logic Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(52, 6, 52, DATE('2019-05-13'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(53, 6, 53, DATE('2018-08-18'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(54, 6, 54, DATE('2020-02-19'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(55, 6, 55, DATE('2015-11-20'), DATE('2021-11-16')); -- Source for Stixxay's time at CLG: https://lol.gamepedia.com/Stixxay#Team_History  (Use exact on the table)
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(56, 6, 56, DATE('2020-03-06'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(57, 6, 57, DATE('2019-11-18'), DATE('2021-11-16'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(58, 16, 58, DATE('2019-11-27'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(59, 16, 59, DATE('2019-12-03'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(60, 16, 60, DATE('2019-12-06'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(61, 16, 61, DATE('2019-12-06'), DATE('2020-11-16'));


-- Dignitas Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(62, 4, 62, DATE('2019-10-28'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(63, 4, 63, DATE('2020-03-05'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(64, 4, 64, DATE('2019-12-06'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(65, 4, 65, DATE('2019-12-09'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(66, 4, 66, DATE('2019-11-27'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(67, 4, 67, DATE('2019-12-05'), DATE('2021-11-16'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(68, 14, 68, DATE('2020-01-07'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(69, 14, 69, DATE('2019-12-16'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(70, 14, 70, DATE('2019-12-10'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(71, 14, 71, DATE('2020-01-07'), DATE('2021-11-16'));


-- Golden Guardians Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(72, 8, 72, DATE('2018-11-29'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(73, 8, 73, DATE('2019-11-20'), DATE('2022-11-15'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(74, 8, 74, DATE('2019-11-20'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(75, 8, 75, DATE('2019-07-05'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(76, 8, 76, DATE('2019-07-05'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(77, 8, 77, DATE('2019-11-22'), DATE('2020-11-17'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(78, 18, 78, DATE('2019-05-28'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(79, 18, 79, DATE('2018-12-18'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(80, 18, 80, DATE('2019-12-04'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(81, 18, 81, DATE('2019-12-04'), DATE('2021-11-16'));


-- Immortal Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(82, 9, 82, DATE('2019-12-12'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(83, 9, 83, DATE('2019-11-21'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(84, 9, 84, DATE('2019-11-23'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(85, 9, 85, DATE('2019-12-04'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(86, 9, 86, DATE('2020-02-28'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(87, 9, 87, DATE('2019-12-04'), DATE('2021-11-16'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(88, 19, 88, DATE('2019-10-09'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(89, 19, 89, DATE('2020-01-01'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(90, 19, 90, DATE('2020-01-01'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(91, 19, 91, DATE('2019-10-09'), DATE('2020-11-17'));


-- Team Solo Mid Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(92, 10, 92, DATE('2018-11-25'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(93, 10, 93, DATE('2019-11-22'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(94, 10, 94, DATE('2013-11-02'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(95, 10, 95, DATE('2019-11-24'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(96, 10, 96, DATE('2019-11-20'), DATE('2022-11-15'));
-- Academy
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(97, 20, 97, DATE('2019-12-03'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(98, 20, 98, DATE('2019-05-26'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(99, 20, 99, DATE('2019-12-03'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(100, 20, 100, DATE('2019-12-03'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(101, 20, 101, DATE('2018-12-14'), DATE('2020-11-17'));


-- Substitute Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(102, 5, 102, DATE('2020-03-04'), DATE('2021-11-16'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(103, 1, 103, DATE('2019-01-17'), DATE('2020-11-17'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(104, 1, 104, DATE('2018-12-12'), DATE('2020-11-17'));

-- Old Contracts
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(105, 1, 105, DATE('2020-01-29'), DATE('2020-03-11'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(106, 1, 106, DATE('2020-01-07'), DATE('2020-02-29'));
INSERT INTO Contracts (ContractID, TeamID, PlayerID, StartDate, EndDate) VALUES(107, 1, 107, DATE('2019-11-20'), DATE('2020-03-03'));
END TRANSACTION;

BEGIN TRANSACTION;
-- Auto-Generated association of contracts with players
UPDATE Players SET ContractID = 1 WHERE PlayerID = 1;
UPDATE Players SET ContractID = 2 WHERE PlayerID = 2;
UPDATE Players SET ContractID = 3 WHERE PlayerID = 3;
UPDATE Players SET ContractID = 4 WHERE PlayerID = 4;
UPDATE Players SET ContractID = 5 WHERE PlayerID = 5;
UPDATE Players SET ContractID = 6 WHERE PlayerID = 6;
UPDATE Players SET ContractID = 7 WHERE PlayerID = 7;
UPDATE Players SET ContractID = 8 WHERE PlayerID = 8;
UPDATE Players SET ContractID = 9 WHERE PlayerID = 9;
UPDATE Players SET ContractID = 10 WHERE PlayerID = 10;
UPDATE Players SET ContractID = 11 WHERE PlayerID = 11;
UPDATE Players SET ContractID = 12 WHERE PlayerID = 12;
UPDATE Players SET ContractID = 13 WHERE PlayerID = 13;
UPDATE Players SET ContractID = 14 WHERE PlayerID = 14;
UPDATE Players SET ContractID = 15 WHERE PlayerID = 15;
UPDATE Players SET ContractID = 16 WHERE PlayerID = 16;
UPDATE Players SET ContractID = 17 WHERE PlayerID = 17;
UPDATE Players SET ContractID = 18 WHERE PlayerID = 18;
UPDATE Players SET ContractID = 19 WHERE PlayerID = 19;
UPDATE Players SET ContractID = 20 WHERE PlayerID = 20;
UPDATE Players SET ContractID = 21 WHERE PlayerID = 21;
UPDATE Players SET ContractID = 22 WHERE PlayerID = 22;
UPDATE Players SET ContractID = 23 WHERE PlayerID = 23;
UPDATE Players SET ContractID = 24 WHERE PlayerID = 24;
UPDATE Players SET ContractID = 25 WHERE PlayerID = 25;
UPDATE Players SET ContractID = 26 WHERE PlayerID = 26;
UPDATE Players SET ContractID = 27 WHERE PlayerID = 27;
UPDATE Players SET ContractID = 28 WHERE PlayerID = 28;
UPDATE Players SET ContractID = 29 WHERE PlayerID = 29;
UPDATE Players SET ContractID = 30 WHERE PlayerID = 30;
UPDATE Players SET ContractID = 31 WHERE PlayerID = 31;
UPDATE Players SET ContractID = 32 WHERE PlayerID = 32;
UPDATE Players SET ContractID = 33 WHERE PlayerID = 33;
UPDATE Players SET ContractID = 34 WHERE PlayerID = 34;
UPDATE Players SET ContractID = 35 WHERE PlayerID = 35;
UPDATE Players SET ContractID = 36 WHERE PlayerID = 36;
UPDATE Players SET ContractID = 37 WHERE PlayerID = 37;
UPDATE Players SET ContractID = 38 WHERE PlayerID = 38;
UPDATE Players SET ContractID = 39 WHERE PlayerID = 39;
UPDATE Players SET ContractID = 40 WHERE PlayerID = 40;
UPDATE Players SET ContractID = 41 WHERE PlayerID = 41;
UPDATE Players SET ContractID = 42 WHERE PlayerID = 42;
UPDATE Players SET ContractID = 43 WHERE PlayerID = 43;
UPDATE Players SET ContractID = 44 WHERE PlayerID = 44;
UPDATE Players SET ContractID = 45 WHERE PlayerID = 45;
UPDATE Players SET ContractID = 46 WHERE PlayerID = 46;
UPDATE Players SET ContractID = 47 WHERE PlayerID = 47;
UPDATE Players SET ContractID = 48 WHERE PlayerID = 48;
UPDATE Players SET ContractID = 49 WHERE PlayerID = 49;
UPDATE Players SET ContractID = 50 WHERE PlayerID = 50;
UPDATE Players SET ContractID = 51 WHERE PlayerID = 51;
UPDATE Players SET ContractID = 52 WHERE PlayerID = 52;
UPDATE Players SET ContractID = 53 WHERE PlayerID = 53;
UPDATE Players SET ContractID = 54 WHERE PlayerID = 54;
UPDATE Players SET ContractID = 55 WHERE PlayerID = 55;
UPDATE Players SET ContractID = 56 WHERE PlayerID = 56;
UPDATE Players SET ContractID = 57 WHERE PlayerID = 57;
UPDATE Players SET ContractID = 58 WHERE PlayerID = 58;
UPDATE Players SET ContractID = 59 WHERE PlayerID = 59;
UPDATE Players SET ContractID = 60 WHERE PlayerID = 60;
UPDATE Players SET ContractID = 61 WHERE PlayerID = 61;
UPDATE Players SET ContractID = 62 WHERE PlayerID = 62;
UPDATE Players SET ContractID = 63 WHERE PlayerID = 63;
UPDATE Players SET ContractID = 64 WHERE PlayerID = 64;
UPDATE Players SET ContractID = 65 WHERE PlayerID = 65;
UPDATE Players SET ContractID = 66 WHERE PlayerID = 66;
UPDATE Players SET ContractID = 67 WHERE PlayerID = 67;
UPDATE Players SET ContractID = 68 WHERE PlayerID = 68;
UPDATE Players SET ContractID = 69 WHERE PlayerID = 69;
UPDATE Players SET ContractID = 70 WHERE PlayerID = 70;
UPDATE Players SET ContractID = 71 WHERE PlayerID = 71;
UPDATE Players SET ContractID = 72 WHERE PlayerID = 72;
UPDATE Players SET ContractID = 73 WHERE PlayerID = 73;
UPDATE Players SET ContractID = 74 WHERE PlayerID = 74;
UPDATE Players SET ContractID = 75 WHERE PlayerID = 75;
UPDATE Players SET ContractID = 76 WHERE PlayerID = 76;
UPDATE Players SET ContractID = 77 WHERE PlayerID = 77;
UPDATE Players SET ContractID = 78 WHERE PlayerID = 78;
UPDATE Players SET ContractID = 79 WHERE PlayerID = 79;
UPDATE Players SET ContractID = 80 WHERE PlayerID = 80;
UPDATE Players SET ContractID = 81 WHERE PlayerID = 81;
UPDATE Players SET ContractID = 82 WHERE PlayerID = 82;
UPDATE Players SET ContractID = 83 WHERE PlayerID = 83;
UPDATE Players SET ContractID = 84 WHERE PlayerID = 84;
UPDATE Players SET ContractID = 85 WHERE PlayerID = 85;
UPDATE Players SET ContractID = 86 WHERE PlayerID = 86;
UPDATE Players SET ContractID = 87 WHERE PlayerID = 87;
UPDATE Players SET ContractID = 88 WHERE PlayerID = 88;
UPDATE Players SET ContractID = 89 WHERE PlayerID = 89;
UPDATE Players SET ContractID = 90 WHERE PlayerID = 90;
UPDATE Players SET ContractID = 91 WHERE PlayerID = 91;
UPDATE Players SET ContractID = 92 WHERE PlayerID = 92;
UPDATE Players SET ContractID = 93 WHERE PlayerID = 93;
UPDATE Players SET ContractID = 94 WHERE PlayerID = 94;
UPDATE Players SET ContractID = 95 WHERE PlayerID = 95;
UPDATE Players SET ContractID = 96 WHERE PlayerID = 96;
UPDATE Players SET ContractID = 97 WHERE PlayerID = 97;
UPDATE Players SET ContractID = 98 WHERE PlayerID = 98;
UPDATE Players SET ContractID = 99 WHERE PlayerID = 99;
UPDATE Players SET ContractID = 100 WHERE PlayerID = 100;
UPDATE Players SET ContractID = 101 WHERE PlayerID = 101;
UPDATE Players SET ContractID = 102 WHERE PlayerID = 102;
UPDATE Players SET ContractID = 103 WHERE PlayerID = 103;
UPDATE Players SET ContractID = 104 WHERE PlayerID = 104;
END TRANSACTION;

BEGIN TRANSACTION;
INSERT INTO Champions (ChampionID, ChampionName) VALUES (1,'Aatrox');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (2,'Ahri');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (3,'Akali');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (4,'Alistar');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (5,'Amumu');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (6,'Anivia');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (7,'Annie');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (8,'Aphelios');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (9,'Ashe');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (10,'Aurelion Sol');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (11,'Azir');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (12,'Bard');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (13,'Blitzcrank');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (14,'Brand');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (15,'Braum');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (16,'Caitlyn');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (17,'Camille');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (18,'Cassiopeia');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (19,'Cho''Gath');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (20,'Corki');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (21,'Darius');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (22,'Diana');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (23,'Dr. Mundo');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (24,'Draven');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (25,'Ekko');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (26,'Elise');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (27,'Evelynn');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (28,'Ezreal');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (29,'Fiddlesticks');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (30,'Fiora');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (31,'Fizz');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (32,'Galio');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (33,'Gangplank');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (34,'Garen');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (35,'Gnar');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (36,'Gragas');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (37,'Graves');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (38,'Hecarim');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (39,'Heimerdinger');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (40,'Illaoi');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (41,'Irelia');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (42,'Ivern');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (43,'Janna');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (44,'Jarvan IV');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (45,'Jax');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (46,'Jayce');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (47,'Jhin');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (48,'Jinx');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (49,'Kai''Sa');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (50,'Kalista');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (51,'Karma');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (52,'Karthus');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (53,'Kassadin');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (54,'Katarina');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (55,'Kayle');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (56,'Kayn');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (57,'Kennen');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (58,'Kha''Zix');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (59,'Kindred');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (60,'Kled');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (61,'Kog''Maw');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (62,'LeBlanc');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (63,'Lee Sin');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (64,'Leona');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (65,'Lissandra');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (66,'Lucian');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (67,'Lulu');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (68,'Lux');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (69,'Malphite');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (70,'Malzahar');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (71,'Maokai');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (72,'Master Yi');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (73,'Miss Fortune');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (74,'Mordekaiser');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (75,'Morgana');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (76,'Nami');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (77,'Nasus');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (78,'Nautilus');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (79,'Neeko');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (80,'Nidalee');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (81,'Nocturne');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (82,'Nunu & Willump');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (83,'Olaf');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (84,'Orianna');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (85,'Ornn');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (86,'Pantheon');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (87,'Poppy');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (88,'Pyke');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (89,'Qiyana');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (90,'Quinn');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (91,'Rakan');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (92,'Rammus');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (93,'Rek''Sai');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (94,'Renekton');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (95,'Rengar');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (96,'Riven');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (97,'Rumble');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (98,'Ryze');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (99,'Sejuani');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (100,'Senna');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (101,'Sett');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (102,'Shaco');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (103,'Shen');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (104,'Shyvana');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (105,'Singed');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (106,'Sion');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (107,'Sivir');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (108,'Skarner');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (109,'Sona');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (110,'Soraka');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (111,'Swain');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (112,'Sylas');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (113,'Syndra');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (114,'Tahm Kench');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (115,'Taliyah');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (116,'Talon');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (117,'Taric');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (118,'Teemo');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (119,'Thresh');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (120,'Tristana');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (121,'Trundle');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (122,'Tryndamere');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (123,'Twisted Fate');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (124,'Twitch');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (125,'Udyr');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (126,'Urgot');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (127,'Varus');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (128,'Vayne');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (129,'Veigar');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (130,'Vel''Koz');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (131,'Vi');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (132,'Viktor');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (133,'Vladimir');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (134,'Volibear');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (135,'Warwick');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (136,'Wukong');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (137,'Xayah');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (138,'Xerath');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (139,'Xin Zhao');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (140,'Yasuo');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (141,'Yorick');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (142,'Yuumi');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (143,'Zac');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (144,'Zed');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (145,'Ziggs');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (146,'Zilean');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (147,'Zoe');
INSERT INTO Champions (ChampionID, ChampionName) VALUES (148,'Zyra');
END TRANSACTION;