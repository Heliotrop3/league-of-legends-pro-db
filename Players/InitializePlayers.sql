
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
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(96, 'Vincent', 'Wang'    , 'M', 'Biodaddy'    , 2 );
-- Team Solo Mid Academy: Source - https://lol.gamepedia.com/TSM_Academy#Player_Roster
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(97, 'Niship'   , 'Doshi' , 'M', 'Dhokla' , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(98, 'Mingyi'   , 'Lu'    , 'M', 'Spica'  , 5 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(99, 'Jackson'  , 'Dohan' , 'M', 'Evolved', 3 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(100, 'Lawrence', 'Hui'   , 'M', 'Lost'   , 1 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(101, 'Erik'    , 'Wessén', 'M', 'Treatz' , 2 );


-- Add the Substitutes
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(102, 'Colin'   , 'Earnest'  , 'M', 'Solo'    , 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(103, 'Ashkan'  , 'Homayouni', 'M', 'TF Blade', 4 );
INSERT INTO Players (PlayerID, FirstName, LastName, Gender, ProHandle, PositionID ) VALUES(104, 'Rafael'  , 'Knittel'  , 'M', 'Rakin'   , 3 );