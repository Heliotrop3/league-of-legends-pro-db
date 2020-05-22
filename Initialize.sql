-- Add the countries
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (1,'United States', 'NA');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (2,'Europe', 'EU');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (3,'South Korea', 'KR');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (4,'China', 'CN');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (5,'Southeast Asia', 'PCS');  --Specifically Taiwan, Hong Kong, Macau, and Southeast Asia minus Veitnam
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (6,'Vietnam', 'VN');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (7,'Russia', 'CIS');          --Formally known as the Commonwealth of Independent States
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (8,'Turkey', 'TR');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (9,'Brazil', 'BR');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (10,'Latin America', 'LAT');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (11,'Japan', 'JP');
INSERT INTO Regions (RegionID, RegionName, RegionAbbrv) VALUES (12,'Oceania', 'OCE');

-- Add the Pro Leagues
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (1,1,"League of Legends Champion Series", "LCS");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (2,1,"League of Legends Champion Series Academy", "LCS.A");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (3,9,"Campeonato Brasileiro de League of Legends", "CBLOL");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (4,2,"League of Legends European Championship", "LEC");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (5,5,"Pacific Championship Series", "PCS");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (6,3,"League of Legends Champions Korea", "LCK");
INSERT INTO Leagues (LeagueID, RegionID, LeagueName, LeagueAbbrv) VALUES (7,8,"Turkish Championship League", "TCL");

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


