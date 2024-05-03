-- Creation base de donnees 'nyc2'
CREATE DATABASE IF NOT EXISTS nyc2;
USE nyc2;
DROP TABLE IF EXISTS station_line;
DROP TABLE IF EXISTS station;
DROP TABLE IF EXISTS line;
DROP TABLE IF EXISTS borough_hist_population;
DROP TABLE IF EXISTS borough_features;
-- Creation de la table borough_features
CREATE TABLE borough_features (
 borough varchar(16) NOT NULL,
 area_km2 decimal(5,2) NOT NULL DEFAULT '0.00',
 population int(10) UNSIGNED NOT NULL DEFAULT '0',
 borough_density decimal(10,2) NOT NULL DEFAULT '0.00',
 PRIMARY KEY (borough)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
-- Alimentation de borough_features (arrondissement de NY)
TRUNCATE borough_features;
INSERT INTO nyc2.borough_features (borough,borough_density,population,area_km2) VALUES
         ('Bronx',13482.00,1472654,109.20),
         ('Brooklyn',15227.00,2736074,179.70),
         ('Manhattan',28872.00,1694251,58.70),
         ('Queens',8542.00,2405464,281.60),
         ('Staten Island',3327.00,495747,149.00);
-- Creation de la table line (ligne de metro)
CREATE TABLE line (
 line_code varchar(3) NOT NULL,
 line_color varchar(16) NOT NULL,
 length_km decimal(10,2) NOT NULL DEFAULT '0.00',
 length_miles decimal(10,2) NOT NULL DEFAULT '0.00',
 PRIMARY KEY (line_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
-- Alimentation de la table line
TRUNCATE line;
INSERT INTO nyc2.line (line_code,line_color,length_km,length_miles) VALUES
         ('1','Red',23.66,14.70),
         ('2','Red',41.36,25.70),
         ('3','Red',29.52,18.34),
         ('4','Green',32.41,20.14),
         ('5','Green',39.24,24.38),
         ('6','Green',24.17,15.02),
         ('7','Purple',16.96,10.54),
         ('A','Blue',52.13,32.39),
         ('B','Orange',39.01,24.24),
         ('C','Blue',30.19,18.76),
         ('D','Orange',41.65,25.88),
         ('E','Blue',25.36,15.76),
         ('F','Orange',44.10,27.40),
         ('G','Lime',18.35,11.40),
         ('J','Brown',21.74,13.51),
         ('L','Light slate gray',16.48,10.24),
         ('M','Orange',29.39,18.26),
         ('N','Yellow',34.12,21.20),
         ('Q','Yellow',29.05,18.05),
         ('R','Yellow',35.15,21.84),
         ('S','Dark slate gray',8.00,4.97),
         ('SIR','Blue',22.53,14.00),
         ('W','Yellow',9.70,6.03),
         ('Z','Brown',21.74,13.51);
-- Creation de la table station (station de metro)
CREATE TABLE station(
         station_id                                        INT(10) UNSIGNED  not null
        ,stop_name                                        VARCHAR(64) not NULL
        ,borough                                        VARCHAR(16) not NULL
        ,structure_Type                                VARCHAR(32) not NULL
        ,coord_latitude                                decimal(10,5) NOT NULL default 0.0
        ,coord_longitude                        decimal(10,5) NOT NULL default 0.0
        ,CONSTRAINT borough_FK FOREIGN KEY (borough) REFERENCES borough_features (borough)
        ,PRIMARY KEY (station_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
-- Alimentation de la table station
TRUNCATE station;
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (1,'Astoria-Ditmars Blvd','Queens','Elevated',40.77504,-73.91203),
         (2,'Astoria Blvd','Queens','Elevated',40.77026,-73.91784),
         (3,'30 Av','Queens','Elevated',40.76678,-73.92148),
         (4,'Broadway','Queens','Elevated',40.76182,-73.92551),
         (5,'36 Av','Queens','Elevated',40.75680,-73.92958),
         (6,'39 Av-Dutch Kills','Queens','Elevated',40.75288,-73.93276),
         (8,'5 Av/59 St','Manhattan','Subway',40.76481,-73.97335),
         (9,'57 St-7 Av','Manhattan','Subway',40.76466,-73.98066),
         (10,'49 St','Manhattan','Subway',40.75990,-73.98414),
         (13,'28 St','Manhattan','Subway',40.74549,-73.98869);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (14,'23 St','Manhattan','Subway',40.74130,-73.98934),
         (16,'8 St-NYU','Manhattan','Subway',40.73033,-73.99263),
         (17,'Prince St','Manhattan','Subway',40.72433,-73.99770),
         (20,'City Hall','Manhattan','Subway',40.71328,-74.00698),
         (22,'Rector St','Manhattan','Subway',40.70722,-74.01334),
         (26,'DeKalb Av','Brooklyn','Subway',40.69064,-73.98182),
         (28,'Union St','Brooklyn','Subway',40.67732,-73.98311),
         (30,'Prospect Av','Brooklyn','Subway',40.66541,-73.99287),
         (31,'25 St','Brooklyn','Subway',40.66040,-73.99809),
         (32,'36 St','Brooklyn','Subway',40.65514,-74.00355);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (33,'45 St','Brooklyn','Subway',40.64894,-74.01001),
         (34,'53 St','Brooklyn','Subway',40.64507,-74.01403),
         (35,'59 St','Brooklyn','Subway',40.64136,-74.01788),
         (36,'Bay Ridge Av','Brooklyn','Subway',40.63497,-74.02338),
         (37,'77 St','Brooklyn','Subway',40.62974,-74.02551),
         (38,'86 St','Brooklyn','Subway',40.62269,-74.02840),
         (39,'Bay Ridge-95 St','Brooklyn','Subway',40.61662,-74.03088),
         (41,'7 Av','Brooklyn','Subway',40.67705,-73.97237),
         (42,'Prospect Park','Brooklyn','Open Cut',40.66161,-73.96225),
         (43,'Parkside Av','Brooklyn','Open Cut',40.65529,-73.96150);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (44,'Church Av','Brooklyn','Open Cut',40.65053,-73.96298),
         (45,'Beverley Rd','Brooklyn','Open Cut',40.64403,-73.96449),
         (46,'Cortelyou Rd','Brooklyn','Open Cut',40.64093,-73.96389),
         (47,'Newkirk Plaza','Brooklyn','Open Cut',40.63508,-73.96279),
         (48,'Avenue H','Brooklyn','Open Cut',40.62927,-73.96164),
         (49,'Avenue J','Brooklyn','Open Cut',40.62504,-73.96080),
         (50,'Avenue M','Brooklyn','Open Cut',40.61762,-73.95940),
         (51,'Kings Hwy','Brooklyn','Open Cut',40.60867,-73.95773),
         (52,'Avenue U','Brooklyn','Open Cut',40.59930,-73.95593),
         (53,'Neck Rd','Brooklyn','Open Cut',40.59525,-73.95516);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (54,'Sheepshead Bay','Brooklyn','Open Cut',40.58690,-73.95416),
         (55,'Brighton Beach','Brooklyn','Elevated',40.57762,-73.96138),
         (56,'Ocean Pkwy','Brooklyn','Elevated',40.57631,-73.96850),
         (57,'W 8 St-NY Aquarium','Brooklyn','Elevated',40.57613,-73.97594),
         (58,'Coney Island-Stillwell Av','Brooklyn','Viaduct',40.57742,-73.98123),
         (59,'9 Av','Brooklyn','Open Cut',40.64629,-73.99432),
         (60,'Fort Hamilton Pkwy','Brooklyn','Elevated',40.64091,-73.99430),
         (61,'50 St','Brooklyn','Elevated',40.63626,-73.99479),
         (62,'55 St','Brooklyn','Elevated',40.63144,-73.99548),
         (64,'71 St','Brooklyn','Elevated',40.61959,-73.99886);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (65,'79 St','Brooklyn','Elevated',40.61350,-74.00061),
         (66,'18 Av','Brooklyn','Elevated',40.60795,-74.00174),
         (67,'20 Av','Brooklyn','Elevated',40.60456,-73.99817),
         (68,'Bay Pkwy','Brooklyn','Elevated',40.60188,-73.99373),
         (69,'25 Av','Brooklyn','Elevated',40.59770,-73.98683),
         (70,'Bay 50 St','Brooklyn','Elevated',40.58884,-73.98377),
         (71,'8 Av','Brooklyn','Open Cut',40.63506,-74.01172),
         (72,'Fort Hamilton Pkwy','Brooklyn','Open Cut',40.63139,-74.00535),
         (74,'18 Av','Brooklyn','Open Cut',40.62067,-73.99041),
         (75,'20 Av','Brooklyn','Open Cut',40.61741,-73.98503);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (76,'Bay Pkwy','Brooklyn','Open Cut',40.61182,-73.98185),
         (77,'Kings Hwy','Brooklyn','Open Cut',40.60392,-73.98035),
         (78,'Avenue U','Brooklyn','Open Cut',40.59747,-73.97914),
         (79,'86 St','Brooklyn','Open Cut',40.59272,-73.97823),
         (80,'121 St','Queens','Elevated',40.70049,-73.82829),
         (81,'111 St','Queens','Elevated',40.69742,-73.83635),
         (82,'104 St','Queens','Elevated',40.69518,-73.84433),
         (83,'Woodhaven Blvd','Queens','Elevated',40.69388,-73.85158),
         (84,'85 St-Forest Pkwy','Queens','Elevated',40.69244,-73.86001),
         (85,'75 St-Elderts Ln','Queens','Elevated',40.69132,-73.86714);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (86,'Cypress Hills','Brooklyn','Elevated',40.68994,-73.87255),
         (87,'Crescent St','Brooklyn','Elevated',40.68319,-73.87379),
         (88,'Norwood Av','Brooklyn','Elevated',40.68141,-73.88004),
         (89,'Cleveland St','Brooklyn','Elevated',40.67995,-73.88464),
         (90,'Van Siclen Av','Brooklyn','Elevated',40.67802,-73.89169),
         (91,'Alabama Av','Brooklyn','Elevated',40.67699,-73.89865),
         (93,'Chauncey St','Brooklyn','Elevated',40.68289,-73.91046),
         (94,'Halsey St','Brooklyn','Elevated',40.68637,-73.91656),
         (95,'Gates Av','Brooklyn','Elevated',40.68963,-73.92227),
         (96,'Kosciuszko St','Brooklyn','Elevated',40.69334,-73.92881);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (97,'Myrtle Av','Brooklyn','Elevated',40.69721,-73.93566),
         (98,'Flushing Av','Brooklyn','Elevated',40.70026,-73.94113),
         (99,'Lorimer St','Brooklyn','Elevated',40.70387,-73.94741),
         (100,'Hewes St','Brooklyn','Elevated',40.70687,-73.95343),
         (101,'Marcy Av','Brooklyn','Elevated',40.70836,-73.95776),
         (103,'Bowery','Manhattan','Subway',40.72028,-73.99392),
         (107,'Broad St','Manhattan','Subway',40.70648,-74.01106),
         (108,'Middle Village-Metropolitan Av','Queens','Elevated',40.71140,-73.88960),
         (109,'Fresh Pond Rd','Queens','Elevated',40.70619,-73.89588),
         (110,'Forest Av','Queens','Elevated',40.70442,-73.90308);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (111,'Seneca Av','Queens','Elevated',40.70276,-73.90774),
         (113,'Knickerbocker Av','Brooklyn','Elevated',40.69866,-73.91971),
         (114,'Central Av','Brooklyn','Elevated',40.69786,-73.92740),
         (118,'3 Av','Manhattan','Subway',40.73285,-73.98612),
         (119,'1 Av','Manhattan','Subway',40.73095,-73.98163),
         (120,'Bedford Av','Brooklyn','Subway',40.71730,-73.95687),
         (122,'Graham Av','Brooklyn','Subway',40.71457,-73.94405),
         (123,'Grand St','Brooklyn','Subway',40.71193,-73.94067),
         (124,'Montrose Av','Brooklyn','Subway',40.70774,-73.93985),
         (125,'Morgan Av','Brooklyn','Subway',40.70615,-73.93315);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (126,'Jefferson St','Brooklyn','Subway',40.70661,-73.92291),
         (127,'DeKalb Av','Brooklyn','Subway',40.70381,-73.91843),
         (129,'Halsey St','Queens','Subway',40.69560,-73.90408),
         (130,'Wilson Av','Brooklyn','Subway',40.68876,-73.90405),
         (131,'Bushwick Av-Aberdeen St','Brooklyn','Subway',40.68283,-73.90525),
         (133,'Atlantic Av','Brooklyn','Elevated',40.67535,-73.90310),
         (134,'Sutter Av','Brooklyn','Elevated',40.66937,-73.90198),
         (135,'Livonia Av','Brooklyn','Elevated',40.66404,-73.90057),
         (136,'New Lots Av','Brooklyn','Elevated',40.65873,-73.89923),
         (137,'East 105 St','Brooklyn','At Grade',40.65057,-73.89949);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (138,'Canarsie-Rockaway Pkwy','Brooklyn','At Grade',40.64665,-73.90185),
         (141,'Park Pl','Brooklyn','Open Cut',40.67477,-73.95762),
         (143,'Inwood-207 St','Manhattan','Subway',40.86807,-73.91990),
         (144,'Dyckman St','Manhattan','Subway',40.86549,-73.92727),
         (145,'190 St','Manhattan','Subway',40.85902,-73.93418),
         (146,'181 St','Manhattan','Subway',40.85170,-73.93797),
         (147,'175 St','Manhattan','Subway',40.84739,-73.93970),
         (149,'163 St-Amsterdam Av','Manhattan','Subway',40.83601,-73.93989),
         (150,'155 St','Manhattan','Subway',40.83052,-73.94151),
         (151,'145 St','Manhattan','Subway',40.82478,-73.94422);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (152,'135 St','Manhattan','Subway',40.81789,-73.94765),
         (153,'125 St','Manhattan','Subway',40.81111,-73.95234),
         (154,'116 St','Manhattan','Subway',40.80509,-73.95488),
         (155,'Cathedral Pkwy (110 St)','Manhattan','Subway',40.80060,-73.95816),
         (156,'103 St','Manhattan','Subway',40.79609,-73.96145),
         (157,'96 St','Manhattan','Subway',40.79164,-73.96470),
         (158,'86 St','Manhattan','Subway',40.78587,-73.96892),
         (159,'81 St-Museum of Natural History','Manhattan','Subway',40.78143,-73.97214),
         (160,'72 St','Manhattan','Subway',40.77559,-73.97641),
         (162,'50 St','Manhattan','Subway',40.76246,-73.98598);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (164,'34 St-Penn Station','Manhattan','Subway',40.75229,-73.99339),
         (165,'23 St','Manhattan','Subway',40.74591,-73.99804),
         (167,'W 4 St-Wash Sq','Manhattan','Subway',40.73234,-74.00050),
         (168,'Spring St','Manhattan','Subway',40.72623,-74.00374),
         (169,'Canal St (A C E)','Manhattan','Subway',40.72082,-74.00523),
         (173,'High St','Brooklyn','Subway',40.69934,-73.99053),
         (175,'Hoyt-Schermerhorn Sts','Brooklyn','Subway',40.68848,-73.98500),
         (176,'Lafayette Av','Brooklyn','Subway',40.68611,-73.97395),
         (177,'Clinton-Washington Avs','Brooklyn','Subway',40.68326,-73.96584),
         (179,'Nostrand Av','Brooklyn','Subway',40.68044,-73.95043);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (180,'Kingston-Throop Avs','Brooklyn','Subway',40.67992,-73.94086),
         (181,'Utica Av','Brooklyn','Subway',40.67936,-73.93073),
         (182,'Ralph Av','Brooklyn','Subway',40.67882,-73.92079),
         (183,'Rockaway Av','Brooklyn','Subway',40.67834,-73.91195),
         (185,'Liberty Av','Brooklyn','Subway',40.67454,-73.89655),
         (186,'Van Siclen Av','Brooklyn','Subway',40.67271,-73.89036),
         (187,'Shepherd Av','Brooklyn','Subway',40.67413,-73.88075),
         (188,'Euclid Av','Brooklyn','Subway',40.67538,-73.87211),
         (189,'Grant Av','Brooklyn','Subway',40.67704,-73.86505),
         (190,'80 St','Queens','Elevated',40.67937,-73.85899);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (191,'88 St','Queens','Elevated',40.67984,-73.85147),
         (192,'Rockaway Blvd','Queens','Elevated',40.68043,-73.84385),
         (193,'104 St','Queens','Elevated',40.68171,-73.83768),
         (194,'111 St','Queens','Elevated',40.68433,-73.83216),
         (195,'Ozone Park-Lefferts Blvd','Queens','Elevated',40.68595,-73.82580),
         (196,'Aqueduct Racetrack','Queens','At Grade',40.66823,-73.83406),
         (197,'Aqueduct-N Conduit Av','Queens','At Grade',40.66823,-73.83406),
         (198,'Howard Beach-JFK Airport','Queens','At Grade',40.66048,-73.83030),
         (199,'Broad Channel','Queens','At Grade',40.60838,-73.81593),
         (200,'Beach 90 St','Queens','Viaduct',40.58803,-73.81364);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (201,'Beach 98 St','Queens','Viaduct',40.58531,-73.82056),
         (202,'Beach 105 St','Queens','Viaduct',40.58321,-73.82756),
         (203,'Rockaway Park-Beach 116 St','Queens','At Grade',40.58090,-73.83559),
         (204,'Beach 67 St','Queens','Viaduct',40.59093,-73.79692),
         (205,'Beach 60 St','Queens','Viaduct',40.59237,-73.78852),
         (206,'Beach 44 St','Queens','Viaduct',40.59294,-73.77601),
         (207,'Beach 36 St','Queens','Viaduct',40.59540,-73.76818),
         (208,'Beach 25 St','Queens','Viaduct',40.60007,-73.76135),
         (209,'Far Rockaway-Mott Av','Queens','Viaduct',40.60400,-73.75541),
         (210,'Norwood-205 St','Bronx','Subway',40.87481,-73.87886);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (211,'Bedford Park Blvd','Bronx','Subway',40.87324,-73.88714),
         (212,'Kingsbridge Rd','Bronx','Subway',40.86698,-73.89351),
         (213,'Fordham Rd','Bronx','Subway',40.86130,-73.89775),
         (214,'182-183 Sts','Bronx','Subway',40.85609,-73.90074),
         (215,'Tremont Av','Bronx','Subway',40.85041,-73.90523),
         (216,'174-175 Sts','Bronx','Subway',40.84590,-73.91014),
         (217,'170 St','Bronx','Subway',40.83931,-73.91340),
         (218,'167 St','Bronx','Subway',40.83377,-73.91844),
         (220,'155 St','Manhattan','Subway',40.83014,-73.93821),
         (221,'21 St-Queensbridge','Queens','Subway',40.75420,-73.94284);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (222,'Roosevelt Island','Manhattan','Subway',40.75915,-73.95326),
         (223,'Lexington Av/63 St','Manhattan','Subway',40.76463,-73.96611),
         (224,'57 St','Manhattan','Subway',40.76397,-73.97745),
         (225,'47-50 Sts-Rockefeller Ctr','Manhattan','Subway',40.75866,-73.98133),
         (228,'23 St','Manhattan','Subway',40.74288,-73.99282),
         (231,'Grand St','Manhattan','Subway',40.71827,-73.99375),
         (232,'2 Av','Manhattan','Subway',40.72340,-73.98994),
         (234,'East Broadway','Manhattan','Subway',40.71372,-73.99017),
         (235,'York St','Brooklyn','Subway',40.70140,-73.98675),
         (236,'Bergen St','Brooklyn','Subway',40.68615,-73.99086);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (237,'Carroll St','Brooklyn','Subway',40.68030,-73.99505),
         (238,'Smith-9 Sts','Brooklyn','Viaduct',40.67358,-73.99596),
         (240,'7 Av','Brooklyn','Subway',40.66627,-73.98031),
         (241,'15 St-Prospect Park','Brooklyn','Subway',40.66037,-73.97949),
         (242,'Fort Hamilton Pkwy','Brooklyn','Subway',40.65078,-73.97578),
         (243,'Church Av','Brooklyn','Subway',40.64404,-73.97968),
         (244,'Ditmas Av','Brooklyn','Elevated',40.63612,-73.97817),
         (245,'18 Av','Brooklyn','Elevated',40.62976,-73.97697),
         (246,'Avenue I','Brooklyn','Elevated',40.62532,-73.97613),
         (247,'Bay Pkwy','Brooklyn','Elevated',40.62077,-73.97526);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (248,'Avenue N','Brooklyn','Elevated',40.61514,-73.97420),
         (249,'Avenue P','Brooklyn','Elevated',40.60894,-73.97302),
         (250,'Kings Hwy','Brooklyn','Elevated',40.60322,-73.97236),
         (251,'Avenue U','Brooklyn','Elevated',40.59606,-73.97336),
         (252,'Avenue X','Brooklyn','Elevated',40.58962,-73.97425),
         (253,'Neptune Av','Brooklyn','Elevated',40.58101,-73.97457),
         (254,'Jamaica-179 St','Queens','Subway',40.71265,-73.78382),
         (255,'169 St','Queens','Subway',40.71047,-73.79360),
         (256,'Parsons Blvd','Queens','Subway',40.70756,-73.80333),
         (257,'Sutphin Blvd','Queens','Subway',40.70546,-73.81071);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (258,'Briarwood','Queens','Subway',40.70918,-73.82057),
         (259,'Kew Gardens-Union Tpke','Queens','Subway',40.71444,-73.83101),
         (260,'75 Av','Queens','Subway',40.71833,-73.83732),
         (261,'Forest Hills-71 Av','Queens','Subway',40.72169,-73.84452),
         (262,'67 Av','Queens','Subway',40.72652,-73.85272),
         (263,'63 Dr-Rego Park','Queens','Subway',40.72985,-73.86160),
         (264,'Woodhaven Blvd','Queens','Subway',40.73311,-73.86923),
         (265,'Grand Av-Newtown','Queens','Subway',40.73702,-73.87722),
         (266,'Elmhurst Av','Queens','Subway',40.74245,-73.88202),
         (268,'65 St','Queens','Subway',40.74967,-73.89845);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (269,'Northern Blvd','Queens','Subway',40.75289,-73.90601),
         (270,'46 St','Queens','Subway',40.75631,-73.91333),
         (271,'Steinway St','Queens','Subway',40.75688,-73.92074),
         (272,'36 St','Queens','Subway',40.75204,-73.92878),
         (273,'Queens Plaza','Queens','Subway',40.74897,-73.93724),
         (276,'5 Av/53 St','Manhattan','Subway',40.76017,-73.97522),
         (277,'7 Av','Manhattan','Subway',40.76286,-73.98164),
         (278,'Jamaica Center-Parsons/Archer','Queens','Subway',40.70215,-73.80111),
         (279,'Sutphin Blvd-Archer Av-JFK Airport','Queens','Subway',40.70049,-73.80797),
         (280,'Jamaica-Van Wyck','Queens','Subway',40.70257,-73.81686);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (282,'21 St','Queens','Subway',40.74407,-73.94972),
         (283,'Greenpoint Av','Brooklyn','Subway',40.73135,-73.95445),
         (284,'Nassau Av','Brooklyn','Subway',40.72464,-73.95128),
         (286,'Broadway','Brooklyn','Subway',40.70609,-73.95031),
         (287,'Flushing Av','Brooklyn','Subway',40.70038,-73.95023),
         (288,'Myrtle-Willoughby Avs','Brooklyn','Subway',40.69457,-73.94905),
         (289,'Bedford-Nostrand Avs','Brooklyn','Subway',40.68963,-73.95352),
         (290,'Classon Av','Brooklyn','Subway',40.68887,-73.96007),
         (291,'Clinton-Washington Avs','Brooklyn','Subway',40.68809,-73.96684),
         (292,'Fulton St','Brooklyn','Subway',40.68712,-73.97538);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (293,'Van Cortlandt Park-242 St','Bronx','Elevated',40.88925,-73.89858),
         (294,'238 St','Bronx','Elevated',40.88467,-73.90087),
         (295,'231 St','Bronx','Elevated',40.87886,-73.90483),
         (296,'Marble Hill-225 St','Manhattan','Elevated',40.87456,-73.90983),
         (297,'215 St','Manhattan','Elevated',40.86944,-73.91528),
         (298,'207 St','Manhattan','Elevated',40.86462,-73.91882),
         (299,'Dyckman St','Manhattan','Elevated',40.86053,-73.92554),
         (300,'191 St','Manhattan','Subway',40.85523,-73.92941),
         (301,'181 St','Manhattan','Subway',40.84951,-73.93360),
         (303,'157 St','Manhattan','Subway',40.83404,-73.94489);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (304,'145 St','Manhattan','Subway',40.82655,-73.95036),
         (305,'137 St-City College','Manhattan','Subway',40.82201,-73.95368),
         (306,'125 St','Manhattan','Elevated',40.81558,-73.95837),
         (307,'116 St-Columbia University','Manhattan','Subway',40.80772,-73.96411),
         (308,'Cathedral Pkwy (110 St)','Manhattan','Subway',40.80397,-73.96685),
         (309,'103 St','Manhattan','Subway',40.79945,-73.96838),
         (310,'96 St','Manhattan','Subway',40.79392,-73.97232),
         (311,'86 St','Manhattan','Subway',40.78864,-73.97622),
         (312,'79 St','Manhattan','Subway',40.78393,-73.97992),
         (313,'72 St','Manhattan','Subway',40.77845,-73.98197);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (314,'66 St-Lincoln Center','Manhattan','Subway',40.77344,-73.98221),
         (316,'50 St','Manhattan','Subway',40.76173,-73.98385),
         (318,'34 St-Penn Station','Manhattan','Subway',40.75037,-73.99106),
         (319,'28 St','Manhattan','Subway',40.74722,-73.99337),
         (320,'23 St','Manhattan','Subway',40.74408,-73.99566),
         (321,'18 St','Manhattan','Subway',40.74104,-73.99787),
         (323,'Christopher St-Sheridan Sq','Manhattan','Subway',40.73342,-74.00291),
         (324,'Houston St','Manhattan','Subway',40.72825,-74.00537),
         (325,'Canal St (1)','Manhattan','Subway',40.72285,-74.00628),
         (326,'Franklin St','Manhattan','Subway',40.71932,-74.00689);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (327,'Chambers St','Manhattan','Subway',40.71548,-74.00927),
         (328,'WTC Cortlandt','Manhattan','Subway',40.71184,-74.01219),
         (329,'Rector St','Manhattan','Subway',40.70751,-74.01378),
         (333,'Wall St','Manhattan','Subway',40.70682,-74.00910),
         (334,'Clark St','Brooklyn','Subway',40.69747,-73.99309),
         (336,'Hoyt St','Brooklyn','Subway',40.69055,-73.98507),
         (337,'Nevins St','Brooklyn','Subway',40.68825,-73.98049),
         (339,'Bergen St','Brooklyn','Subway',40.68083,-73.97510),
         (340,'Grand Army Plaza','Brooklyn','Subway',40.67524,-73.97105),
         (341,'Eastern Pkwy-Brooklyn Museum','Brooklyn','Subway',40.67199,-73.96438);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (343,'Nostrand Av','Brooklyn','Subway',40.66985,-73.95047),
         (344,'Kingston Av','Brooklyn','Subway',40.66940,-73.94216),
         (345,'Crown Hts-Utica Av','Brooklyn','Subway',40.66890,-73.93294),
         (346,'Sutter Av-Rutland Rd','Brooklyn','Elevated',40.66472,-73.92261),
         (347,'Saratoga Av','Brooklyn','Elevated',40.66145,-73.91633),
         (348,'Rockaway Av','Brooklyn','Elevated',40.66255,-73.90895),
         (349,'Junius St','Brooklyn','Elevated',40.66352,-73.90245),
         (350,'Pennsylvania Av','Brooklyn','Elevated',40.66464,-73.89490),
         (351,'Van Siclen Av','Brooklyn','Elevated',40.66545,-73.88940),
         (352,'New Lots Av','Brooklyn','Elevated',40.66624,-73.88408);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (353,'President St-Medgar Evers College','Brooklyn','Subway',40.66788,-73.95068),
         (354,'Sterling St','Brooklyn','Subway',40.66274,-73.95085),
         (355,'Winthrop St','Brooklyn','Subway',40.65665,-73.95020),
         (356,'Church Av','Brooklyn','Subway',40.65084,-73.94958),
         (357,'Beverly Rd','Brooklyn','Subway',40.64510,-73.94896),
         (358,'Newkirk Av-Little Haiti','Brooklyn','Subway',40.63997,-73.94841),
         (359,'Flatbush Av-Brooklyn College','Brooklyn','Subway',40.63284,-73.94764),
         (360,'Pelham Bay Park','Bronx','Elevated',40.85246,-73.82812),
         (361,'Buhre Av','Bronx','Elevated',40.84681,-73.83257),
         (362,'Middletown Rd','Bronx','Elevated',40.84386,-73.83632);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (363,'Westchester Sq-E Tremont Av','Bronx','Elevated',40.83989,-73.84295),
         (364,'Zerega Av','Bronx','Elevated',40.83649,-73.84704),
         (365,'Castle Hill Av','Bronx','Elevated',40.83426,-73.85122),
         (366,'Parkchester','Bronx','Elevated',40.83323,-73.86082),
         (367,'St Lawrence Av','Bronx','Elevated',40.83151,-73.86762),
         (368,'Morrison Av-Soundview','Bronx','Elevated',40.82952,-73.87452),
         (369,'Elder Av','Bronx','Elevated',40.82858,-73.87916),
         (370,'Whitlock Av','Bronx','Elevated',40.82653,-73.88628),
         (371,'Hunts Point Av','Bronx','Subway',40.82095,-73.89055),
         (372,'Longwood Av','Bronx','Subway',40.81610,-73.89644);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (373,'E 149 St','Bronx','Subway',40.81212,-73.90410),
         (374,'E 143 St-St Mary''s St','Bronx','Subway',40.80872,-73.90766),
         (375,'Cypress Av','Bronx','Subway',40.80537,-73.91404),
         (376,'Brook Av','Bronx','Subway',40.80757,-73.91924),
         (377,'3 Av-138 St','Bronx','Subway',40.81048,-73.92614),
         (378,'Woodlawn','Bronx','Elevated',40.88604,-73.87875),
         (379,'Mosholu Pkwy','Bronx','Elevated',40.87975,-73.88466),
         (380,'Bedford Park Blvd-Lehman College','Bronx','Elevated',40.87341,-73.89006),
         (381,'Kingsbridge Rd','Bronx','Elevated',40.86776,-73.89717),
         (382,'Fordham Rd','Bronx','Elevated',40.86280,-73.90103);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (383,'183 St','Bronx','Elevated',40.85841,-73.90388),
         (384,'Burnside Av','Bronx','Elevated',40.85345,-73.90768),
         (385,'176 St','Bronx','Elevated',40.84848,-73.91179),
         (386,'Mt Eden Av','Bronx','Elevated',40.84443,-73.91469),
         (387,'170 St','Bronx','Elevated',40.84008,-73.91779),
         (388,'167 St','Bronx','Elevated',40.83554,-73.92140),
         (391,'138 St-Grand Concourse','Bronx','Subway',40.81322,-73.92985),
         (392,'125 St','Manhattan','Subway',40.80414,-73.93759),
         (393,'116 St','Manhattan','Subway',40.79863,-73.94162),
         (394,'110 St','Manhattan','Subway',40.79502,-73.94425);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (395,'103 St','Manhattan','Subway',40.79060,-73.94748),
         (396,'96 St','Manhattan','Subway',40.78567,-73.95107),
         (397,'86 St','Manhattan','Subway',40.77949,-73.95559),
         (398,'77 St','Manhattan','Subway',40.77362,-73.95987),
         (399,'68 St-Hunter College','Manhattan','Subway',40.76814,-73.96387),
         (403,'33 St','Manhattan','Subway',40.74608,-73.98208),
         (404,'28 St','Manhattan','Subway',40.74307,-73.98426),
         (405,'23 St','Manhattan','Subway',40.73986,-73.98660),
         (407,'Astor Pl','Manhattan','Subway',40.73005,-73.99107),
         (409,'Spring St','Manhattan','Subway',40.72230,-73.99714);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (413,'Wall St','Manhattan','Subway',40.70756,-74.01186),
         (414,'Bowling Green','Manhattan','Subway',40.70482,-74.01407),
         (416,'Wakefield-241 St','Bronx','Elevated',40.90313,-73.85062),
         (417,'Nereid Av','Bronx','Elevated',40.89838,-73.85438),
         (418,'233 St','Bronx','Elevated',40.89319,-73.85747),
         (419,'225 St','Bronx','Elevated',40.88802,-73.86034),
         (420,'219 St','Bronx','Elevated',40.88390,-73.86263),
         (421,'Gun Hill Rd','Bronx','Elevated',40.87785,-73.86626),
         (422,'Burke Av','Bronx','Elevated',40.87136,-73.86716),
         (423,'Allerton Av','Bronx','Elevated',40.86546,-73.86735);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (424,'Pelham Pkwy','Bronx','Elevated',40.85719,-73.86762),
         (425,'Bronx Park East','Bronx','Elevated',40.84883,-73.86846),
         (426,'E 180 St','Bronx','Elevated',40.84189,-73.87349),
         (427,'West Farms Sq-E Tremont Av','Bronx','Elevated',40.84030,-73.88005),
         (428,'174 St','Bronx','Elevated',40.83729,-73.88773),
         (429,'Freeman St','Bronx','Elevated',40.82999,-73.89187),
         (430,'Simpson St','Bronx','Elevated',40.82407,-73.89306),
         (431,'Intervale Av','Bronx','Elevated',40.82218,-73.89674),
         (432,'Prospect Av','Bronx','Elevated',40.81959,-73.90177),
         (433,'Jackson Av','Bronx','Elevated',40.81649,-73.90781);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (434,'3 Av-149 St','Bronx','Subway',40.81611,-73.91776),
         (436,'Harlem-148 St','Manhattan','Subway',40.82388,-73.93647),
         (437,'145 St','Manhattan','Subway',40.82042,-73.93625),
         (438,'135 St','Manhattan','Subway',40.81423,-73.94077),
         (439,'125 St','Manhattan','Subway',40.80775,-73.94550),
         (440,'116 St','Manhattan','Subway',40.80210,-73.94963),
         (441,'Central Park North (110 St)','Manhattan','Subway',40.79908,-73.95182),
         (442,'Eastchester-Dyre Av','Bronx','At Grade',40.88830,-73.83083),
         (443,'Baychester Av','Bronx','Open Cut',40.87866,-73.83859),
         (444,'Gun Hill Rd','Bronx','Open Cut',40.86953,-73.84638);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (445,'Pelham Pkwy','Bronx','Open Cut',40.85899,-73.85536),
         (446,'Morris Park','Bronx','Open Cut',40.85436,-73.86050),
         (447,'Flushing-Main St','Queens','Subway',40.75960,-73.83003),
         (448,'Mets-Willets Point','Queens','Elevated',40.75462,-73.84563),
         (449,'111 St','Queens','Elevated',40.75173,-73.85533),
         (450,'103 St-Corona Plaza','Queens','Elevated',40.74987,-73.86270),
         (451,'Junction Blvd','Queens','Elevated',40.74915,-73.86953),
         (452,'90 St-Elmhurst Av','Queens','Elevated',40.74841,-73.87661),
         (453,'82 St-Jackson Hts','Queens','Elevated',40.74766,-73.88370),
         (455,'69 St','Queens','Elevated',40.74633,-73.89640);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (456,'61 St-Woodside','Queens','Elevated',40.74563,-73.90298),
         (457,'52 St','Queens','Elevated',40.74415,-73.91255),
         (458,'46 St-Bliss St','Queens','Elevated',40.74313,-73.91844),
         (459,'40 St-Lowery St','Queens','Elevated',40.74378,-73.92402),
         (460,'33 St-Rawson St','Queens','Elevated',40.74459,-73.93100),
         (461,'Queensboro Plaza','Queens','Elevated',40.75058,-73.94020),
         (463,'Hunters Point Av','Queens','Subway',40.74222,-73.94892),
         (464,'Vernon Blvd-Jackson Av','Queens','Subway',40.74263,-73.95358),
         (471,'34 St-Hudson Yards','Manhattan','Subway',40.75588,-74.00191),
         (475,'96 St','Manhattan','Subway',40.78432,-73.94715);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (476,'86 St','Manhattan','Subway',40.77789,-73.95179),
         (477,'72 St','Manhattan','Subway',40.76880,-73.95842),
         (501,'St George','Staten Island','Open Cut',40.64375,-74.07364),
         (502,'Tompkinsville','Staten Island','At Grade',40.63695,-74.07484),
         (503,'Stapleton','Staten Island','Elevated',40.62792,-74.07516),
         (504,'Clifton','Staten Island','Elevated',40.62132,-74.07140),
         (505,'Grasmere','Staten Island','Open Cut',40.60312,-74.08409),
         (506,'Old Town','Staten Island','Embankment',40.59661,-74.08737),
         (507,'Dongan Hills','Staten Island','Embankment',40.58885,-74.09609),
         (508,'Jefferson Av','Staten Island','Embankment',40.58359,-74.10334);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (509,'Grant City','Staten Island','Open Cut',40.57897,-74.10970),
         (510,'New Dorp','Staten Island','Open Cut',40.57348,-74.11721),
         (511,'Oakwood Heights','Staten Island','Open Cut',40.56511,-74.12632),
         (512,'Bay Terrace','Staten Island','Embankment',40.55640,-74.13691),
         (513,'Great Kills','Staten Island','Open Cut',40.55123,-74.15140),
         (514,'Eltingville','Staten Island','Embankment',40.54460,-74.16457),
         (515,'Annadale','Staten Island','Open Cut',40.54046,-74.17822),
         (516,'Huguenot','Staten Island','Open Cut',40.53367,-74.19179),
         (517,'Prince''s Bay','Staten Island','Open Cut',40.52551,-74.20006),
         (518,'Pleasant Plains','Staten Island','Embankment',40.52241,-74.21785);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (519,'Richmond Valley','Staten Island','Open Cut',40.51963,-74.22914),
         (522,'Tottenville','Staten Island','At Grade',40.51276,-74.25196),
         (523,'Arthur Kill','Staten Island','At Grade',40.51658,-74.24210),
         (601,'14 St/6 Av','Manhattan','Subway',40.73780,-73.99773),
         (602,'14 St-Union Sq','Manhattan','Subway',40.73507,-73.99042),
         (603,'149 St-Grand Concourse','Bronx','Subway',40.81839,-73.92703),
         (604,'161 St-Yankee Stadium','Bronx','Elevated; Subway',40.82795,-73.92574),
         (605,'168 St-Washington Hts','Manhattan','Subway',40.84064,-73.93985),
         (606,'Court Sq-23 St','Queens','Elevated; Subway',40.74714,-73.94503),
         (607,'34 St-Herald Sq','Manhattan','Subway',40.74964,-73.98789);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (608,'4 Av-9 St','Brooklyn','Subway; Viaduct',40.67056,-73.98904),
         (609,'42 St-Bryant Pk/5 Av','Manhattan','Subway',40.75402,-73.98327),
         (610,'Grand Central-42 St','Manhattan','Subway',40.75199,-73.97736),
         (611,'Times Sq-42 St/Port Authority Bus Terminal','Manhattan','Subway',40.75575,-73.98758),
         (612,'Lexington Av/51-53 Sts','Manhattan','Subway',40.75733,-73.97049),
         (613,'Lexington Av/59 St','Manhattan','Subway',40.76259,-73.96761),
         (614,'59 St-Columbus Circle','Manhattan','Subway',40.76827,-73.98183),
         (615,'62 St/New Utrecht Av','Brooklyn','Elevated; Open Cut',40.62566,-73.99662),
         (616,'Jackson Hts-Roosevelt Av/74 St-Broadway','Queens','Elevated; Subway',40.74675,-73.89137),
         (617,'Atlantic Av-Barclays Ctr','Brooklyn','Subway',40.68416,-73.97779);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (618,'14 St/8 Av','Manhattan','Subway',40.74034,-74.00213),
         (619,'Broadway-Lafayette St/Bleecker St','Manhattan','Subway',40.72561,-73.99543),
         (620,'Borough Hall/Court St','Brooklyn','Subway',40.69324,-73.99064),
         (621,'Broadway Junction','Brooklyn','Elevated; Subway',40.67890,-73.90436),
         (622,'Brooklyn Bridge-City Hall/Chambers St','Manhattan','Subway',40.71315,-74.00377),
         (623,'Canal St','Manhattan','Subway',40.71870,-74.00058),
         (624,'Chambers St/WTC/Park Place/Cortlandt St','Manhattan','Subway',40.71260,-74.00955),
         (625,'Delancey St-Essex St','Manhattan','Subway',40.71846,-73.98778),
         (626,'Franklin Av-Medgar Evers College/Botanic Garden','Brooklyn','Open Cut; Subway',40.67051,-73.95869),
         (627,'Franklin Av','Brooklyn','Elevated; Subway',40.68099,-73.95634);
INSERT INTO nyc2.station (station_id,stop_name,borough,structure_Type,coord_latitude,coord_longitude) VALUES
         (628,'Fulton St','Manhattan','Subway',40.71009,-74.00784),
         (629,'Metropolitan Av/Lorimer St','Brooklyn','Subway',40.71343,-73.95085),
         (630,'Myrtle-Wyckoff Avs','Brooklyn','Elevated; Subway',40.69962,-73.91199),
         (635,'Whitehall St-South Ferry','Manhattan','Subway',40.70258,-74.01333),
         (636,'Jay St-MetroTech','Brooklyn','Subway',40.69226,-73.98664);
-- Creation station_line : lien station - ligne de metro
DROP TABLE if EXISTS station_line;
CREATE TABLE station_line(
         station_id                                        INT(10) UNSIGNED  not null
        ,line_code                                                VARCHAR(3) NOT null        
        ,PRIMARY KEY (station_id, line_code)
        ,CONSTRAINT station_FK FOREIGN KEY (station_id) REFERENCES station (station_id)
        ,CONSTRAINT line_FK FOREIGN KEY (line_code) REFERENCES line (line_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
TRUNCATE station_line;
-- Alimentation de la table station_line
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (293,'1'),
         (294,'1'),
         (295,'1'),
         (296,'1'),
         (297,'1'),
         (298,'1'),
         (299,'1'),
         (300,'1'),
         (301,'1'),
         (303,'1');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (304,'1'),
         (305,'1'),
         (306,'1'),
         (307,'1'),
         (308,'1'),
         (309,'1'),
         (310,'1'),
         (311,'1'),
         (312,'1'),
         (313,'1');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (314,'1'),
         (316,'1'),
         (318,'1'),
         (319,'1'),
         (320,'1'),
         (321,'1'),
         (323,'1'),
         (324,'1'),
         (325,'1'),
         (326,'1');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (327,'1'),
         (328,'1'),
         (329,'1'),
         (601,'1'),
         (605,'1'),
         (611,'1'),
         (614,'1'),
         (635,'1'),
         (310,'2'),
         (313,'2');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (318,'2'),
         (327,'2'),
         (333,'2'),
         (334,'2'),
         (336,'2'),
         (337,'2'),
         (339,'2'),
         (340,'2'),
         (341,'2'),
         (353,'2');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (354,'2'),
         (355,'2'),
         (356,'2'),
         (357,'2'),
         (358,'2'),
         (359,'2'),
         (416,'2'),
         (417,'2'),
         (418,'2'),
         (419,'2');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (420,'2'),
         (421,'2'),
         (422,'2'),
         (423,'2'),
         (424,'2'),
         (425,'2'),
         (426,'2'),
         (427,'2'),
         (428,'2'),
         (429,'2');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (430,'2'),
         (431,'2'),
         (432,'2'),
         (433,'2'),
         (434,'2'),
         (438,'2'),
         (439,'2'),
         (440,'2'),
         (441,'2'),
         (601,'2');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (603,'2'),
         (611,'2'),
         (617,'2'),
         (620,'2'),
         (624,'2'),
         (626,'2'),
         (628,'2'),
         (310,'3'),
         (313,'3'),
         (318,'3');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (327,'3'),
         (333,'3'),
         (334,'3'),
         (336,'3'),
         (337,'3'),
         (339,'3'),
         (340,'3'),
         (341,'3'),
         (343,'3'),
         (344,'3');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (345,'3'),
         (346,'3'),
         (347,'3'),
         (348,'3'),
         (349,'3'),
         (350,'3'),
         (351,'3'),
         (352,'3'),
         (436,'3'),
         (437,'3');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (438,'3'),
         (439,'3'),
         (440,'3'),
         (441,'3'),
         (601,'3'),
         (611,'3'),
         (617,'3'),
         (620,'3'),
         (624,'3'),
         (626,'3');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (628,'3'),
         (337,'4'),
         (345,'4'),
         (378,'4'),
         (379,'4'),
         (380,'4'),
         (381,'4'),
         (382,'4'),
         (383,'4'),
         (384,'4');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (385,'4'),
         (386,'4'),
         (387,'4'),
         (388,'4'),
         (391,'4'),
         (392,'4'),
         (397,'4'),
         (413,'4'),
         (414,'4'),
         (602,'4');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (603,'4'),
         (604,'4'),
         (610,'4'),
         (613,'4'),
         (617,'4'),
         (620,'4'),
         (622,'4'),
         (626,'4'),
         (628,'4'),
         (337,'5');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (353,'5'),
         (354,'5'),
         (355,'5'),
         (356,'5'),
         (357,'5'),
         (358,'5'),
         (359,'5'),
         (391,'5'),
         (392,'5'),
         (397,'5');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (413,'5'),
         (414,'5'),
         (417,'5'),
         (418,'5'),
         (419,'5'),
         (420,'5'),
         (421,'5'),
         (422,'5'),
         (423,'5'),
         (424,'5');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (425,'5'),
         (426,'5'),
         (427,'5'),
         (428,'5'),
         (429,'5'),
         (430,'5'),
         (431,'5'),
         (432,'5'),
         (433,'5'),
         (434,'5');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (442,'5'),
         (443,'5'),
         (444,'5'),
         (445,'5'),
         (446,'5'),
         (602,'5'),
         (603,'5'),
         (610,'5'),
         (613,'5'),
         (617,'5');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (620,'5'),
         (622,'5'),
         (626,'5'),
         (628,'5'),
         (360,'6'),
         (361,'6'),
         (362,'6'),
         (363,'6'),
         (364,'6'),
         (365,'6');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (366,'6'),
         (367,'6'),
         (368,'6'),
         (369,'6'),
         (370,'6'),
         (371,'6'),
         (372,'6'),
         (373,'6'),
         (374,'6'),
         (375,'6');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (376,'6'),
         (377,'6'),
         (392,'6'),
         (393,'6'),
         (394,'6'),
         (395,'6'),
         (396,'6'),
         (397,'6'),
         (398,'6'),
         (399,'6');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (403,'6'),
         (404,'6'),
         (405,'6'),
         (407,'6'),
         (409,'6'),
         (602,'6'),
         (610,'6'),
         (612,'6'),
         (613,'6'),
         (619,'6');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (622,'6'),
         (623,'6'),
         (447,'7'),
         (448,'7'),
         (449,'7'),
         (450,'7'),
         (451,'7'),
         (452,'7'),
         (453,'7'),
         (455,'7');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (456,'7'),
         (457,'7'),
         (458,'7'),
         (459,'7'),
         (460,'7'),
         (461,'7'),
         (463,'7'),
         (464,'7'),
         (471,'7'),
         (606,'7');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (609,'7'),
         (610,'7'),
         (611,'7'),
         (616,'7'),
         (143,'A'),
         (144,'A'),
         (145,'A'),
         (146,'A'),
         (147,'A'),
         (151,'A');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (153,'A'),
         (164,'A'),
         (167,'A'),
         (169,'A'),
         (173,'A'),
         (175,'A'),
         (179,'A'),
         (181,'A'),
         (188,'A'),
         (189,'A');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (190,'A'),
         (191,'A'),
         (192,'A'),
         (193,'A'),
         (194,'A'),
         (195,'A'),
         (196,'A'),
         (197,'A'),
         (198,'A'),
         (199,'A');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (200,'A'),
         (201,'A'),
         (202,'A'),
         (203,'A'),
         (204,'A'),
         (205,'A'),
         (206,'A'),
         (207,'A'),
         (208,'A'),
         (209,'A');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (605,'A'),
         (611,'A'),
         (614,'A'),
         (618,'A'),
         (621,'A'),
         (624,'A'),
         (628,'A'),
         (636,'A'),
         (26,'B'),
         (41,'B');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (42,'B'),
         (44,'B'),
         (47,'B'),
         (51,'B'),
         (54,'B'),
         (55,'B'),
         (151,'B'),
         (152,'B'),
         (153,'B'),
         (154,'B');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (155,'B'),
         (156,'B'),
         (157,'B'),
         (158,'B'),
         (159,'B'),
         (160,'B'),
         (167,'B'),
         (211,'B'),
         (212,'B'),
         (213,'B');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (214,'B'),
         (215,'B'),
         (216,'B'),
         (217,'B'),
         (218,'B'),
         (220,'B'),
         (225,'B'),
         (231,'B'),
         (277,'B'),
         (604,'B');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (607,'B'),
         (609,'B'),
         (614,'B'),
         (617,'B'),
         (619,'B'),
         (149,'C'),
         (150,'C'),
         (151,'C'),
         (152,'C'),
         (153,'C');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (154,'C'),
         (155,'C'),
         (156,'C'),
         (157,'C'),
         (158,'C'),
         (159,'C'),
         (160,'C'),
         (162,'C'),
         (164,'C'),
         (165,'C');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (167,'C'),
         (168,'C'),
         (169,'C'),
         (173,'C'),
         (175,'C'),
         (176,'C'),
         (177,'C'),
         (179,'C'),
         (180,'C'),
         (181,'C');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (182,'C'),
         (183,'C'),
         (185,'C'),
         (186,'C'),
         (187,'C'),
         (188,'C'),
         (605,'C'),
         (611,'C'),
         (614,'C'),
         (618,'C');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (621,'C'),
         (624,'C'),
         (627,'C'),
         (628,'C'),
         (636,'C'),
         (32,'D'),
         (58,'D'),
         (59,'D'),
         (60,'D'),
         (61,'D');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (62,'D'),
         (64,'D'),
         (65,'D'),
         (66,'D'),
         (67,'D'),
         (68,'D'),
         (69,'D'),
         (70,'D'),
         (151,'D'),
         (153,'D');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (167,'D'),
         (210,'D'),
         (211,'D'),
         (212,'D'),
         (213,'D'),
         (214,'D'),
         (215,'D'),
         (216,'D'),
         (217,'D'),
         (218,'D');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (220,'D'),
         (225,'D'),
         (231,'D'),
         (277,'D'),
         (604,'D'),
         (607,'D'),
         (609,'D'),
         (614,'D'),
         (615,'D'),
         (617,'D');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (619,'D'),
         (162,'E'),
         (164,'E'),
         (165,'E'),
         (167,'E'),
         (168,'E'),
         (169,'E'),
         (258,'E'),
         (259,'E'),
         (260,'E');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (261,'E'),
         (273,'E'),
         (276,'E'),
         (277,'E'),
         (278,'E'),
         (279,'E'),
         (280,'E'),
         (606,'E'),
         (611,'E'),
         (612,'E');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (616,'E'),
         (618,'E'),
         (624,'E'),
         (57,'F'),
         (58,'F'),
         (167,'F'),
         (221,'F'),
         (222,'F'),
         (223,'F'),
         (224,'F');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (225,'F'),
         (228,'F'),
         (232,'F'),
         (234,'F'),
         (235,'F'),
         (236,'F'),
         (237,'F'),
         (238,'F'),
         (240,'F'),
         (241,'F');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (242,'F'),
         (243,'F'),
         (244,'F'),
         (245,'F'),
         (246,'F'),
         (247,'F'),
         (248,'F'),
         (249,'F'),
         (250,'F'),
         (251,'F');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (252,'F'),
         (253,'F'),
         (254,'F'),
         (255,'F'),
         (256,'F'),
         (257,'F'),
         (258,'F'),
         (259,'F'),
         (260,'F'),
         (261,'F');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (601,'F'),
         (607,'F'),
         (608,'F'),
         (609,'F'),
         (616,'F'),
         (619,'F'),
         (625,'F'),
         (636,'F'),
         (175,'G'),
         (236,'G');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (237,'G'),
         (238,'G'),
         (240,'G'),
         (241,'G'),
         (242,'G'),
         (243,'G'),
         (282,'G'),
         (283,'G'),
         (284,'G'),
         (286,'G');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (287,'G'),
         (288,'G'),
         (289,'G'),
         (290,'G'),
         (291,'G'),
         (292,'G'),
         (606,'G'),
         (608,'G'),
         (629,'G'),
         (80,'J');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (81,'J'),
         (82,'J'),
         (83,'J'),
         (84,'J'),
         (85,'J'),
         (86,'J'),
         (87,'J'),
         (88,'J'),
         (89,'J'),
         (90,'J');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (91,'J'),
         (93,'J'),
         (94,'J'),
         (95,'J'),
         (96,'J'),
         (97,'J'),
         (98,'J'),
         (99,'J'),
         (100,'J'),
         (101,'J');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (103,'J'),
         (107,'J'),
         (278,'J'),
         (279,'J'),
         (621,'J'),
         (622,'J'),
         (623,'J'),
         (625,'J'),
         (628,'J'),
         (118,'L');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (119,'L'),
         (120,'L'),
         (122,'L'),
         (123,'L'),
         (124,'L'),
         (125,'L'),
         (126,'L'),
         (127,'L'),
         (129,'L'),
         (130,'L');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (131,'L'),
         (133,'L'),
         (134,'L'),
         (135,'L'),
         (136,'L'),
         (137,'L'),
         (138,'L'),
         (601,'L'),
         (602,'L'),
         (618,'L');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (621,'L'),
         (629,'L'),
         (630,'L'),
         (97,'M'),
         (98,'M'),
         (99,'M'),
         (100,'M'),
         (101,'M'),
         (108,'M'),
         (109,'M');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (110,'M'),
         (111,'M'),
         (113,'M'),
         (114,'M'),
         (167,'M'),
         (225,'M'),
         (228,'M'),
         (261,'M'),
         (262,'M'),
         (263,'M');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (264,'M'),
         (265,'M'),
         (266,'M'),
         (268,'M'),
         (269,'M'),
         (270,'M'),
         (271,'M'),
         (272,'M'),
         (273,'M'),
         (276,'M');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (601,'M'),
         (606,'M'),
         (607,'M'),
         (609,'M'),
         (612,'M'),
         (616,'M'),
         (619,'M'),
         (625,'M'),
         (630,'M'),
         (1,'N');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (2,'N'),
         (3,'N'),
         (4,'N'),
         (5,'N'),
         (6,'N'),
         (8,'N'),
         (9,'N'),
         (10,'N'),
         (32,'N'),
         (35,'N');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (58,'N'),
         (71,'N'),
         (72,'N'),
         (74,'N'),
         (75,'N'),
         (76,'N'),
         (77,'N'),
         (78,'N'),
         (79,'N'),
         (461,'N');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (602,'N'),
         (607,'N'),
         (611,'N'),
         (613,'N'),
         (615,'N'),
         (617,'N'),
         (623,'N'),
         (9,'Q'),
         (26,'Q'),
         (41,'Q');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (42,'Q'),
         (43,'Q'),
         (44,'Q'),
         (45,'Q'),
         (46,'Q'),
         (47,'Q'),
         (48,'Q'),
         (49,'Q'),
         (50,'Q'),
         (51,'Q');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (52,'Q'),
         (53,'Q'),
         (54,'Q'),
         (55,'Q'),
         (56,'Q'),
         (57,'Q'),
         (58,'Q'),
         (223,'Q'),
         (475,'Q'),
         (476,'Q');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (477,'Q'),
         (602,'Q'),
         (607,'Q'),
         (611,'Q'),
         (617,'Q'),
         (623,'Q'),
         (8,'R'),
         (9,'R'),
         (10,'R'),
         (13,'R');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (14,'R'),
         (16,'R'),
         (17,'R'),
         (20,'R'),
         (22,'R'),
         (26,'R'),
         (28,'R'),
         (30,'R'),
         (31,'R'),
         (32,'R');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (33,'R'),
         (34,'R'),
         (35,'R'),
         (36,'R'),
         (37,'R'),
         (38,'R'),
         (39,'R'),
         (261,'R'),
         (262,'R'),
         (263,'R');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (264,'R'),
         (265,'R'),
         (266,'R'),
         (268,'R'),
         (269,'R'),
         (270,'R'),
         (271,'R'),
         (272,'R'),
         (273,'R'),
         (602,'R');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (607,'R'),
         (608,'R'),
         (611,'R'),
         (613,'R'),
         (616,'R'),
         (617,'R'),
         (620,'R'),
         (623,'R'),
         (624,'R'),
         (635,'R');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (636,'R'),
         (42,'S'),
         (141,'S'),
         (199,'S'),
         (200,'S'),
         (201,'S'),
         (202,'S'),
         (203,'S'),
         (610,'S'),
         (611,'S');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (626,'S'),
         (627,'S'),
         (501,'SIR'),
         (502,'SIR'),
         (503,'SIR'),
         (504,'SIR'),
         (505,'SIR'),
         (506,'SIR'),
         (507,'SIR'),
         (508,'SIR');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (509,'SIR'),
         (510,'SIR'),
         (511,'SIR'),
         (512,'SIR'),
         (513,'SIR'),
         (514,'SIR'),
         (515,'SIR'),
         (516,'SIR'),
         (517,'SIR'),
         (518,'SIR');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (519,'SIR'),
         (522,'SIR'),
         (523,'SIR'),
         (1,'W'),
         (2,'W'),
         (3,'W'),
         (4,'W'),
         (5,'W'),
         (6,'W'),
         (8,'W');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (9,'W'),
         (10,'W'),
         (13,'W'),
         (14,'W'),
         (16,'W'),
         (17,'W'),
         (20,'W'),
         (22,'W'),
         (461,'W'),
         (602,'W');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (607,'W'),
         (611,'W'),
         (613,'W'),
         (623,'W'),
         (624,'W'),
         (635,'W'),
         (80,'Z'),
         (82,'Z'),
         (83,'Z'),
         (85,'Z');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (87,'Z'),
         (88,'Z'),
         (90,'Z'),
         (93,'Z'),
         (95,'Z'),
         (97,'Z'),
         (101,'Z'),
         (103,'Z'),
         (107,'Z'),
         (278,'Z');
INSERT INTO nyc2.station_line (station_id,line_code) VALUES
         (279,'Z'),
         (621,'Z'),
         (622,'Z'),
         (623,'Z'),
         (625,'Z'),
         (628,'Z');
DROP TABLE IF EXISTS borough_hist_population;
-- Creation de la table borough_features
CREATE TABLE borough_hist_population (
 borough         varchar(16) NOT NULL,
 year                        int(4) UNSIGNED NOT NULL DEFAULT '0',
 population         int(10) UNSIGNED NOT NULL DEFAULT '0',
        CONSTRAINT borough_FK2 FOREIGN KEY (borough) REFERENCES borough_features (borough),
 PRIMARY KEY (borough, year)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Bronx',1790,2000),
         ('Bronx',1800,2000),
         ('Bronx',1810,3000),
         ('Bronx',1820,3000),
         ('Bronx',1830,3000),
         ('Bronx',1840,5000),
         ('Bronx',1850,8000),
         ('Bronx',1860,24000),
         ('Bronx',1870,37000),
         ('Bronx',1880,52000);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Bronx',1890,89000),
         ('Bronx',1900,200507),
         ('Bronx',1910,430980),
         ('Bronx',1920,732016),
         ('Bronx',1930,1265258),
         ('Bronx',1940,1394711),
         ('Bronx',1950,1451277),
         ('Bronx',1960,1424815),
         ('Bronx',1970,1471701),
         ('Bronx',1980,1168972);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Bronx',1990,1203789),
         ('Bronx',2000,1332650),
         ('Bronx',2010,1385108),
         ('Bronx',2020,1472654),
         ('Brooklyn',1790,4549),
         ('Brooklyn',1800,5740),
         ('Brooklyn',1810,8303),
         ('Brooklyn',1820,11187),
         ('Brooklyn',1830,20535),
         ('Brooklyn',1840,47613);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Brooklyn',1850,138882),
         ('Brooklyn',1860,279122),
         ('Brooklyn',1870,419921),
         ('Brooklyn',1880,599495),
         ('Brooklyn',1890,838547),
         ('Brooklyn',1900,1166582),
         ('Brooklyn',1910,1634351),
         ('Brooklyn',1920,2018356),
         ('Brooklyn',1930,2560401),
         ('Brooklyn',1940,2698285);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Brooklyn',1950,2738175),
         ('Brooklyn',1960,2627319),
         ('Brooklyn',1970,2602012),
         ('Brooklyn',1980,2230936),
         ('Brooklyn',1990,2300664),
         ('Brooklyn',2000,2465326),
         ('Brooklyn',2010,2504700),
         ('Brooklyn',2020,2736074),
         ('Manhattan',1790,33111),
         ('Manhattan',1800,60489);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Manhattan',1810,96373),
         ('Manhattan',1820,123706),
         ('Manhattan',1830,202589),
         ('Manhattan',1840,312710),
         ('Manhattan',1850,515547),
         ('Manhattan',1860,813669),
         ('Manhattan',1870,942292),
         ('Manhattan',1880,1206299),
         ('Manhattan',1890,1515301),
         ('Manhattan',1900,1850093);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Manhattan',1910,2331542),
         ('Manhattan',1920,2284103),
         ('Manhattan',1930,1867312),
         ('Manhattan',1940,1889924),
         ('Manhattan',1950,1960101),
         ('Manhattan',1960,1698281),
         ('Manhattan',1970,1539233),
         ('Manhattan',1980,1428285),
         ('Manhattan',1990,1487536),
         ('Manhattan',2000,1537195);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Manhattan',2010,1585873),
         ('Manhattan',2020,1694251),
         ('Queens',1790,6000),
         ('Queens',1800,7000),
         ('Queens',1810,7000),
         ('Queens',1820,8000),
         ('Queens',1830,9000),
         ('Queens',1840,14000),
         ('Queens',1850,19000),
         ('Queens',1860,33000);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Queens',1870,45000),
         ('Queens',1880,57000),
         ('Queens',1890,87000),
         ('Queens',1900,152999),
         ('Queens',1910,284041),
         ('Queens',1920,469042),
         ('Queens',1930,1079129),
         ('Queens',1940,1297634),
         ('Queens',1950,1550849),
         ('Queens',1960,1809578);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Queens',1970,1986473),
         ('Queens',1980,1891325),
         ('Queens',1990,1951598),
         ('Queens',2000,2229379),
         ('Queens',2010,2230722),
         ('Queens',2020,2405464),
         ('Staten Island',1790,3827),
         ('Staten Island',1800,4563),
         ('Staten Island',1810,5347),
         ('Staten Island',1820,6135);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Staten Island',1830,7082),
         ('Staten Island',1840,10965),
         ('Staten Island',1850,15061),
         ('Staten Island',1860,25492),
         ('Staten Island',1870,33029),
         ('Staten Island',1880,38991),
         ('Staten Island',1890,51693),
         ('Staten Island',1900,67021),
         ('Staten Island',1910,85969),
         ('Staten Island',1920,116531);
INSERT INTO nyc2.borough_hist_population (borough,year,population) VALUES
         ('Staten Island',1930,158346),
         ('Staten Island',1940,174441),
         ('Staten Island',1950,191555),
         ('Staten Island',1960,221991),
         ('Staten Island',1970,295443),
         ('Staten Island',1980,352121),
         ('Staten Island',1990,378977),
         ('Staten Island',2000,443728),
         ('Staten Island',2010,468730),
         ('Staten Island',2020,495747);