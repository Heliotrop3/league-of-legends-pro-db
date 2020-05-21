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