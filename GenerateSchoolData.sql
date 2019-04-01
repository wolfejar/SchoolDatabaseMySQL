create schema if not exists CollegeStateUniversity;
use CollegeStateUniversity;

DROP TABLE IF EXISTS ActivityStudent;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseType;
DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity (
  ActivityId int(11) NOT NULL AUTO_INCREMENT,
  ActivityName varchar(64) NOT NULL,
  IsAcademicType int(11) NOT NULL,
  PRIMARY KEY (ActivityId),
  UNIQUE KEY ActivityName (ActivityName)
);

CREATE TABLE CourseType (
	CourseTypeId int(11) NOT NULL AUTO_INCREMENT,
    CourseTypeName varchar(64) NOT NULL,
    PRIMARY KEY (CourseTypeId),
    UNIQUE KEY CourseTypeName (CourseTypeName)
);

CREATE TABLE Course (
  CourseId int(11) NOT NULL AUTO_INCREMENT,
  CourseTypeId int(11) NOT NULL,
  CourseName varchar(64) NOT NULL,
  CourseLevel int(11) NOT NULL,
  CreditHours int(11) NOT NULL,
  PRIMARY KEY (CourseId),
  UNIQUE KEY CourseName (CourseName),
  FOREIGN KEY CourseTypeId (CourseTypeId) REFERENCES CourseType (CourseTypeId)
);

CREATE TABLE Student (
  StudentId int(11) NOT NULL AUTO_INCREMENT,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  OnCampus int(11) NOT NULL,
  IsWorking int(11) NOT NULL,
  GPA int(11) NOT NULL,
  PRIMARY KEY (StudentId)
);

CREATE TABLE CourseStudent (
  CourseId int(11) NOT NULL,
  StudentId int(11) NOT NULL,
  GradePoints int(11) NOT NULL,
  PRIMARY KEY (CourseId, StudentId),
  KEY StudentId (StudentId),
  FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

CREATE TABLE ActivityStudent (
  StudentId int(11) NOT NULL,
  ActivityId int(11) NOT NULL,
  HasPosition int(11) NOT NULL,
  PRIMARY KEY (StudentId, ActivityId),
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

INSERT INTO CourseType (CourseTypeName) VALUES ('Aesthetic Interpretation'),
('Empirical and Quantitative Reasoning'), ('Ethical Reasoning and Responsibility'), 
('Global Issues and Perspectives'), ('Historical Perspectives'), ('Human Diversity within the U.S.'),
('Natural and Physical Sciences'), ('Social Sciences');

INSERT INTO Activity VALUES ('1','eum','0'),
('2','praesentium','1'),
('3','enim','1'),
('4','voluptatibus','0'),
('5','nihil','0'),
('6','dolores','0'),
('7','sed','1'),
('8','quisquam','0'),
('9','quis','0'),
('10','quae','1');

INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (1,8,"Morbi Tristique Foundation",856,4),(2,1,"Fringilla LLC",163,5),(3,1,"Tincidunt Aliquam Arcu Ltd",562,5),(4,1,"Et Magnis Company",130,2),(5,6,"Etiam Vestibulum Massa Consulting",977,6),(6,3,"Elit Consulting",357,1),(7,5,"Ac Associates",124,3),(8,4,"Sem Eget Massa Corporation",933,1),(9,7,"Sit Amet Nulla Inc.",825,3),(10,6,"Metus Eu LLC",810,1);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (11,7,"Eu Arcu Morbi Corp.",861,3),(12,4,"In Faucibus Morbi Foundation",771,3),(13,8,"Mauris PC",335,2),(14,5,"Cum Sociis Natoque Consulting",211,6),(15,2,"Et Pede Incorporated",577,3),(16,5,"Dui Cras Consulting",595,5),(17,6,"Tellus Ltd",252,3),(18,7,"A Felis Ullamcorper LLC",292,1),(19,4,"Dui Quis Accumsan Institute",620,3),(20,7,"Luctus Aliquet Odio Incorporated",639,6);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (21,4,"Suspendisse Corp.",664,3),(22,4,"Sodales At Associates",854,5),(23,8,"Fringilla PC",325,5),(24,6,"Non Justo Inc.",673,6),(25,3,"Justo Praesent Inc.",127,3),(26,4,"At Libero Corporation",374,6),(27,8,"Sem Mollis Dui Corporation",399,6),(28,2,"Ante Dictum LLC",115,6),(29,7,"Imperdiet Ornare Foundation",589,6),(30,5,"Ad Litora LLP",954,2);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (31,4,"Cras PC",136,5),(32,1,"Augue Foundation",104,2),(33,4,"Pellentesque Sed Corporation",198,3),(34,4,"Eu PC",687,2),(35,2,"Vulputate Mauris Associates",706,4),(36,5,"Pharetra Felis Eget Foundation",364,4),(37,7,"Sociis Ltd",805,3),(38,2,"Aenean Eget PC",781,4),(39,7,"Bibendum Ullamcorper Industries",795,3),(40,8,"Vel Est Tempor PC",719,5);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (41,4,"Eu Tellus Industries",917,4),(42,3,"Neque Foundation",557,4),(43,2,"Sem Institute",638,5),(44,1,"Lorem Ipsum Dolor LLP",209,5),(45,5,"Vitae Nibh Corp.",632,6),(46,8,"Consequat Nec Mollis Ltd",141,6),(47,1,"Phasellus At Augue Corp.",167,4),(48,2,"Dolor Vitae Dolor Inc.",799,2),(49,8,"Non Bibendum Sed Corporation",511,2),(50,2,"Lobortis Limited",689,4);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (51,1,"Morbi Vehicula Foundation",520,4),(52,4,"Eros Non Incorporated",273,1),(53,5,"Vulputate Eu Odio Company",111,3),(54,1,"Et Ltd",238,5),(55,8,"Amet Risus Associates",802,2),(56,8,"Lorem Foundation",865,6),(57,7,"Accumsan Convallis Associates",555,5),(58,7,"Pellentesque Ut Corp.",621,1),(59,4,"Non Bibendum Sed Incorporated",823,4),(60,1,"Aliquam Erat Ltd",348,2);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (61,5,"Orci Ltd",992,5),(62,1,"Pretium PC",940,5),(63,7,"Lobortis Quis Consulting",998,3),(64,7,"Fringilla Porttitor Consulting",752,4),(65,5,"Ante Corporation",542,4),(66,3,"Est Ltd",383,5),(67,1,"Libero Foundation",781,5),(68,2,"Sed Neque Sed Consulting",905,2),(69,5,"Ac Industries",781,2),(70,8,"Sapien Nunc Pulvinar Consulting",687,5);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (71,4,"Aliquam Adipiscing Foundation",660,5),(72,7,"Lobortis Augue LLP",423,3),(73,2,"Lectus Nullam Limited",491,6),(74,2,"Interdum Nunc Associates",390,3),(75,7,"Mi Foundation",936,5),(76,3,"Cras Convallis Foundation",865,4),(77,7,"Elementum Sem Vitae LLP",105,4),(78,1,"Amet Diam Corporation",208,5),(79,8,"Eu Eleifend Nec Inc.",184,6),(80,1,"Nec Mauris LLC",456,3);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (81,3,"Mauris Vestibulum Limited",460,1),(82,8,"Non Lobortis Institute",133,6),(83,6,"Porttitor Interdum LLC",282,5),(84,3,"Suspendisse Commodo Ltd",623,6),(85,4,"Metus Urna Convallis Industries",690,6),(86,2,"Consequat LLP",258,3),(87,1,"Aenean Consulting",876,1),(88,7,"Dolor Tempus Corp.",890,4),(89,5,"Malesuada Vel Convallis Limited",377,3),(90,2,"Sed Sem LLP",544,6);
INSERT INTO Course (CourseId,CourseTypeId,CourseName,CourseLevel,CreditHours) VALUES (91,3,"Malesuada Vel Corporation",145,1),(92,4,"Eu Ultrices Foundation",318,1),(93,6,"Rhoncus Donec Corp.",515,2),(94,7,"Ante LLP",387,6),(95,8,"Tellus Eu LLP",440,1),(96,7,"Praesent Eu Associates",623,6),(97,6,"Nunc Ltd",140,5),(98,6,"Sodales Industries",959,4),(99,2,"Semper Dui Lectus Corporation",283,3),(100,5,"Erat Corp.",538,5);
 

INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (1,"Juliet","Mccullough","1","0","3.96"),(2,"Winifred","Le","0","1","3.96"),(3,"Burke","Crosby","0","0","0.40"),(4,"Kameko","Fuller","1","1","0.54"),(5,"Alec","Weiss","0","0","1.90"),(6,"Naida","Mccarty","0","0","1.11"),(7,"Thor","Cervantes","0","1","3.05"),(8,"Calvin","Wade","0","1","1.09"),(9,"Ivana","Jackson","0","1","1.69"),(10,"Akeem","Dillard","1","0","2.97");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (11,"Renee","Case","1","1","0.02"),(12,"Karleigh","Calderon","0","0","2.28"),(13,"Catherine","Arnold","1","0","0.80"),(14,"Guinevere","Sullivan","0","0","3.84"),(15,"Ivory","Miles","0","0","0.55"),(16,"Kevin","Fry","1","0","3.24"),(17,"Karleigh","Cooper","0","1","2.40"),(18,"Bruno","Carter","1","0","1.95"),(19,"Uriel","Carpenter","1","0","2.52"),(20,"Byron","Hammond","1","0","1.27");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (21,"Dante","Goodman","0","0","0.84"),(22,"Lani","Maddox","1","0","1.11"),(23,"Caldwell","Bruce","0","1","3.86"),(24,"Noah","Lambert","1","0","0.74"),(25,"Rafael","Herman","0","0","0.74"),(26,"Jaden","Delgado","0","0","3.04"),(27,"Shoshana","Atkinson","0","1","0.09"),(28,"Victor","Knowles","0","0","0.30"),(29,"Marny","Nielsen","1","1","2.62"),(30,"Morgan","Contreras","0","0","3.78");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (31,"Wyoming","Cleveland","1","0","2.08"),(32,"Leslie","Cotton","0","1","2.42"),(33,"Guinevere","Berg","1","1","2.31"),(34,"Nyssa","Alford","0","1","0.60"),(35,"Jonas","Short","0","0","2.21"),(36,"Cassidy","Shelton","0","0","0.69"),(37,"Brielle","Calhoun","0","1","3.29"),(38,"Dexter","Fisher","1","0","3.05"),(39,"Wing","Shepard","0","0","0.88"),(40,"Nero","Hooper","1","1","2.55");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (41,"Nelle","Solomon","1","0","2.99"),(42,"Paul","Mack","0","1","3.75"),(43,"Daquan","Ratliff","1","0","0.04"),(44,"Barclay","Phelps","1","1","2.76"),(45,"Kellie","Hahn","0","1","2.13"),(46,"Kathleen","Estrada","1","1","3.56"),(47,"Larissa","Nicholson","1","0","0.31"),(48,"Nicholas","Stevens","0","0","3.03"),(49,"Vladimir","Raymond","1","1","2.69"),(50,"Kameko","Cummings","0","1","3.33");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (51,"Keaton","Keith","1","1","3.24"),(52,"Carl","Reese","1","0","2.23"),(53,"Azalia","Joseph","1","0","1.78"),(54,"Emily","Russo","0","1","1.00"),(55,"Desirae","Peterson","0","0","1.87"),(56,"Irene","Wiley","1","1","2.43"),(57,"Nerea","Walter","0","0","3.80"),(58,"Brennan","Potts","0","1","1.42"),(59,"Carter","Kaufman","0","1","2.21"),(60,"Lillian","Cash","0","0","3.36");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (61,"Selma","William","0","1","2.79"),(62,"Ali","Knapp","1","0","1.62"),(63,"Maxine","Singleton","0","1","1.19"),(64,"Adrian","Leblanc","0","1","1.02"),(65,"Cadman","Schroeder","1","1","0.19"),(66,"Ifeoma","Crawford","0","1","2.25"),(67,"Echo","Mcneil","1","1","1.88"),(68,"Lisandra","Bryant","0","1","0.40"),(69,"Kyla","Garner","0","0","0.22"),(70,"Christian","Avila","0","0","0.37");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (71,"Quyn","Kim","0","1","3.26"),(72,"Macon","Dixon","0","1","2.01"),(73,"Charity","White","1","0","2.67"),(74,"Audrey","Gay","0","0","1.27"),(75,"Amity","Navarro","1","1","1.88"),(76,"Catherine","King","1","0","3.68"),(77,"Shannon","Cannon","0","0","2.90"),(78,"Jin","Bowen","0","0","3.51"),(79,"TaShya","Albert","0","0","3.76"),(80,"Chiquita","Larson","1","1","3.85");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (81,"Judah","Bean","0","1","2.59"),(82,"George","Morrison","1","1","1.25"),(83,"Lenore","Yang","0","1","0.08"),(84,"Risa","Poole","1","1","0.11"),(85,"Sydnee","Brennan","0","0","1.06"),(86,"Beck","Wiggins","0","1","4.00"),(87,"Bianca","Douglas","1","0","0.11"),(88,"Aiko","Bush","0","0","3.45"),(89,"Martha","Copeland","0","1","2.32"),(90,"Jayme","Johnson","1","1","3.49");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (91,"Steel","Blanchard","1","0","2.74"),(92,"Montana","Church","1","0","0.19"),(93,"Elton","Petersen","0","1","1.99"),(94,"Giacomo","Solomon","0","0","2.00"),(95,"Inez","Scott","0","1","1.61"),(96,"Sybill","Neal","0","0","3.88"),(97,"Sonia","Mcdaniel","0","1","2.43"),(98,"Sydney","Sullivan","1","1","0.57"),(99,"Alexander","Kemp","1","1","1.03"),(100,"Malcolm","Goodman","1","0","3.06");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (101,"Gil","Mcpherson","1","1","3.86"),(102,"Margaret","Bass","0","0","1.77"),(103,"Audrey","Cummings","1","0","1.84"),(104,"Colorado","Noel","0","0","1.56"),(105,"Melyssa","Macdonald","1","0","3.87"),(106,"Philip","Bridges","0","0","0.34"),(107,"Thaddeus","Craig","0","1","0.83"),(108,"Kadeem","Albert","0","0","0.68"),(109,"Rae","Jefferson","1","0","2.94"),(110,"Camilla","Crawford","1","0","2.91");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (111,"Quinlan","Martin","0","0","2.47"),(112,"Dorian","Chandler","1","1","0.43"),(113,"Nasim","Scott","0","1","2.45"),(114,"Hop","Workman","0","0","3.86"),(115,"Heather","Foreman","0","1","2.47"),(116,"Samantha","Matthews","1","0","0.66"),(117,"Zahir","Browning","0","0","1.19"),(118,"John","Hodges","0","0","3.55"),(119,"Ariana","Solis","0","1","1.17"),(120,"Yael","Duke","0","0","3.62");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (121,"Craig","Finch","0","1","2.95"),(122,"Cain","Golden","0","1","0.09"),(123,"Murphy","Peterson","0","0","2.34"),(124,"Ila","Thompson","1","0","0.01"),(125,"Beau","Holt","0","0","1.43"),(126,"Lamar","Crosby","1","1","2.32"),(127,"Kermit","Mccarty","0","1","3.60"),(128,"Quamar","Lynn","1","0","0.91"),(129,"Macon","Pickett","1","0","2.65"),(130,"Bertha","Landry","0","1","0.27");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (131,"Alden","Burton","1","1","2.70"),(132,"Rashad","Wynn","1","1","0.85"),(133,"Jayme","Flowers","0","0","1.20"),(134,"Kelly","Bates","1","1","2.74"),(135,"Cherokee","Duke","0","1","3.10"),(136,"Kibo","Daugherty","0","0","1.14"),(137,"Ferdinand","Bennett","0","1","1.45"),(138,"Barry","Vaughn","1","1","3.15"),(139,"Robert","Rojas","0","1","2.70"),(140,"Bruce","Mccullough","1","1","3.00");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (141,"Bertha","Wagner","0","0","0.08"),(142,"Maggy","Mack","0","1","1.73"),(143,"Rigel","Schroeder","1","1","0.04"),(144,"Miranda","Dudley","0","1","3.25"),(145,"Chase","Nunez","0","0","0.18"),(146,"Veda","Estrada","0","0","2.50"),(147,"Jelani","Reid","1","1","2.81"),(148,"Clinton","Hensley","0","1","4.00"),(149,"Rhea","Sweeney","0","0","2.20"),(150,"Unity","Whitley","0","1","3.43");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (151,"Jeremy","Snow","0","0","3.37"),(152,"Kiona","Carver","0","0","2.11"),(153,"Denton","Crosby","0","0","1.65"),(154,"Gage","Beasley","1","0","3.58"),(155,"Ocean","Vega","0","0","1.96"),(156,"Tamekah","Sims","1","0","2.40"),(157,"Zenaida","Berry","0","0","0.62"),(158,"Porter","Cochran","0","0","3.89"),(159,"Lillian","Chandler","0","0","1.50"),(160,"Hyacinth","Green","1","0","0.19");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (161,"Robert","Hogan","0","1","0.59"),(162,"Nicholas","Aguilar","1","0","3.18"),(163,"Lila","Bright","0","1","3.20"),(164,"Lydia","Barnes","1","1","1.26"),(165,"Trevor","Haynes","0","0","2.77"),(166,"Evan","Mcgowan","1","0","3.39"),(167,"Brooke","Keith","0","0","2.86"),(168,"Davis","Wells","0","1","3.49"),(169,"Audra","Velasquez","1","1","3.18"),(170,"William","Santana","0","0","2.91");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (171,"Emma","Carr","0","1","2.15"),(172,"Teegan","Bray","1","1","1.74"),(173,"Thor","Horton","0","1","2.96"),(174,"Britanni","Mcclure","1","0","0.69"),(175,"Ishmael","Jenkins","1","0","1.26"),(176,"Jasmine","Colon","1","0","0.43"),(177,"Colorado","Sherman","1","0","3.09"),(178,"Patrick","Haley","0","0","2.79"),(179,"Lael","Simon","0","0","2.99"),(180,"Emerald","Guthrie","0","1","1.59");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (181,"Frances","Stevens","1","0","0.90"),(182,"Barclay","Velez","0","1","3.17"),(183,"Glenna","Frazier","0","0","3.84"),(184,"Illiana","Fulton","0","1","3.52"),(185,"Florence","Lang","0","0","3.81"),(186,"Raja","Olsen","1","0","0.51"),(187,"Clinton","Jackson","0","1","2.04"),(188,"Neve","Sharp","0","1","1.74"),(189,"Martina","Kelly","0","0","2.67"),(190,"George","Byrd","0","0","3.99");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (191,"Kamal","Peterson","0","0","3.09"),(192,"Cheyenne","Watts","0","0","0.32"),(193,"Caldwell","Potter","1","0","3.03"),(194,"Libby","Hahn","1","0","3.94"),(195,"Dieter","Rivers","1","1","0.18"),(196,"Lionel","Richmond","1","0","1.38"),(197,"Branden","Houston","1","0","2.36"),(198,"Rahim","Mcguire","0","0","2.27"),(199,"Stacy","Hudson","1","1","3.51"),(200,"Rebekah","Ruiz","1","0","2.54");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (201,"Caesar","Jensen","0","1","3.67"),(202,"Kato","Everett","1","0","0.93"),(203,"Erica","Drake","1","0","3.68"),(204,"Shay","Guzman","0","0","1.10"),(205,"Kitra","Nichols","0","0","1.54"),(206,"Otto","Quinn","0","0","1.50"),(207,"Christian","Macdonald","1","0","1.84"),(208,"Kasimir","Bond","0","1","2.26"),(209,"Erich","Santos","1","0","3.63"),(210,"Macon","Maddox","1","0","3.29");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (211,"Karina","Farley","0","0","2.22"),(212,"Fleur","Hendrix","1","0","1.81"),(213,"Kareem","Marsh","0","0","3.54"),(214,"Ivory","Edwards","1","0","1.52"),(215,"Sigourney","Middleton","0","1","3.95"),(216,"Jordan","Montoya","0","0","2.74"),(217,"Lydia","Espinoza","1","0","2.63"),(218,"Zelenia","Hancock","0","0","0.84"),(219,"Cally","Hunter","0","0","2.85"),(220,"Mohammad","Savage","0","0","0.11");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (221,"Donovan","Travis","1","0","3.56"),(222,"Shay","Stephenson","0","1","2.12"),(223,"Axel","Santos","0","0","3.14"),(224,"Gareth","Workman","1","1","3.58"),(225,"Yoko","Dickerson","0","0","1.57"),(226,"Colette","Morrow","0","0","1.29"),(227,"Willa","Rios","0","0","2.18"),(228,"Katelyn","Burch","0","0","2.54"),(229,"Ian","Langley","0","0","0.01"),(230,"Veda","Gross","1","1","2.90");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (231,"Yuli","Spencer","0","0","0.26"),(232,"Leah","Prince","1","1","1.83"),(233,"Naomi","Perry","1","0","0.72"),(234,"Victor","Mayo","0","0","1.33"),(235,"Ulysses","Nixon","1","0","3.86"),(236,"Colin","Franks","1","1","0.30"),(237,"Idona","Price","1","1","0.88"),(238,"Hope","Erickson","1","0","0.29"),(239,"Oscar","Wells","0","1","1.98"),(240,"Sharon","Gray","1","0","2.49");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (241,"Victoria","Brady","1","1","3.46"),(242,"Lysandra","Barnett","1","0","3.68"),(243,"Len","Vega","0","1","3.68"),(244,"Yvette","Newton","0","0","2.10"),(245,"Bevis","Hayes","0","1","3.63"),(246,"Daniel","Galloway","1","0","3.47"),(247,"Aretha","Lang","0","1","3.96"),(248,"Jasper","Barber","0","1","1.08"),(249,"Herrod","Atkinson","1","1","0.25"),(250,"Madeline","Hardin","0","1","1.21");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (251,"Sawyer","Camacho","0","0","2.70"),(252,"Jarrod","English","0","1","3.36"),(253,"Deacon","Horton","1","0","0.47"),(254,"Leroy","Harmon","0","0","1.65"),(255,"Beck","Larsen","1","0","2.51"),(256,"Kuame","Osborn","0","1","3.59"),(257,"Jade","Mathews","1","0","0.77"),(258,"Deborah","Lynch","1","1","1.17"),(259,"Clementine","Fitzgerald","0","1","3.13"),(260,"Debra","Cross","1","1","0.52");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (261,"Keiko","Merrill","0","1","1.40"),(262,"Eleanor","Miles","1","1","2.65"),(263,"Jemima","Rosario","0","1","2.21"),(264,"Caesar","Pena","1","1","3.48"),(265,"Georgia","Hewitt","1","1","0.97"),(266,"Avye","Nolan","1","1","2.52"),(267,"Colin","Page","0","1","1.64"),(268,"Prescott","Rutledge","0","0","1.44"),(269,"Stone","Salas","0","1","0.98"),(270,"Bernard","Waters","0","0","2.00");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (271,"Myles","Coleman","0","1","1.68"),(272,"Burton","Mccormick","1","1","2.10"),(273,"Kylee","Knowles","1","0","1.80"),(274,"Trevor","Lambert","0","0","2.92"),(275,"Brenda","Ashley","0","0","0.61"),(276,"Elton","Patterson","0","1","3.09"),(277,"Derek","Hampton","0","0","0.88"),(278,"Regan","Vega","0","1","0.08"),(279,"Hayley","Good","1","1","0.06"),(280,"Haviva","Daugherty","0","1","3.06");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (281,"Steven","Day","1","1","3.27"),(282,"Clinton","Suarez","0","1","0.18"),(283,"Bertha","Noble","0","0","1.42"),(284,"Solomon","Lowe","0","1","1.26"),(285,"Leslie","Tucker","1","1","2.07"),(286,"Eagan","Patrick","1","0","3.21"),(287,"Walter","Delaney","1","0","3.67"),(288,"Carolyn","Summers","0","0","0.48"),(289,"Ruby","Quinn","0","1","1.72"),(290,"Renee","Lee","1","1","1.00");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (291,"Maris","Waller","0","1","2.88"),(292,"Genevieve","Riley","1","1","0.44"),(293,"Zane","Salinas","1","0","2.13"),(294,"Carol","Lynch","0","1","1.68"),(295,"Jaquelyn","Patel","1","1","0.10"),(296,"Rogan","Foley","1","1","3.67"),(297,"Ignatius","Cole","1","1","1.79"),(298,"Nasim","Baker","1","1","2.83"),(299,"Bruce","David","0","1","2.88"),(300,"Glenna","Carter","0","1","3.51");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (301,"Carlos","Kinney","0","0","2.48"),(302,"Bradley","Guerrero","0","0","0.83"),(303,"Genevieve","Curry","1","1","3.65"),(304,"Acton","Wilson","1","1","2.37"),(305,"Jolene","Cline","1","1","0.54"),(306,"Devin","Castillo","0","1","1.02"),(307,"Vanna","Waller","1","0","3.94"),(308,"Rosalyn","Michael","0","0","2.89"),(309,"Grady","Montoya","0","0","3.58"),(310,"Dacey","Weaver","0","0","2.05");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (311,"Donovan","Collins","0","1","0.24"),(312,"Seth","Cooper","1","0","0.26"),(313,"Perry","Wilkins","0","0","2.77"),(314,"Noah","Mckay","1","0","0.64"),(315,"Britanni","Newton","1","0","2.94"),(316,"Brent","Fry","1","0","1.31"),(317,"Joel","Randolph","0","1","0.52"),(318,"Moses","Wise","1","0","3.74"),(319,"Robin","Oconnor","0","0","2.19"),(320,"Micah","Montgomery","0","1","3.14");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (321,"Stella","Hobbs","0","1","2.47"),(322,"Cain","Grant","0","0","1.01"),(323,"Clare","Foster","1","1","1.92"),(324,"Malik","Hooper","0","1","2.22"),(325,"Martha","Russo","1","1","0.43"),(326,"Melinda","Abbott","1","1","1.98"),(327,"Pamela","Holland","0","1","2.16"),(328,"Alyssa","Nelson","1","0","1.11"),(329,"Alec","White","0","0","2.19"),(330,"Eve","Cote","0","1","2.44");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (331,"Kellie","Walsh","1","0","0.91"),(332,"Branden","Tanner","1","0","1.49"),(333,"Benedict","Huff","0","1","1.20"),(334,"Macon","Dickson","1","1","2.82"),(335,"Aaron","Grimes","0","1","1.00"),(336,"Judith","Anderson","1","0","0.41"),(337,"Alexander","Vaughn","1","0","3.90"),(338,"Raymond","Ashley","1","1","1.36"),(339,"Jemima","Pacheco","0","1","2.53"),(340,"Hashim","Sanchez","0","1","2.44");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (341,"Veda","Bray","0","0","1.27"),(342,"Mollie","Young","0","1","2.49"),(343,"Kylan","Ruiz","1","0","3.20"),(344,"Owen","Kramer","1","1","2.48"),(345,"Felix","Nunez","0","1","0.04"),(346,"Richard","Jarvis","0","1","3.81"),(347,"Tyler","Petty","0","1","2.97"),(348,"Nita","Duke","1","0","0.98"),(349,"Ciaran","Cruz","1","1","0.87"),(350,"Sacha","Flores","1","1","0.18");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (351,"Guinevere","Faulkner","0","0","0.31"),(352,"Flavia","Miller","0","0","1.01"),(353,"Tobias","Clarke","0","1","2.69"),(354,"Elijah","Wheeler","0","1","0.22"),(355,"Neil","Allen","1","0","2.52"),(356,"Jason","Knowles","0","1","3.21"),(357,"Timon","Bullock","1","0","2.46"),(358,"Basil","Tanner","1","0","2.39"),(359,"Paki","Mathews","1","0","3.96"),(360,"Quail","Snider","1","1","3.07");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (361,"Keely","Rodgers","0","0","2.00"),(362,"Shana","Avila","0","1","1.15"),(363,"Charde","Rivas","0","0","2.25"),(364,"Xandra","Evans","0","0","3.76"),(365,"Declan","Hicks","1","0","1.51"),(366,"Olympia","Frazier","0","1","1.80"),(367,"Oprah","Stanton","0","1","0.29"),(368,"Bradley","Marsh","1","1","3.27"),(369,"Marah","Raymond","0","1","1.30"),(370,"Ori","Patton","0","0","1.36");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (371,"Jasmine","Park","0","0","0.93"),(372,"Shay","Hooper","0","0","3.98"),(373,"Shafira","Alvarez","0","0","3.07"),(374,"Lesley","Dorsey","1","1","0.19"),(375,"Erasmus","Guerrero","0","0","0.72"),(376,"Nolan","Elliott","1","0","3.19"),(377,"Halee","Sweeney","1","1","0.68"),(378,"Barbara","Griffin","0","1","1.39"),(379,"James","Schneider","0","0","2.57"),(380,"Zane","Singleton","1","1","1.31");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (381,"Conan","Boyer","1","0","3.83"),(382,"Emma","Hamilton","0","1","3.28"),(383,"Vance","Pugh","1","1","3.94"),(384,"Jane","Simpson","1","1","2.01"),(385,"Jin","Garza","1","0","1.60"),(386,"Donovan","Horn","1","0","2.54"),(387,"Freya","Mclean","0","1","1.98"),(388,"Demetrius","Cote","1","0","0.56"),(389,"Kaitlin","Forbes","1","1","2.33"),(390,"Vivian","Barron","0","1","0.64");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (391,"Hayden","Hardin","0","1","1.39"),(392,"Wayne","Irwin","1","1","2.46"),(393,"Magee","Alexander","0","0","2.52"),(394,"Dakota","Mason","1","0","0.31"),(395,"Burke","Guthrie","0","0","0.20"),(396,"Kay","Houston","0","0","1.47"),(397,"Jordan","Brewer","0","1","3.12"),(398,"Carolyn","Grant","1","1","3.63"),(399,"Renee","Cook","0","0","1.12"),(400,"Chester","Conner","1","1","3.24");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (401,"Aimee","Lowery","1","1","1.60"),(402,"Charles","Mendez","0","1","1.90"),(403,"Xaviera","Allison","0","0","2.73"),(404,"Christian","Hubbard","0","1","1.39"),(405,"Leo","Conner","0","1","1.52"),(406,"Violet","Phelps","0","0","0.92"),(407,"Guy","Mcclure","0","0","2.00"),(408,"Beau","Chapman","1","1","0.19"),(409,"Kirby","Livingston","1","1","1.89"),(410,"Felix","Cotton","0","0","0.63");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (411,"Melyssa","Hanson","1","1","1.94"),(412,"Lamar","Rich","1","0","3.06"),(413,"Otto","Whitney","0","1","1.70"),(414,"Joshua","Watson","0","1","2.83"),(415,"Noel","Ratliff","1","1","3.42"),(416,"Ashton","Salazar","1","1","0.07"),(417,"Ferris","Turner","1","1","2.07"),(418,"Anthony","Robles","0","1","1.64"),(419,"Derek","Trevino","0","1","2.53"),(420,"Jerry","Andrews","1","0","2.05");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (421,"Latifah","Norman","0","1","1.05"),(422,"Jordan","Downs","1","1","2.70"),(423,"Lars","Stone","0","0","2.14"),(424,"Brody","Clayton","0","1","1.54"),(425,"Regina","Hampton","0","0","1.55"),(426,"Tatum","Navarro","0","0","1.67"),(427,"Kelsey","Wynn","1","0","3.30"),(428,"Bernard","Burke","0","1","0.27"),(429,"Alyssa","Hopkins","0","1","0.34"),(430,"Deirdre","Herring","0","0","3.31");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (431,"Adrienne","Woodward","1","0","2.52"),(432,"Bruno","Buckner","1","0","0.55"),(433,"Palmer","Bond","1","0","3.05"),(434,"Walter","Grant","0","1","1.98"),(435,"Barbara","Wiggins","0","0","2.22"),(436,"Heidi","Dotson","0","0","3.32"),(437,"Berk","Olson","1","1","0.77"),(438,"Yoko","Warner","0","0","1.03"),(439,"Nomlanga","Graves","1","1","0.27"),(440,"Omar","Valencia","1","1","2.93");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (441,"Hanna","Buckley","1","0","1.39"),(442,"Dolan","Slater","0","1","0.03"),(443,"Zachery","Simpson","0","1","3.18"),(444,"Andrew","Cote","0","0","1.03"),(445,"Lillian","Watson","1","1","1.30"),(446,"Kiara","Bentley","0","1","2.59"),(447,"Reuben","Conley","0","0","3.99"),(448,"Murphy","Lowe","0","1","0.30"),(449,"Nolan","Kennedy","0","0","0.06"),(450,"Janna","Castillo","0","0","3.47");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (451,"Leonard","Hood","1","0","0.18"),(452,"Stone","Mack","0","1","0.28"),(453,"Scott","Chase","0","1","3.82"),(454,"Liberty","Thompson","1","1","3.27"),(455,"Oscar","Herman","1","0","1.19"),(456,"Sebastian","Summers","0","0","0.49"),(457,"Caryn","Waters","0","0","1.12"),(458,"Isabelle","Cummings","0","1","0.11"),(459,"Zia","Albert","1","1","0.60"),(460,"Stacey","Valenzuela","1","0","2.67");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (461,"Daniel","Cohen","0","1","3.46"),(462,"Ulric","Joyner","1","1","2.03"),(463,"Sara","Casey","1","0","3.78"),(464,"Wendy","Serrano","0","1","3.08"),(465,"Carolyn","Alvarado","0","0","3.45"),(466,"Carissa","Gill","0","0","3.29"),(467,"Samantha","Good","1","1","3.26"),(468,"Allegra","Shepard","1","0","3.33"),(469,"Bree","Burris","0","1","2.10"),(470,"Martena","Casey","1","0","1.10");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (471,"Debra","Conway","0","0","2.39"),(472,"Nigel","Steele","0","0","0.20"),(473,"Jescie","Nieves","0","1","0.87"),(474,"Montana","Parsons","1","1","2.49"),(475,"Heather","Walton","1","1","3.09"),(476,"Grady","Delaney","1","1","0.77"),(477,"Ann","Garrett","1","0","1.40"),(478,"Rahim","Conrad","1","1","2.15"),(479,"Grant","Moss","0","1","0.53"),(480,"Dolan","Reyes","1","0","1.05");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (481,"Rina","Kent","0","1","1.46"),(482,"Tallulah","Ware","0","0","1.87"),(483,"Yoshi","Cooley","0","1","0.55"),(484,"Grace","Finch","0","0","0.53"),(485,"Hayes","Lowe","0","0","2.59"),(486,"Destiny","Gould","1","0","1.09"),(487,"Jaime","Weiss","0","1","2.65"),(488,"Brynn","Hopkins","1","1","2.04"),(489,"Desiree","Yang","1","0","0.94"),(490,"Abigail","May","0","1","0.54");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (491,"Finn","Wolfe","1","1","2.13"),(492,"Hayfa","Gillespie","0","1","2.60"),(493,"Kelsie","Herman","0","1","0.31"),(494,"Brandon","Knox","0","1","3.93"),(495,"Blaine","Mcfadden","1","1","0.31"),(496,"Carson","Moses","1","0","3.59"),(497,"Jin","Morin","1","0","2.39"),(498,"Kelly","Buck","0","0","0.74"),(499,"Colby","Huff","1","1","2.18"),(500,"Blossom","Lowery","1","1","2.14");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (501,"Vladimir","Beasley","1","0","2.16"),(502,"Kasimir","Benson","0","0","1.18"),(503,"Tate","Gutierrez","1","0","0.71"),(504,"Belle","Vazquez","1","1","0.86"),(505,"Steel","Mullins","1","1","0.10"),(506,"Maris","Valdez","1","1","0.03"),(507,"Colleen","Mckay","0","1","0.64"),(508,"Coby","Vasquez","0","1","0.66"),(509,"Buffy","Mills","1","0","1.88"),(510,"Reece","Marks","1","1","3.86");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (511,"Audra","Duke","0","1","3.63"),(512,"Evan","Levy","0","1","3.34"),(513,"Nevada","Myers","0","0","1.03"),(514,"Hermione","Shepard","0","1","2.53"),(515,"Tasha","Mcguire","1","1","3.03"),(516,"Carissa","Horn","0","1","0.95"),(517,"Graiden","Meyers","0","1","3.03"),(518,"Angela","Gould","1","0","2.93"),(519,"Zelenia","Callahan","1","0","3.21"),(520,"Jenette","Webb","0","0","1.41");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (521,"Stephen","Page","1","1","2.40"),(522,"Jorden","Weeks","0","0","0.32"),(523,"Hunter","Weeks","0","0","1.17"),(524,"Fuller","Sears","0","0","1.51"),(525,"Colin","Cline","0","1","1.84"),(526,"Lester","Bush","1","0","1.36"),(527,"Petra","Hines","0","0","0.88"),(528,"Ali","Cooper","0","0","3.48"),(529,"Maisie","Cervantes","0","0","0.82"),(530,"Philip","Solis","1","1","0.56");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (531,"Lacey","Wells","0","0","0.81"),(532,"Doris","Dickerson","0","1","3.64"),(533,"Grady","Mosley","0","0","3.40"),(534,"Xanthus","Blackwell","0","1","0.19"),(535,"Honorato","Foreman","0","0","1.54"),(536,"Kadeem","Lambert","0","0","1.83"),(537,"Scarlet","Webb","1","0","2.75"),(538,"Castor","Frazier","1","0","3.30"),(539,"Lucian","Rowland","0","1","0.29"),(540,"Cody","Becker","0","1","2.83");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (541,"Zelda","Schneider","0","0","0.07"),(542,"McKenzie","Hess","1","1","0.14"),(543,"Calista","Barker","0","1","3.67"),(544,"Justine","Petty","1","0","1.85"),(545,"Micah","Cox","1","1","3.17"),(546,"Shay","Gilmore","0","1","0.33"),(547,"Rashad","Andrews","0","0","1.67"),(548,"Chloe","Lowe","1","1","2.56"),(549,"Brent","Callahan","1","1","1.99"),(550,"Neve","Jimenez","1","1","3.79");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (551,"Bruce","Donovan","1","1","2.86"),(552,"Justina","Molina","0","0","2.87"),(553,"Autumn","Lawson","0","0","0.14"),(554,"Keane","Rocha","0","1","0.57"),(555,"Garth","Rush","1","1","3.67"),(556,"Logan","Charles","1","0","1.84"),(557,"Raja","Duncan","1","0","0.24"),(558,"Emmanuel","Whitley","1","0","1.57"),(559,"Hilel","Roach","0","0","1.27"),(560,"Wayne","Franks","1","1","1.02");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (561,"Anastasia","Bolton","0","0","3.89"),(562,"Karen","Garcia","0","0","2.06"),(563,"Colby","Clements","1","1","3.48"),(564,"Garrett","Dale","0","1","3.41"),(565,"Jakeem","Frederick","1","1","0.24"),(566,"Colleen","Jacobs","0","0","1.51"),(567,"Sage","Garrison","1","1","3.39"),(568,"Sage","Martin","0","1","0.32"),(569,"Juliet","Savage","1","1","3.02"),(570,"Nichole","Mcmahon","1","1","0.92");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (571,"Fulton","Ferrell","1","0","1.20"),(572,"Lillith","Donovan","1","0","3.50"),(573,"Kimberly","Nunez","1","0","0.10"),(574,"Elliott","Fry","0","0","3.02"),(575,"Stuart","Cohen","0","1","0.25"),(576,"Fuller","Juarez","0","0","2.91"),(577,"Charde","Wilkinson","0","1","3.44"),(578,"Jamal","Estes","1","1","3.68"),(579,"Owen","Callahan","1","0","1.17"),(580,"Carlos","Huber","0","0","0.21");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (581,"Dalton","Moody","1","1","2.58"),(582,"Oliver","Dean","1","1","0.47"),(583,"Uriel","Diaz","1","1","1.05"),(584,"Zachery","Williamson","1","0","1.28"),(585,"Cathleen","Boone","1","0","3.36"),(586,"Phoebe","Pena","0","1","2.29"),(587,"Abdul","Clemons","1","1","2.17"),(588,"Grant","Ferrell","1","0","2.07"),(589,"Rafael","Anthony","1","0","0.88"),(590,"Audra","Guerrero","1","0","2.48");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (591,"Tanner","Stuart","1","1","0.98"),(592,"Ciara","Dunn","0","0","3.86"),(593,"Keegan","Wynn","0","1","2.19"),(594,"Ulysses","Ward","1","1","3.52"),(595,"Dana","Randall","1","0","0.05"),(596,"Bethany","Meyer","1","0","0.69"),(597,"Jakeem","Vazquez","1","1","3.41"),(598,"Delilah","Mckee","0","0","1.39"),(599,"Dakota","Garcia","0","0","2.42"),(600,"Yen","Pate","1","0","3.80");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (601,"Amelia","Witt","0","1","1.79"),(602,"Fulton","Dickson","1","1","3.40"),(603,"Alfonso","Barry","1","0","1.55"),(604,"Urielle","Dawson","1","0","1.40"),(605,"Gay","Dejesus","0","0","2.10"),(606,"Unity","Roman","1","1","0.48"),(607,"Zachery","Potts","1","0","0.31"),(608,"Shoshana","Hickman","0","1","2.45"),(609,"Jenette","Schmidt","1","0","2.07"),(610,"Colt","Wood","0","0","2.81");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (611,"Ingrid","Kennedy","1","0","2.39"),(612,"John","Nicholson","0","0","0.88"),(613,"Martina","Neal","1","0","0.43"),(614,"Grady","Oliver","0","0","2.07"),(615,"Rogan","Blake","1","1","0.81"),(616,"Shaine","Cross","1","1","3.69"),(617,"Daquan","Palmer","1","0","2.15"),(618,"Peter","Pearson","1","0","1.95"),(619,"Hillary","Rodriquez","0","0","0.60"),(620,"Camilla","Peterson","1","1","0.61");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (621,"Chastity","Gould","1","0","0.28"),(622,"Bernard","Bullock","0","0","0.44"),(623,"Lois","Mcconnell","0","0","3.51"),(624,"Quintessa","Mckinney","1","0","0.08"),(625,"Aristotle","Pruitt","1","1","1.53"),(626,"Doris","Hooper","0","0","2.87"),(627,"Dexter","Greer","1","1","1.51"),(628,"Jasper","Fowler","0","0","3.22"),(629,"Indigo","Baker","1","0","0.71"),(630,"Linus","Skinner","0","0","0.32");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (631,"George","Ferguson","1","0","2.89"),(632,"Jillian","Rocha","1","1","2.91"),(633,"Clio","Olsen","0","1","1.57"),(634,"Nash","Schultz","1","1","0.35"),(635,"Indira","Mccarthy","0","0","2.26"),(636,"Kendall","Sharp","1","1","0.53"),(637,"Edan","Fleming","1","1","0.10"),(638,"Wesley","Horn","1","1","3.61"),(639,"Ira","Shannon","1","0","1.34"),(640,"Cherokee","Vega","1","0","3.03");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (641,"Cara","Snider","0","0","2.58"),(642,"September","Mendez","1","0","1.54"),(643,"Scarlet","Trujillo","1","0","0.40"),(644,"Noel","Carter","1","0","2.97"),(645,"Grady","Case","1","1","0.01"),(646,"Madeson","Lindsey","0","1","3.12"),(647,"Christian","Barnett","1","0","0.91"),(648,"Ashton","Charles","0","0","2.95"),(649,"Dennis","Boyle","0","0","2.63"),(650,"Jade","Garner","1","0","2.52");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (651,"Lewis","Orr","1","1","1.96"),(652,"Ayanna","Perry","0","1","0.57"),(653,"Wing","Mcleod","0","1","0.69"),(654,"Xavier","Landry","0","0","2.28"),(655,"Gemma","Kim","1","1","0.81"),(656,"Stuart","Burks","1","0","3.20"),(657,"Hilel","Mullen","0","0","3.19"),(658,"Jada","Becker","0","0","0.48"),(659,"Paula","Williamson","0","1","2.55"),(660,"Kylie","Garrison","1","1","0.82");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (661,"Todd","Boyle","0","1","3.32"),(662,"Charde","Branch","1","1","1.42"),(663,"Griffith","Dickson","0","0","2.70"),(664,"Cassady","Mclean","1","1","1.61"),(665,"Justina","Hatfield","0","0","0.01"),(666,"Tallulah","Thornton","1","1","2.62"),(667,"Steven","Carey","1","0","0.47"),(668,"Iliana","Carson","0","0","2.48"),(669,"Timothy","Nichols","1","0","0.32"),(670,"Rhiannon","Sparks","0","1","0.44");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (671,"Kessie","Keith","0","0","0.31"),(672,"Hedy","Wooten","0","1","0.05"),(673,"Flynn","Montoya","1","1","0.95"),(674,"Autumn","Blankenship","1","0","3.13"),(675,"Jeremy","Espinoza","1","0","1.87"),(676,"Brennan","Lott","1","0","3.95"),(677,"Mariam","Wooten","1","1","0.34"),(678,"Lila","Beach","0","1","0.11"),(679,"Channing","Burch","1","0","0.40"),(680,"Brynne","Tyler","1","1","3.68");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (681,"Vaughan","Hanson","0","0","1.12"),(682,"Herrod","Wallace","0","0","0.19"),(683,"Alexandra","Diaz","0","0","3.27"),(684,"Gretchen","Hewitt","1","0","0.36"),(685,"Judah","Vasquez","0","1","2.58"),(686,"Melissa","English","0","1","2.83"),(687,"Noel","Wynn","1","0","3.97"),(688,"Quinn","Solis","0","1","0.29"),(689,"Timothy","Cantrell","0","1","2.36"),(690,"Ria","Park","0","0","2.09");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (691,"Denton","Valenzuela","0","1","1.40"),(692,"Maite","Woods","1","1","1.63"),(693,"Wendy","Parsons","0","0","1.17"),(694,"Yoshi","Caldwell","0","1","2.87"),(695,"Marsden","Jacobs","0","0","3.72"),(696,"Finn","Hayden","0","1","3.72"),(697,"Serina","Mccoy","1","0","2.08"),(698,"Donna","Logan","0","0","1.32"),(699,"Lesley","Clemons","1","1","0.83"),(700,"Lawrence","Beck","1","0","0.25");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (701,"Graham","Boyd","1","0","1.46"),(702,"Yoko","Padilla","0","0","1.52"),(703,"Odessa","Estrada","1","1","0.13"),(704,"Herrod","Holden","0","0","0.48"),(705,"Tiger","Curry","0","1","3.57"),(706,"Maya","Wilkerson","0","1","0.82"),(707,"Brynne","Jackson","0","1","2.33"),(708,"Connor","Webb","0","1","1.80"),(709,"Clinton","Todd","1","1","1.17"),(710,"Ignatius","Fields","0","0","2.13");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (711,"Cassady","Lucas","0","0","2.18"),(712,"Sawyer","Bridges","1","1","1.42"),(713,"Kessie","Leon","1","1","3.95"),(714,"Grady","Russo","0","0","2.07"),(715,"Naomi","Dotson","1","0","0.74"),(716,"Robin","Garcia","1","1","1.98"),(717,"Kellie","Blake","1","1","3.57"),(718,"Yoshio","Pope","0","0","2.04"),(719,"Medge","Trevino","1","1","0.68"),(720,"Sophia","Jarvis","1","0","3.87");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (721,"Steven","Ferguson","1","1","2.88"),(722,"Warren","Malone","0","0","1.32"),(723,"Thaddeus","Cruz","0","0","2.35"),(724,"Stuart","Ellis","0","0","3.55"),(725,"Tatum","Pittman","1","0","1.66"),(726,"Jesse","Lewis","0","0","2.03"),(727,"Dahlia","Beard","0","0","2.92"),(728,"Jolene","Foreman","1","1","1.92"),(729,"Scarlet","Gates","0","0","1.76"),(730,"Holmes","Chapman","0","1","3.99");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (731,"Blossom","York","0","1","0.42"),(732,"Howard","Griffin","1","1","1.72"),(733,"Brynn","Gutierrez","1","1","3.04"),(734,"Vanna","Ferrell","0","0","2.80"),(735,"Porter","Cole","0","0","0.66"),(736,"Keiko","Hart","0","1","1.39"),(737,"Casey","Jones","1","1","2.79"),(738,"Linus","Mcclain","1","0","3.58"),(739,"Fletcher","Moses","1","0","3.02"),(740,"Bernard","Bowman","0","1","1.54");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (741,"Sonia","Gilbert","0","0","0.90"),(742,"Emery","Short","0","0","1.86"),(743,"Cheyenne","Finley","1","1","1.23"),(744,"Evangeline","Shepherd","1","1","3.45"),(745,"Tashya","Pope","1","0","2.43"),(746,"Aurelia","Gordon","0","1","1.50"),(747,"Quemby","Buckley","0","1","2.30"),(748,"Elijah","Glass","0","1","0.79"),(749,"Benjamin","Mcguire","0","0","2.34"),(750,"Amir","Baldwin","0","0","1.16");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (751,"Burke","Romero","1","1","1.79"),(752,"Maggie","Keith","0","1","1.59"),(753,"Castor","Cobb","1","0","3.59"),(754,"Graham","Burks","1","1","0.89"),(755,"Cameran","Jacobs","1","0","2.78"),(756,"Solomon","Guzman","0","1","1.75"),(757,"Eve","Richardson","1","0","1.85"),(758,"Nigel","Acosta","1","0","0.58"),(759,"Timothy","Flowers","1","0","3.35"),(760,"Linus","Mack","0","1","3.09");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (761,"Kiayada","Morgan","1","1","3.14"),(762,"Adele","Brooks","1","0","3.69"),(763,"Francis","Rios","1","0","2.16"),(764,"Alyssa","Curry","0","1","0.06"),(765,"Kimberley","Hayden","0","1","1.03"),(766,"Gavin","Mullen","0","1","0.40"),(767,"Connor","Haney","1","0","1.43"),(768,"Basia","Tyler","1","1","2.64"),(769,"Kennedy","Best","1","1","3.33"),(770,"Larissa","Cantu","1","0","2.12");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (771,"Alec","Wall","1","0","1.75"),(772,"Melvin","Watkins","0","1","1.69"),(773,"Glenna","Cole","0","0","0.43"),(774,"Palmer","Nash","0","0","0.65"),(775,"Paula","Richardson","1","1","2.09"),(776,"Abra","King","1","1","1.06"),(777,"Keiko","Powers","0","1","2.10"),(778,"Phoebe","Ewing","0","1","3.70"),(779,"Hector","Robinson","0","1","3.60"),(780,"Ahmed","Randolph","1","1","2.10");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (781,"Graiden","Gibson","1","0","2.56"),(782,"Charles","Bowers","1","0","1.97"),(783,"Noelani","Gregory","0","0","2.74"),(784,"Dustin","Conner","0","0","0.51"),(785,"Rina","Kirk","0","1","1.35"),(786,"Adele","Mcpherson","1","0","2.62"),(787,"Rhiannon","Yang","0","0","0.11"),(788,"Jena","Gilliam","0","0","0.21"),(789,"Briar","Wilcox","1","1","2.44"),(790,"Allen","House","1","1","0.22");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (791,"TaShya","Berry","1","0","2.59"),(792,"Riley","Dominguez","1","1","1.65"),(793,"Trevor","Cole","1","0","2.94"),(794,"Susan","Harper","1","1","1.35"),(795,"Lynn","Valdez","1","1","1.23"),(796,"Kasper","Berg","0","0","3.17"),(797,"Nichole","White","0","1","0.09"),(798,"Cooper","Hendrix","0","1","3.11"),(799,"Aiko","Odom","1","0","2.46"),(800,"Serina","Frank","0","1","1.10");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (801,"Alyssa","Valdez","1","0","0.94"),(802,"Ali","Barker","0","0","2.60"),(803,"Anthony","Lane","0","1","1.04"),(804,"Dora","Maynard","0","1","0.34"),(805,"Thomas","Davenport","1","1","2.17"),(806,"Noelani","Payne","0","1","1.24"),(807,"Cynthia","Hicks","1","1","1.17"),(808,"Petra","Johnston","1","0","2.25"),(809,"Cameron","Rogers","1","0","1.45"),(810,"Lacota","Kerr","0","1","3.05");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (811,"Michael","Alford","0","0","1.42"),(812,"Eve","Briggs","0","1","1.62"),(813,"Jasper","Zimmerman","1","0","2.13"),(814,"Erasmus","Cummings","1","1","3.53"),(815,"George","Foreman","0","0","2.95"),(816,"Francesca","Burton","1","0","2.20"),(817,"Jasper","Marshall","1","0","2.34"),(818,"Reuben","Sanchez","1","0","3.07"),(819,"Quemby","Conway","1","1","3.30"),(820,"Madonna","Potts","0","0","3.21");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (821,"Zena","Britt","0","0","1.53"),(822,"Zane","Mcclain","1","1","3.92"),(823,"Orli","Farley","1","1","1.01"),(824,"Nasim","Moody","1","0","0.01"),(825,"Jonah","Cline","0","0","0.05"),(826,"Alexandra","Barrett","0","1","0.78"),(827,"Thomas","Reeves","0","1","0.89"),(828,"Oprah","Odom","0","0","3.72"),(829,"Jonah","Slater","1","1","2.90"),(830,"Hilel","Howell","0","1","1.85");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (831,"Griffith","Baird","0","1","3.84"),(832,"Allistair","Sawyer","1","1","1.65"),(833,"Jerry","Berg","1","0","3.22"),(834,"Idona","Pittman","0","0","2.14"),(835,"Ima","Jimenez","0","0","0.35"),(836,"Akeem","Wilcox","0","0","3.85"),(837,"Keegan","Macdonald","0","0","1.13"),(838,"Julian","Rose","1","1","2.22"),(839,"Leigh","Gray","0","1","0.40"),(840,"Ulysses","Weeks","0","0","2.07");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (841,"Velma","Chan","0","0","3.31"),(842,"Maggie","Atkins","1","1","2.52"),(843,"Solomon","Clemons","1","0","0.96"),(844,"Ann","Dickerson","0","1","0.54"),(845,"Reed","Austin","0","0","0.59"),(846,"Aline","Singleton","0","0","3.17"),(847,"Julian","Moon","0","1","0.04"),(848,"Owen","Ellison","0","0","2.11"),(849,"Anastasia","Wiggins","0","0","1.80"),(850,"Jeremy","Callahan","1","0","3.34");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (851,"Martina","Bender","0","1","2.44"),(852,"Boris","Ewing","1","0","0.33"),(853,"Inga","Norris","1","0","2.91"),(854,"Kellie","Nunez","1","1","3.10"),(855,"Aidan","Parrish","0","0","3.48"),(856,"Cade","Burnett","1","1","1.78"),(857,"Chantale","Barrera","0","1","3.87"),(858,"Deborah","Gilbert","0","0","3.89"),(859,"Aimee","Sargent","0","0","1.10"),(860,"Emi","Singleton","1","1","2.19");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (861,"Amir","Curry","1","0","3.48"),(862,"Eagan","Wynn","0","0","0.42"),(863,"Jelani","Hobbs","0","1","3.17"),(864,"Scott","Crosby","1","1","3.85"),(865,"Winifred","Hines","0","0","2.64"),(866,"Dolan","Hodges","1","0","0.98"),(867,"Madison","Faulkner","0","1","3.13"),(868,"Haviva","Wynn","1","1","1.69"),(869,"Vaughan","Duran","1","0","3.99"),(870,"Logan","Woodward","1","0","2.88");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (871,"Mona","Brewer","1","0","1.11"),(872,"Willow","Richard","0","0","3.50"),(873,"Hamish","Wilcox","0","1","3.71"),(874,"Dominic","Figueroa","1","0","1.17"),(875,"Vernon","Patterson","0","0","3.03"),(876,"Penelope","Dominguez","1","1","0.65"),(877,"Perry","Pena","0","1","0.89"),(878,"Justin","Green","0","0","3.78"),(879,"Lucas","Howell","0","1","2.54"),(880,"Ulric","Vincent","1","1","1.73");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (881,"Alfonso","Booker","0","0","2.95"),(882,"Vivian","Murphy","0","0","2.80"),(883,"Jared","Ingram","0","1","0.27"),(884,"Lucian","Frazier","0","0","2.61"),(885,"Oscar","Curtis","0","0","2.82"),(886,"Victor","Reilly","0","1","2.88"),(887,"George","Ballard","0","1","2.53"),(888,"Paloma","Monroe","0","0","0.82"),(889,"Caesar","Gutierrez","0","1","0.80"),(890,"Lillian","Carpenter","0","0","2.69");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (891,"James","Shannon","0","1","1.62"),(892,"Dillon","Vaughan","0","0","3.82"),(893,"Noble","Carr","0","0","0.27"),(894,"Olivia","Mccray","0","1","3.09"),(895,"Rudyard","Wynn","1","0","2.50"),(896,"Shana","Carver","1","1","0.38"),(897,"Illana","Best","0","0","2.42"),(898,"Taylor","Raymond","0","1","2.01"),(899,"Dai","Tyson","0","1","1.50"),(900,"Porter","Hatfield","1","1","1.47");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (901,"Sydnee","Vaughan","0","1","0.06"),(902,"Ethan","Higgins","0","1","2.04"),(903,"Brendan","Holmes","1","0","0.90"),(904,"Ina","Hurst","1","1","2.53"),(905,"Whitney","Valenzuela","1","1","1.31"),(906,"Karleigh","Jacobson","0","0","0.79"),(907,"Claire","Noel","0","0","0.69"),(908,"Iona","Velasquez","1","1","3.18"),(909,"Chelsea","Oconnor","1","1","2.88"),(910,"Gay","Howell","1","0","0.35");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (911,"Martin","Mcneil","0","0","1.76"),(912,"Gregory","Vinson","0","0","1.84"),(913,"Ursula","Arnold","1","0","1.27"),(914,"Dillon","Parker","0","1","2.27"),(915,"Wynne","Lindsey","0","0","0.45"),(916,"Walter","Herring","0","0","1.62"),(917,"Merrill","Garza","1","1","1.13"),(918,"Keith","Haney","1","0","0.06"),(919,"Stuart","Robertson","0","1","1.67"),(920,"Kalia","Mccoy","1","1","0.46");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (921,"Macaulay","Edwards","1","0","1.15"),(922,"Imani","Nieves","1","0","0.36"),(923,"Yvette","Fletcher","0","1","2.75"),(924,"Aladdin","Anthony","1","1","3.59"),(925,"Tasha","Clark","1","0","3.63"),(926,"Hasad","Bowers","0","1","3.65"),(927,"Indira","Glover","1","1","1.34"),(928,"Brenda","Reid","0","0","0.19"),(929,"Brianna","Berry","0","1","0.77"),(930,"Zelda","Chaney","1","0","1.00");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (931,"Rooney","Pennington","1","0","3.38"),(932,"Drew","Gould","1","0","3.32"),(933,"Zephania","Barnes","1","1","3.55"),(934,"Kiara","Hunt","0","0","1.44"),(935,"Zeus","Langley","1","0","1.16"),(936,"Myra","Guzman","1","1","3.03"),(937,"Raja","Joseph","0","1","2.29"),(938,"Margaret","Hickman","0","0","1.67"),(939,"Mollie","Hess","0","0","3.68"),(940,"Sade","Vargas","0","1","1.98");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (941,"Keaton","Turner","0","0","3.97"),(942,"Velma","Roy","0","0","2.70"),(943,"Natalie","Short","1","1","1.97"),(944,"Chaim","Weber","1","1","0.88"),(945,"Lyle","Savage","1","1","3.22"),(946,"Aquila","Decker","1","0","0.64"),(947,"Leilani","Goodwin","0","1","2.06"),(948,"Shaeleigh","Bruce","1","0","3.58"),(949,"Connor","Caldwell","0","1","1.68"),(950,"Shelley","Trevino","0","0","3.77");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (951,"Tatyana","Sloan","1","0","2.02"),(952,"Olga","Wheeler","1","0","3.32"),(953,"Chloe","Maddox","1","1","1.93"),(954,"Angelica","Middleton","1","1","0.00"),(955,"William","Maldonado","1","0","1.53"),(956,"Whoopi","Kidd","1","1","0.88"),(957,"Adam","Delacruz","1","0","3.73"),(958,"Cody","Cox","0","1","0.32"),(959,"Christian","Fox","1","0","3.42"),(960,"Maisie","Salazar","1","0","0.13");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (961,"Zeus","Perez","1","1","0.42"),(962,"Raja","Buck","1","1","2.65"),(963,"Lee","Beard","1","1","0.13"),(964,"Mallory","Schultz","1","1","3.70"),(965,"Odessa","Boyle","0","0","3.54"),(966,"Quinn","Davenport","1","0","1.86"),(967,"Leilani","Martin","0","1","1.03"),(968,"Raya","Rodriquez","0","0","1.26"),(969,"Yuli","Compton","1","0","3.79"),(970,"Kuame","Knight","0","1","2.45");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (971,"Bell","Medina","0","0","3.30"),(972,"Adam","Roach","0","1","3.32"),(973,"Ginger","French","0","1","1.91"),(974,"Tara","Hahn","1","1","0.98"),(975,"Chase","Browning","0","0","3.27"),(976,"Declan","Daugherty","0","0","0.65"),(977,"Hector","Fitzgerald","0","1","0.50"),(978,"Darius","Morgan","1","0","2.82"),(979,"Leah","Pope","1","0","2.10"),(980,"Seth","Griffith","1","1","3.39");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (981,"Raphael","Haynes","1","0","1.08"),(982,"Uriah","Sosa","0","1","1.60"),(983,"Halla","Doyle","0","0","3.76"),(984,"Rajah","Kramer","0","0","0.87"),(985,"Ray","Simmons","0","0","3.59"),(986,"Logan","Macdonald","1","1","0.08"),(987,"Nathan","Holder","0","0","1.96"),(988,"Josephine","Crane","0","1","3.84"),(989,"Jaime","Butler","0","0","3.53"),(990,"Wanda","Page","0","1","1.84");
INSERT INTO Student (StudentId,FirstName,LastName,OnCampus,IsWorking,GPA) VALUES (991,"Xavier","Jones","1","1","3.14"),(992,"Ali","Giles","1","1","1.17"),(993,"Ulric","Sharp","0","0","1.09"),(994,"Hall","Britt","0","1","2.16"),(995,"Brendan","Owens","1","1","1.92"),(996,"Leonard","Benton","0","1","2.15"),(997,"Jamalia","Page","1","1","3.19"),(998,"Tamekah","Mckenzie","1","0","0.87"),(999,"Maxwell","Hudson","0","0","1.77"),(1000,"Jena","Clay","0","1","0.79");


INSERT INTO ActivityStudent VALUES ('3','8','0'),
('8','9','1'),
('19','4','0'),
('20','7','0'),
('22','8','0'),
('23','1','1'),
('24','8','1'),
('25','10','0'),
('27','4','0'),
('29','7','0'),
('31','10','1'),
('38','10','0'),
('44','6','0'),
('48','8','0'),
('55','3','0'),
('59','8','0'),
('77','2','1'),
('78','8','1'),
('82','9','0'),
('86','10','0'),
('90','9','1'),
('92','5','0'),
('96','1','0'),
('100','9','1'),
('106','3','0'),
('107','7','0'),
('111','6','0'),
('112','6','0'),
('115','6','0'),
('118','4','1'),
('119','7','0'),
('120','4','0'),
('121','6','0'),
('123','10','1'),
('124','5','0'),
('126','3','0'),
('127','4','0'),
('139','9','1'),
('143','10','0'),
('147','2','0'),
('151','4','0'),
('152','6','0'),
('156','8','1'),
('168','8','0'),
('169','8','0'),
('170','9','0'),
('172','10','0'),
('173','2','0'),
('174','1','0'),
('180','6','0'),
('181','4','0'),
('183','10','0'),
('187','7','1'),
('200','5','0'),
('203','3','0'),
('211','9','0'),
('212','9','0'),
('216','2','1'),
('217','10','0'),
('219','4','0'),
('223','10','1'),
('225','4','1'),
('227','1','0'),
('233','10','0'),
('234','4','0'),
('240','5','1'),
('245','10','1'),
('246','10','1'),
('248','5','0'),
('251','2','0'),
('254','2','0'),
('259','6','0'),
('264','6','1'),
('267','5','0'),
('270','3','0'),
('272','3','0'),
('277','4','0'),
('280','5','1'),
('281','1','0'),
('283','5','1'),
('284','4','0'),
('287','4','0'),
('297','3','1'),
('298','4','0'),
('299','3','0'),
('300','3','0'),
('306','8','1'),
('309','1','1'),
('311','10','0'),
('312','10','0'),
('314','8','0'),
('316','2','0'),
('319','1','1'),
('321','6','0'),
('322','5','1'),
('323','4','0'),
('331','10','0'),
('337','10','0'),
('338','6','1'),
('339','4','0'),
('343','10','0'),
('347','9','0'),
('348','4','0'),
('349','1','0'),
('350','1','0'),
('359','8','0'),
('362','6','1'),
('364','9','1'),
('365','2','0'),
('366','8','0'),
('367','10','0'),
('368','3','1'),
('375','4','0'),
('392','1','0'),
('393','5','1'),
('394','3','1'),
('401','4','0'),
('407','2','1'),
('408','4','1'),
('410','5','0'),
('413','3','1'),
('417','7','0'),
('418','8','1'),
('423','2','0'),
('424','1','0'),
('427','1','1'),
('431','1','1'),
('432','8','0'),
('434','10','1'),
('440','2','0'),
('441','9','0'),
('442','5','0'),
('444','10','1'),
('446','8','0'),
('447','3','0'),
('453','10','1'),
('456','10','1'),
('466','10','0'),
('470','7','0'),
('471','6','0'),
('479','4','0'),
('484','3','0'),
('485','10','0'),
('487','6','0'),
('489','4','1'),
('491','5','0'),
('496','7','0'),
('497','3','0'),
('498','4','0'),
('501','5','0'),
('504','4','0'),
('511','6','1'),
('512','2','0'),
('513','6','1'),
('519','10','1'),
('522','4','0'),
('532','7','0'),
('535','2','0'),
('544','8','0'),
('546','4','1'),
('553','7','0'),
('554','5','0'),
('555','3','1'),
('556','5','0'),
('559','4','1'),
('560','7','0'),
('564','2','0'),
('566','10','0'),
('571','2','0'),
('574','10','1'),
('584','9','0'),
('585','10','0'),
('593','1','0'),
('595','5','0'),
('604','8','0'),
('612','8','1'),
('614','10','0'),
('618','9','0'),
('621','10','0'),
('622','4','1'),
('623','4','0'),
('624','2','0'),
('634','5','0'),
('635','7','0'),
('637','4','0'),
('640','9','0'),
('650','6','1'),
('654','6','0'),
('659','6','0'),
('660','7','0'),
('665','4','1'),
('667','3','1'),
('668','9','1'),
('670','5','0'),
('671','2','0'),
('672','1','0'),
('683','3','0'),
('695','10','0'),
('698','9','0'),
('700','8','1'),
('701','2','0'),
('704','3','0'),
('706','8','0'),
('708','8','1'),
('709','9','0'),
('713','5','0'),
('716','1','0'),
('717','2','0'),
('720','1','0'),
('723','2','0'),
('724','7','1'),
('727','2','0'),
('735','2','0'),
('737','4','0'),
('738','1','0'),
('739','3','0'),
('740','5','1'),
('742','8','0'),
('751','2','0'),
('752','10','0'),
('753','8','0'),
('759','3','0'),
('762','6','0'),
('777','6','0'),
('780','4','1'),
('783','8','0'),
('784','10','0'),
('790','5','0'),
('791','5','0'),
('794','4','0'),
('795','2','0'),
('797','9','0'),
('800','1','0'),
('803','3','0'),
('810','5','0'),
('811','8','0'),
('816','6','0'),
('819','4','0'),
('820','5','0'),
('821','9','1'),
('826','4','0'),
('830','8','0'),
('833','8','1'),
('834','9','0'),
('839','5','0'),
('844','5','0'),
('845','2','0'),
('846','7','1'),
('853','10','0'),
('856','6','0'),
('859','8','0'),
('860','10','0'),
('867','4','0'),
('873','1','1'),
('874','7','0'),
('875','7','1'),
('876','6','1'),
('878','7','1'),
('881','4','1'),
('882','10','0'),
('886','10','0'),
('887','3','0'),
('888','10','1'),
('890','9','1'),
('891','10','0'),
('893','3','1'),
('894','2','0'),
('897','3','0'),
('899','5','0'),
('901','1','0'),
('903','2','0'),
('907','5','0'),
('915','7','1'),
('917','2','1'),
('920','5','1'),
('924','3','1'),
('926','2','0'),
('929','6','0'),
('930','4','0'),
('931','3','1'),
('937','1','0'),
('938','9','0'),
('939','10','0'),
('940','4','0'),
('943','5','1'),
('947','5','0'),
('960','6','1'),
('963','1','0'),
('964','9','0'),
('965','5','0'),
('967','10','0'),
('970','7','0'),
('972','9','1'),
('979','2','0'),
('981','7','0'),
('984','3','0'),
('989','5','1'),
('991','5','0'),
('993','3','0'),
('994','8','1');

INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,1,0),(1,2,1),(1,3,4),(2,4,2),(1,5,4),(2,6,2),(1,7,0),(1,8,3),(1,9,0),(1,10,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,11,1),(1,12,4),(1,13,4),(1,14,1),(2,15,3),(2,16,1),(1,17,1),(1,18,2),(2,19,0),(1,20,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,21,0),(1,22,1),(2,23,2),(1,24,2),(2,25,2),(1,26,2),(2,27,2),(2,28,1),(2,29,3),(1,30,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,31,3),(2,32,3),(2,33,0),(1,34,4),(2,35,4),(1,36,4),(2,37,3),(2,38,1),(1,39,2),(2,40,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,41,3),(2,42,0),(1,43,3),(1,44,1),(1,45,0),(1,46,4),(1,47,2),(1,48,3),(1,49,1),(1,50,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,51,0),(2,52,3),(2,53,1),(2,54,1),(2,55,2),(2,56,4),(2,57,2),(1,58,0),(2,59,3),(2,60,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,61,4),(2,62,2),(1,63,3),(2,64,2),(1,65,4),(2,66,1),(1,67,2),(1,68,2),(2,69,2),(2,70,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,71,1),(1,72,4),(2,73,3),(1,74,1),(2,75,1),(2,76,4),(2,77,0),(1,78,2),(1,79,4),(2,80,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,81,0),(2,82,3),(2,83,3),(1,84,4),(2,85,1),(2,86,2),(1,87,3),(2,88,4),(1,89,1),(2,90,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,91,0),(1,92,4),(2,93,4),(1,94,0),(1,95,3),(2,96,0),(2,97,1),(2,98,0),(2,99,0),(2,100,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,101,1),(2,102,0),(1,103,1),(1,104,4),(1,105,3),(2,106,2),(1,107,1),(1,108,3),(1,109,4),(1,110,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,111,2),(1,112,2),(2,113,0),(1,114,3),(1,115,0),(2,116,0),(1,117,2),(2,118,1),(2,119,0),(2,120,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,121,3),(1,122,4),(2,123,1),(1,124,1),(2,125,2),(2,126,0),(2,127,2),(2,128,2),(1,129,4),(2,130,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,131,2),(1,132,2),(1,133,4),(2,134,2),(1,135,4),(2,136,4),(2,137,2),(2,138,0),(1,139,4),(2,140,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,141,4),(2,142,1),(2,143,4),(1,144,1),(1,145,2),(2,146,0),(2,147,3),(2,148,0),(1,149,4),(1,150,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,151,1),(2,152,4),(1,153,4),(1,154,0),(1,155,3),(2,156,2),(2,157,0),(1,158,0),(1,159,0),(2,160,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,161,2),(1,162,2),(1,163,1),(2,164,2),(2,165,2),(2,166,1),(1,167,4),(1,168,3),(2,169,1),(2,170,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,171,1),(2,172,3),(1,173,0),(1,174,3),(1,175,0),(2,176,0),(1,177,1),(2,178,3),(2,179,0),(1,180,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,181,4),(2,182,3),(1,183,2),(2,184,2),(1,185,3),(1,186,0),(2,187,4),(1,188,1),(1,189,4),(2,190,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,191,1),(2,192,4),(1,193,1),(2,194,4),(1,195,1),(2,196,3),(1,197,0),(1,198,4),(1,199,0),(2,200,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,201,3),(1,202,0),(1,203,2),(2,204,2),(1,205,3),(1,206,4),(1,207,1),(1,208,1),(2,209,0),(1,210,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,211,2),(1,212,4),(2,213,0),(2,214,1),(1,215,1),(2,216,2),(2,217,3),(1,218,2),(2,219,0),(1,220,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,221,2),(2,222,3),(2,223,4),(1,224,2),(1,225,4),(2,226,4),(1,227,2),(2,228,3),(1,229,2),(2,230,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,231,2),(2,232,4),(1,233,2),(1,234,2),(2,235,4),(2,236,4),(2,237,4),(2,238,4),(2,239,0),(1,240,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,241,3),(2,242,3),(2,243,2),(2,244,0),(2,245,1),(1,246,1),(1,247,3),(1,248,0),(2,249,4),(1,250,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,251,2),(1,252,4),(1,253,1),(2,254,1),(1,255,2),(2,256,4),(2,257,3),(2,258,0),(2,259,2),(2,260,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,261,4),(1,262,3),(1,263,0),(1,264,0),(2,265,4),(2,266,0),(1,267,2),(1,268,0),(1,269,4),(1,270,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,271,0),(2,272,4),(2,273,3),(2,274,1),(1,275,2),(1,276,4),(2,277,4),(1,278,1),(2,279,4),(1,280,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,281,3),(1,282,3),(2,283,3),(1,284,0),(2,285,3),(1,286,3),(1,287,4),(1,288,0),(2,289,0),(2,290,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,291,3),(2,292,1),(1,293,1),(2,294,0),(1,295,2),(1,296,3),(2,297,2),(1,298,1),(1,299,4),(2,300,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,301,0),(1,302,1),(2,303,3),(2,304,3),(1,305,0),(1,306,0),(2,307,3),(1,308,1),(2,309,2),(2,310,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,311,1),(2,312,2),(1,313,4),(1,314,1),(1,315,1),(1,316,0),(2,317,0),(2,318,2),(1,319,1),(2,320,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,321,4),(1,322,1),(2,323,3),(2,324,1),(2,325,4),(2,326,2),(2,327,0),(2,328,3),(1,329,2),(1,330,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,331,1),(2,332,2),(1,333,4),(1,334,4),(2,335,0),(2,336,2),(1,337,4),(1,338,1),(1,339,1),(1,340,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,341,3),(1,342,3),(1,343,3),(2,344,4),(2,345,2),(1,346,4),(2,347,2),(2,348,1),(2,349,4),(2,350,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,351,1),(1,352,2),(2,353,1),(1,354,0),(2,355,4),(2,356,3),(1,357,4),(2,358,0),(1,359,1),(2,360,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,361,0),(2,362,4),(2,363,3),(1,364,3),(2,365,4),(1,366,4),(2,367,4),(2,368,0),(1,369,1),(2,370,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,371,4),(1,372,2),(2,373,4),(2,374,2),(2,375,1),(2,376,4),(2,377,2),(1,378,4),(1,379,3),(2,380,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,381,0),(2,382,0),(1,383,1),(1,384,0),(1,385,3),(1,386,2),(2,387,1),(1,388,1),(2,389,1),(1,390,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,391,4),(1,392,4),(1,393,0),(1,394,3),(1,395,1),(2,396,4),(2,397,0),(2,398,2),(2,399,2),(1,400,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,401,1),(2,402,1),(2,403,4),(2,404,2),(1,405,4),(1,406,3),(2,407,0),(2,408,1),(2,409,0),(2,410,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,411,1),(1,412,0),(2,413,1),(2,414,3),(1,415,4),(2,416,0),(1,417,2),(1,418,0),(2,419,1),(1,420,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,421,0),(2,422,3),(2,423,1),(2,424,0),(2,425,1),(2,426,1),(2,427,2),(2,428,4),(1,429,2),(1,430,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,431,1),(2,432,1),(2,433,4),(1,434,2),(2,435,2),(1,436,0),(1,437,0),(1,438,4),(1,439,3),(1,440,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,441,4),(2,442,2),(1,443,3),(1,444,4),(2,445,2),(1,446,4),(1,447,4),(2,448,2),(2,449,2),(1,450,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,451,0),(2,452,3),(2,453,3),(1,454,4),(2,455,3),(2,456,3),(2,457,3),(2,458,0),(2,459,1),(2,460,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,461,1),(1,462,2),(2,463,1),(2,464,4),(2,465,1),(1,466,4),(2,467,1),(1,468,2),(2,469,0),(2,470,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,471,3),(1,472,1),(2,473,3),(2,474,4),(2,475,3),(1,476,1),(2,477,2),(2,478,4),(2,479,3),(1,480,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,481,2),(2,482,0),(1,483,0),(1,484,0),(1,485,4),(2,486,1),(1,487,0),(1,488,2),(1,489,2),(1,490,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,491,1),(1,492,1),(2,493,4),(2,494,2),(1,495,3),(2,496,4),(2,497,4),(2,498,4),(1,499,3),(2,500,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,501,3),(2,502,0),(2,503,3),(1,504,3),(2,505,1),(2,506,0),(2,507,4),(1,508,1),(1,509,4),(2,510,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,511,4),(1,512,2),(1,513,2),(2,514,1),(1,515,2),(1,516,1),(1,517,4),(1,518,1),(1,519,3),(2,520,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,521,0),(1,522,4),(1,523,1),(2,524,1),(1,525,2),(1,526,2),(2,527,2),(2,528,2),(1,529,1),(2,530,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,531,2),(2,532,2),(2,533,4),(2,534,0),(2,535,3),(1,536,1),(2,537,3),(1,538,0),(1,539,1),(1,540,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,541,2),(1,542,2),(2,543,0),(1,544,3),(2,545,3),(2,546,4),(2,547,0),(1,548,3),(2,549,4),(1,550,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,551,4),(1,552,2),(2,553,4),(1,554,3),(2,555,4),(1,556,1),(2,557,3),(1,558,0),(2,559,4),(1,560,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,561,0),(1,562,3),(2,563,4),(2,564,4),(1,565,3),(2,566,4),(2,567,3),(2,568,1),(2,569,1),(1,570,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,571,2),(2,572,3),(1,573,4),(2,574,3),(2,575,0),(2,576,1),(2,577,1),(1,578,4),(1,579,1),(2,580,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,581,0),(1,582,3),(1,583,3),(1,584,1),(1,585,4),(1,586,0),(2,587,1),(1,588,4),(2,589,4),(1,590,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,591,3),(2,592,3),(1,593,0),(1,594,3),(2,595,4),(1,596,0),(2,597,2),(1,598,0),(1,599,2),(2,600,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,601,4),(1,602,1),(1,603,0),(2,604,1),(1,605,3),(2,606,1),(2,607,3),(2,608,3),(1,609,3),(1,610,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,611,0),(2,612,0),(2,613,0),(2,614,0),(1,615,4),(2,616,0),(2,617,3),(2,618,3),(1,619,0),(1,620,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,621,2),(2,622,0),(1,623,1),(2,624,4),(2,625,3),(2,626,4),(1,627,4),(2,628,4),(2,629,3),(1,630,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,631,3),(1,632,1),(1,633,0),(2,634,2),(2,635,0),(2,636,1),(1,637,3),(1,638,4),(2,639,2),(2,640,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,641,3),(2,642,2),(2,643,1),(2,644,0),(1,645,2),(2,646,4),(2,647,0),(2,648,0),(2,649,1),(2,650,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,651,1),(1,652,1),(1,653,0),(1,654,4),(1,655,4),(2,656,3),(1,657,3),(1,658,4),(1,659,1),(2,660,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,661,4),(2,662,0),(1,663,0),(1,664,0),(2,665,2),(2,666,2),(1,667,4),(1,668,4),(2,669,2),(2,670,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,671,1),(2,672,2),(1,673,3),(1,674,4),(2,675,2),(1,676,2),(1,677,3),(2,678,0),(2,679,1),(2,680,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,681,4),(1,682,3),(1,683,2),(1,684,1),(1,685,1),(2,686,2),(2,687,0),(2,688,0),(1,689,1),(2,690,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,691,2),(2,692,2),(1,693,4),(1,694,4),(2,695,1),(2,696,2),(1,697,0),(1,698,4),(1,699,3),(2,700,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,701,2),(1,702,1),(2,703,2),(1,704,1),(1,705,2),(2,706,0),(1,707,1),(2,708,0),(2,709,3),(2,710,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,711,0),(1,712,4),(2,713,1),(2,714,3),(1,715,1),(2,716,1),(2,717,0),(2,718,2),(2,719,3),(2,720,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,721,2),(1,722,3),(1,723,1),(2,724,4),(1,725,3),(2,726,3),(2,727,0),(2,728,0),(1,729,1),(2,730,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,731,1),(2,732,4),(2,733,3),(2,734,3),(2,735,4),(2,736,3),(2,737,3),(2,738,1),(1,739,3),(2,740,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,741,2),(1,742,2),(1,743,2),(1,744,0),(1,745,4),(1,746,0),(2,747,1),(2,748,4),(2,749,3),(2,750,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,751,1),(1,752,3),(2,753,3),(1,754,2),(1,755,1),(1,756,0),(2,757,1),(2,758,2),(1,759,3),(2,760,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,761,0),(2,762,0),(2,763,0),(1,764,4),(2,765,0),(2,766,0),(1,767,4),(2,768,1),(2,769,4),(1,770,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,771,1),(2,772,3),(2,773,3),(2,774,4),(2,775,4),(1,776,1),(1,777,0),(1,778,2),(2,779,0),(2,780,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,781,2),(2,782,1),(2,783,3),(1,784,1),(2,785,3),(2,786,3),(2,787,2),(1,788,2),(1,789,4),(1,790,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,791,1),(2,792,1),(2,793,1),(1,794,1),(2,795,3),(2,796,0),(2,797,2),(1,798,1),(2,799,2),(2,800,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,801,2),(1,802,0),(1,803,0),(2,804,1),(1,805,0),(2,806,0),(1,807,2),(1,808,3),(2,809,2),(2,810,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,811,3),(2,812,4),(2,813,4),(1,814,3),(1,815,2),(1,816,4),(2,817,2),(2,818,2),(1,819,2),(2,820,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,821,2),(1,822,3),(2,823,4),(2,824,2),(1,825,2),(2,826,1),(2,827,3),(1,828,0),(2,829,3),(1,830,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,831,3),(2,832,4),(2,833,0),(2,834,3),(1,835,2),(2,836,1),(2,837,4),(1,838,4),(1,839,1),(2,840,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,841,3),(1,842,3),(1,843,2),(2,844,1),(2,845,0),(2,846,4),(2,847,2),(1,848,0),(2,849,4),(2,850,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,851,0),(1,852,4),(1,853,4),(2,854,1),(2,855,4),(1,856,1),(1,857,0),(2,858,2),(1,859,4),(1,860,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,861,3),(1,862,4),(1,863,0),(1,864,1),(1,865,3),(1,866,0),(2,867,0),(2,868,0),(2,869,0),(2,870,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,871,0),(2,872,2),(1,873,1),(2,874,4),(1,875,4),(2,876,4),(2,877,4),(1,878,0),(2,879,0),(1,880,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,881,2),(2,882,1),(1,883,2),(2,884,2),(1,885,3),(1,886,0),(1,887,3),(2,888,1),(1,889,1),(2,890,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,891,0),(2,892,4),(1,893,2),(2,894,0),(1,895,2),(2,896,0),(2,897,1),(1,898,4),(1,899,4),(1,900,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,901,3),(1,902,1),(2,903,4),(2,904,2),(1,905,4),(1,906,0),(2,907,0),(1,908,3),(2,909,2),(2,910,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,911,3),(2,912,4),(1,913,0),(1,914,3),(1,915,3),(2,916,2),(1,917,4),(1,918,1),(1,919,3),(2,920,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,921,0),(2,922,0),(2,923,2),(1,924,3),(1,925,1),(1,926,4),(1,927,4),(1,928,4),(1,929,0),(1,930,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,931,1),(2,932,4),(2,933,4),(2,934,2),(2,935,1),(1,936,1),(1,937,1),(1,938,4),(1,939,4),(2,940,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,941,1),(2,942,4),(1,943,3),(2,944,2),(1,945,2),(1,946,0),(2,947,1),(1,948,1),(2,949,3),(1,950,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (2,951,4),(2,952,3),(2,953,3),(1,954,2),(2,955,4),(1,956,0),(1,957,3),(2,958,1),(2,959,4),(1,960,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,961,3),(1,962,4),(1,963,2),(1,964,2),(2,965,0),(1,966,0),(2,967,0),(2,968,2),(2,969,3),(2,970,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,971,1),(1,972,0),(2,973,1),(1,974,1),(2,975,1),(2,976,4),(2,977,0),(2,978,1),(1,979,0),(1,980,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,981,1),(2,982,2),(2,983,3),(1,984,2),(1,985,3),(1,986,0),(2,987,0),(2,988,2),(1,989,2),(1,990,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (1,991,1),(2,992,2),(1,993,4),(2,994,3),(2,995,3),(1,996,2),(2,997,3),(2,998,3),(2,999,1),(1,1000,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,1,1),(3,2,3),(4,3,0),(4,4,0),(4,5,1),(3,6,3),(4,7,4),(3,8,0),(4,9,0),(4,10,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,11,4),(3,12,1),(4,13,2),(4,14,1),(3,15,4),(3,16,2),(4,17,1),(3,18,3),(4,19,1),(3,20,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,21,1),(4,22,1),(4,23,2),(3,24,3),(4,25,4),(3,26,3),(3,27,1),(4,28,3),(3,29,0),(3,30,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,31,0),(3,32,2),(4,33,2),(3,34,2),(4,35,1),(4,36,4),(3,37,1),(4,38,2),(4,39,1),(4,40,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,41,2),(3,42,1),(3,43,1),(3,44,2),(3,45,2),(4,46,2),(3,47,0),(4,48,3),(4,49,3),(3,50,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,51,2),(4,52,0),(4,53,3),(4,54,1),(3,55,4),(4,56,3),(3,57,2),(4,58,4),(4,59,3),(3,60,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,61,3),(3,62,0),(3,63,3),(3,64,0),(3,65,3),(3,66,1),(4,67,2),(3,68,4),(3,69,1),(4,70,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,71,2),(4,72,3),(3,73,1),(4,74,2),(3,75,0),(4,76,3),(3,77,4),(4,78,1),(3,79,1),(3,80,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,81,2),(3,82,1),(4,83,4),(3,84,4),(3,85,3),(3,86,2),(3,87,3),(4,88,0),(4,89,0),(3,90,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,91,4),(4,92,3),(4,93,3),(3,94,1),(3,95,2),(3,96,4),(3,97,0),(3,98,3),(4,99,0),(3,100,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,101,3),(3,102,0),(3,103,1),(3,104,3),(3,105,4),(3,106,1),(3,107,1),(4,108,3),(3,109,0),(4,110,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,111,2),(4,112,3),(3,113,2),(4,114,1),(4,115,4),(3,116,0),(4,117,4),(4,118,1),(3,119,4),(3,120,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,121,3),(4,122,1),(4,123,1),(3,124,1),(3,125,4),(4,126,4),(4,127,0),(3,128,3),(4,129,2),(3,130,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,131,0),(4,132,2),(4,133,3),(3,134,3),(3,135,4),(3,136,0),(3,137,4),(3,138,0),(4,139,3),(4,140,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,141,0),(3,142,2),(4,143,3),(4,144,4),(4,145,2),(4,146,3),(4,147,3),(3,148,0),(3,149,4),(4,150,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,151,0),(3,152,2),(3,153,0),(4,154,3),(4,155,2),(4,156,2),(3,157,1),(4,158,2),(4,159,1),(3,160,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,161,4),(4,162,4),(4,163,2),(4,164,4),(3,165,1),(4,166,0),(3,167,4),(3,168,2),(3,169,2),(3,170,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,171,3),(4,172,4),(3,173,3),(4,174,3),(4,175,1),(3,176,3),(4,177,4),(3,178,3),(3,179,1),(4,180,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,181,4),(3,182,0),(4,183,4),(4,184,3),(3,185,3),(3,186,3),(4,187,2),(4,188,0),(4,189,3),(4,190,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,191,0),(3,192,1),(4,193,0),(4,194,0),(4,195,1),(3,196,1),(3,197,1),(3,198,0),(4,199,2),(4,200,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,201,4),(4,202,2),(4,203,0),(3,204,4),(3,205,2),(3,206,4),(4,207,2),(3,208,2),(3,209,3),(4,210,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,211,3),(4,212,0),(3,213,1),(4,214,1),(4,215,1),(4,216,3),(4,217,1),(4,218,1),(4,219,0),(3,220,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,221,4),(4,222,1),(4,223,3),(3,224,0),(4,225,2),(3,226,1),(3,227,2),(4,228,1),(4,229,1),(3,230,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,231,4),(3,232,1),(3,233,4),(4,234,2),(3,235,3),(4,236,1),(4,237,3),(3,238,1),(4,239,0),(3,240,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,241,4),(3,242,0),(3,243,4),(4,244,3),(3,245,4),(3,246,3),(3,247,3),(4,248,1),(3,249,4),(3,250,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,251,1),(4,252,2),(4,253,1),(4,254,1),(4,255,4),(4,256,1),(3,257,1),(4,258,3),(3,259,0),(3,260,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,261,3),(3,262,4),(4,263,4),(4,264,2),(4,265,2),(3,266,0),(4,267,2),(4,268,2),(4,269,0),(3,270,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,271,2),(4,272,0),(3,273,1),(4,274,1),(4,275,3),(4,276,1),(3,277,2),(4,278,4),(4,279,4),(3,280,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,281,0),(3,282,2),(3,283,2),(3,284,4),(3,285,1),(4,286,3),(4,287,0),(3,288,2),(3,289,2),(3,290,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,291,0),(4,292,4),(4,293,0),(3,294,4),(4,295,3),(3,296,1),(3,297,1),(3,298,4),(3,299,2),(4,300,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,301,1),(4,302,2),(3,303,2),(3,304,3),(3,305,4),(3,306,1),(4,307,0),(4,308,0),(3,309,1),(3,310,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,311,1),(4,312,1),(4,313,1),(3,314,1),(4,315,1),(4,316,3),(3,317,1),(3,318,3),(4,319,4),(3,320,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,321,4),(3,322,1),(3,323,0),(4,324,3),(3,325,4),(4,326,4),(3,327,1),(3,328,1),(3,329,0),(3,330,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,331,3),(3,332,3),(3,333,1),(3,334,2),(4,335,3),(4,336,1),(3,337,4),(3,338,1),(4,339,3),(4,340,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,341,0),(3,342,1),(3,343,1),(4,344,4),(3,345,0),(4,346,4),(3,347,2),(4,348,1),(3,349,2),(3,350,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,351,2),(3,352,4),(3,353,1),(3,354,0),(4,355,3),(4,356,3),(4,357,4),(4,358,2),(4,359,0),(4,360,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,361,0),(4,362,1),(4,363,0),(4,364,3),(3,365,4),(4,366,3),(4,367,0),(4,368,4),(4,369,0),(3,370,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,371,2),(3,372,1),(4,373,3),(3,374,1),(4,375,1),(4,376,1),(4,377,3),(3,378,1),(3,379,4),(3,380,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,381,2),(4,382,2),(3,383,2),(4,384,2),(4,385,2),(4,386,3),(4,387,1),(4,388,1),(4,389,1),(3,390,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,391,4),(3,392,4),(3,393,3),(3,394,1),(3,395,4),(3,396,0),(4,397,4),(3,398,3),(3,399,1),(3,400,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,401,0),(4,402,2),(4,403,4),(4,404,0),(4,405,2),(4,406,1),(4,407,3),(4,408,4),(3,409,4),(4,410,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,411,2),(3,412,1),(4,413,0),(4,414,1),(3,415,2),(3,416,0),(4,417,2),(3,418,2),(3,419,4),(4,420,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,421,0),(4,422,4),(4,423,1),(4,424,3),(3,425,2),(3,426,1),(4,427,1),(3,428,0),(3,429,1),(3,430,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,431,3),(3,432,1),(4,433,1),(3,434,1),(3,435,4),(4,436,2),(4,437,1),(3,438,4),(4,439,2),(4,440,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,441,1),(3,442,1),(3,443,0),(3,444,1),(3,445,4),(4,446,1),(4,447,4),(4,448,4),(3,449,1),(3,450,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,451,0),(4,452,0),(4,453,3),(3,454,1),(4,455,0),(4,456,2),(3,457,4),(4,458,1),(3,459,1),(4,460,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,461,2),(4,462,1),(3,463,4),(4,464,3),(3,465,3),(3,466,3),(3,467,0),(4,468,2),(4,469,4),(3,470,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,471,2),(4,472,1),(4,473,1),(3,474,1),(4,475,0),(4,476,4),(3,477,2),(4,478,2),(3,479,1),(4,480,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,481,0),(3,482,4),(3,483,1),(4,484,4),(4,485,2),(4,486,0),(4,487,2),(4,488,4),(4,489,0),(4,490,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,491,1),(3,492,0),(3,493,4),(3,494,4),(3,495,2),(3,496,4),(3,497,3),(3,498,0),(4,499,3),(3,500,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,501,0),(3,502,1),(4,503,3),(4,504,1),(4,505,0),(3,506,0),(4,507,2),(3,508,0),(3,509,4),(4,510,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,511,3),(4,512,0),(3,513,4),(4,514,0),(3,515,3),(4,516,3),(3,517,3),(3,518,2),(4,519,4),(4,520,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,521,4),(3,522,3),(4,523,4),(4,524,2),(4,525,3),(4,526,3),(3,527,3),(4,528,2),(4,529,0),(3,530,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,531,3),(3,532,3),(3,533,3),(3,534,3),(4,535,0),(3,536,3),(4,537,1),(4,538,3),(3,539,3),(4,540,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,541,1),(3,542,2),(3,543,2),(3,544,3),(4,545,2),(3,546,2),(4,547,3),(3,548,4),(3,549,0),(3,550,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,551,3),(3,552,1),(4,553,4),(4,554,4),(4,555,4),(3,556,1),(3,557,1),(4,558,4),(3,559,2),(3,560,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,561,4),(4,562,4),(4,563,4),(4,564,4),(4,565,2),(4,566,2),(4,567,4),(4,568,4),(4,569,4),(3,570,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,571,3),(4,572,0),(3,573,3),(3,574,4),(4,575,4),(3,576,3),(4,577,4),(3,578,0),(4,579,4),(4,580,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,581,1),(3,582,3),(4,583,2),(3,584,3),(3,585,2),(4,586,1),(4,587,2),(3,588,4),(3,589,2),(3,590,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,591,2),(3,592,4),(3,593,4),(4,594,1),(3,595,4),(4,596,4),(4,597,0),(4,598,1),(4,599,1),(3,600,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,601,1),(4,602,2),(4,603,2),(3,604,3),(3,605,2),(4,606,4),(4,607,2),(4,608,2),(4,609,3),(3,610,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,611,2),(4,612,0),(4,613,2),(4,614,0),(3,615,4),(4,616,4),(3,617,2),(3,618,2),(4,619,4),(3,620,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,621,4),(3,622,3),(3,623,2),(4,624,1),(4,625,4),(3,626,1),(4,627,0),(3,628,0),(3,629,0),(3,630,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,631,4),(3,632,0),(4,633,0),(3,634,3),(3,635,4),(4,636,2),(3,637,4),(4,638,3),(3,639,0),(4,640,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,641,2),(3,642,0),(4,643,2),(4,644,3),(3,645,1),(4,646,2),(4,647,4),(3,648,4),(4,649,4),(3,650,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,651,4),(4,652,1),(3,653,4),(3,654,1),(3,655,0),(4,656,2),(3,657,1),(4,658,0),(3,659,0),(3,660,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,661,2),(3,662,2),(3,663,4),(4,664,0),(3,665,1),(4,666,0),(3,667,3),(4,668,3),(4,669,2),(4,670,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,671,0),(3,672,4),(3,673,1),(3,674,3),(3,675,3),(3,676,1),(3,677,2),(3,678,0),(3,679,4),(4,680,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,681,1),(4,682,1),(4,683,4),(4,684,4),(4,685,1),(3,686,0),(4,687,2),(4,688,4),(4,689,1),(3,690,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,691,2),(4,692,2),(3,693,2),(3,694,3),(4,695,2),(4,696,1),(3,697,3),(3,698,3),(3,699,0),(3,700,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,701,3),(4,702,4),(4,703,2),(3,704,1),(4,705,2),(4,706,4),(3,707,4),(3,708,0),(3,709,1),(3,710,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,711,4),(3,712,0),(3,713,1),(3,714,0),(3,715,3),(4,716,3),(3,717,3),(4,718,3),(4,719,1),(4,720,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,721,2),(3,722,3),(3,723,4),(3,724,0),(3,725,2),(3,726,0),(3,727,4),(4,728,0),(3,729,1),(3,730,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,731,3),(4,732,2),(3,733,2),(3,734,0),(4,735,3),(4,736,0),(4,737,3),(3,738,1),(3,739,3),(4,740,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,741,1),(3,742,1),(3,743,0),(3,744,1),(3,745,0),(4,746,0),(4,747,1),(4,748,2),(3,749,2),(4,750,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,751,3),(3,752,3),(3,753,2),(4,754,1),(4,755,2),(3,756,4),(3,757,3),(3,758,4),(4,759,2),(4,760,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,761,4),(3,762,1),(4,763,2),(3,764,0),(4,765,2),(3,766,1),(4,767,3),(4,768,3),(3,769,3),(3,770,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,771,1),(4,772,3),(4,773,3),(4,774,4),(4,775,0),(3,776,2),(3,777,2),(4,778,4),(3,779,0),(3,780,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,781,2),(3,782,2),(4,783,2),(3,784,2),(4,785,1),(4,786,1),(4,787,2),(3,788,4),(3,789,4),(4,790,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,791,0),(4,792,4),(3,793,3),(4,794,4),(4,795,1),(3,796,0),(3,797,2),(3,798,0),(3,799,4),(3,800,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,801,4),(4,802,3),(3,803,2),(4,804,4),(3,805,4),(3,806,3),(3,807,1),(3,808,1),(3,809,2),(3,810,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,811,0),(4,812,2),(3,813,1),(4,814,0),(4,815,3),(4,816,4),(3,817,3),(3,818,3),(4,819,4),(4,820,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,821,4),(3,822,1),(3,823,0),(4,824,1),(4,825,1),(4,826,4),(4,827,3),(3,828,3),(3,829,0),(3,830,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,831,3),(3,832,2),(4,833,1),(3,834,3),(3,835,1),(4,836,1),(3,837,2),(3,838,2),(4,839,4),(3,840,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,841,4),(4,842,0),(4,843,3),(4,844,4),(3,845,4),(4,846,4),(4,847,3),(4,848,1),(4,849,0),(4,850,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,851,0),(4,852,3),(4,853,1),(4,854,4),(4,855,4),(4,856,2),(4,857,4),(3,858,1),(4,859,2),(4,860,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,861,4),(3,862,4),(4,863,2),(4,864,1),(3,865,4),(4,866,3),(3,867,0),(4,868,4),(3,869,1),(3,870,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,871,0),(4,872,1),(3,873,2),(4,874,2),(4,875,0),(3,876,3),(3,877,1),(3,878,1),(3,879,4),(4,880,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,881,4),(4,882,0),(3,883,3),(4,884,4),(3,885,2),(4,886,1),(3,887,1),(3,888,0),(4,889,3),(4,890,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,891,0),(3,892,0),(3,893,2),(3,894,2),(3,895,0),(3,896,2),(3,897,2),(4,898,1),(4,899,2),(4,900,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,901,4),(3,902,4),(3,903,0),(4,904,1),(4,905,1),(3,906,1),(4,907,1),(3,908,0),(3,909,1),(3,910,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,911,3),(3,912,4),(3,913,4),(3,914,3),(4,915,3),(4,916,0),(3,917,4),(3,918,2),(4,919,4),(4,920,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,921,4),(4,922,0),(3,923,1),(4,924,2),(3,925,0),(3,926,0),(4,927,0),(4,928,1),(4,929,2),(3,930,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,931,0),(3,932,4),(4,933,2),(4,934,2),(3,935,0),(4,936,4),(4,937,2),(3,938,1),(3,939,2),(4,940,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,941,3),(4,942,4),(4,943,0),(3,944,1),(3,945,2),(4,946,2),(4,947,3),(4,948,3),(4,949,2),(4,950,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,951,3),(3,952,2),(3,953,4),(4,954,4),(4,955,2),(3,956,0),(4,957,0),(4,958,3),(4,959,1),(4,960,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,961,1),(3,962,4),(3,963,4),(4,964,1),(4,965,3),(4,966,3),(4,967,3),(4,968,1),(4,969,3),(4,970,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (3,971,1),(4,972,0),(4,973,3),(3,974,1),(3,975,3),(4,976,3),(4,977,3),(4,978,1),(4,979,1),(3,980,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,981,2),(4,982,3),(3,983,2),(4,984,4),(4,985,0),(4,986,2),(3,987,0),(3,988,0),(4,989,0),(4,990,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (4,991,1),(4,992,0),(4,993,3),(4,994,4),(4,995,2),(4,996,4),(3,997,2),(3,998,3),(3,999,3),(3,1000,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,1,4),(6,2,4),(6,3,0),(5,4,2),(5,5,1),(6,6,1),(5,7,4),(5,8,1),(5,9,1),(5,10,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,11,3),(6,12,3),(5,13,2),(5,14,2),(6,15,3),(5,16,0),(6,17,4),(6,18,2),(5,19,0),(5,20,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,21,4),(5,22,0),(5,23,1),(5,24,3),(6,25,1),(5,26,0),(6,27,4),(5,28,2),(6,29,3),(5,30,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,31,2),(6,32,0),(6,33,1),(5,34,0),(5,35,1),(6,36,0),(5,37,0),(6,38,2),(5,39,3),(6,40,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,41,0),(5,42,0),(6,43,4),(5,44,2),(5,45,2),(5,46,4),(5,47,0),(5,48,3),(6,49,4),(5,50,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,51,2),(6,52,0),(6,53,0),(6,54,4),(6,55,0),(6,56,0),(5,57,2),(6,58,2),(6,59,4),(5,60,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,61,1),(6,62,2),(6,63,4),(5,64,0),(5,65,3),(6,66,3),(6,67,3),(6,68,0),(6,69,4),(6,70,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,71,0),(5,72,0),(5,73,1),(5,74,2),(5,75,1),(6,76,3),(6,77,0),(6,78,4),(5,79,3),(5,80,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,81,4),(5,82,2),(6,83,4),(6,84,4),(6,85,1),(6,86,0),(6,87,4),(5,88,3),(6,89,4),(5,90,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,91,4),(6,92,2),(5,93,2),(6,94,4),(5,95,4),(5,96,4),(5,97,1),(5,98,1),(6,99,4),(6,100,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,101,0),(6,102,2),(5,103,0),(6,104,0),(5,105,0),(6,106,3),(6,107,2),(6,108,0),(6,109,2),(6,110,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,111,2),(6,112,4),(5,113,3),(5,114,4),(5,115,1),(6,116,1),(6,117,3),(6,118,3),(6,119,2),(5,120,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,121,3),(6,122,3),(6,123,1),(6,124,4),(6,125,1),(6,126,3),(5,127,1),(6,128,2),(6,129,1),(5,130,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,131,2),(6,132,0),(5,133,0),(6,134,3),(6,135,3),(6,136,4),(5,137,0),(5,138,1),(5,139,2),(5,140,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,141,4),(6,142,2),(5,143,2),(6,144,4),(6,145,3),(5,146,0),(5,147,0),(6,148,0),(5,149,2),(6,150,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,151,2),(6,152,3),(6,153,1),(6,154,4),(5,155,4),(6,156,3),(5,157,3),(6,158,3),(5,159,3),(5,160,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,161,4),(6,162,1),(5,163,0),(5,164,3),(5,165,3),(6,166,4),(6,167,0),(6,168,2),(5,169,3),(6,170,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,171,3),(5,172,0),(5,173,3),(5,174,2),(6,175,1),(5,176,1),(5,177,2),(5,178,0),(6,179,1),(6,180,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,181,3),(6,182,3),(5,183,0),(6,184,4),(5,185,1),(5,186,4),(5,187,1),(6,188,1),(5,189,2),(6,190,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,191,1),(6,192,4),(5,193,4),(6,194,2),(6,195,0),(6,196,2),(6,197,2),(6,198,4),(6,199,1),(5,200,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,201,2),(6,202,2),(6,203,2),(6,204,3),(6,205,0),(6,206,2),(6,207,4),(6,208,0),(5,209,1),(5,210,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,211,4),(6,212,0),(5,213,1),(6,214,2),(6,215,2),(6,216,1),(6,217,2),(5,218,3),(5,219,0),(6,220,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,221,3),(5,222,2),(5,223,3),(6,224,0),(6,225,4),(6,226,4),(6,227,0),(5,228,1),(5,229,2),(5,230,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,231,2),(6,232,1),(6,233,1),(6,234,2),(6,235,4),(5,236,2),(5,237,0),(6,238,2),(6,239,0),(6,240,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,241,1),(5,242,2),(5,243,2),(6,244,4),(5,245,0),(6,246,2),(5,247,4),(5,248,4),(5,249,4),(6,250,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,251,3),(5,252,2),(5,253,4),(6,254,1),(6,255,1),(5,256,2),(6,257,2),(6,258,3),(6,259,1),(5,260,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,261,1),(5,262,3),(5,263,1),(6,264,2),(6,265,3),(5,266,1),(5,267,1),(6,268,4),(5,269,0),(6,270,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,271,4),(5,272,3),(5,273,0),(6,274,2),(5,275,1),(5,276,0),(5,277,1),(5,278,2),(5,279,3),(5,280,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,281,2),(5,282,4),(6,283,3),(5,284,2),(6,285,4),(5,286,3),(5,287,3),(6,288,1),(6,289,0),(5,290,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,291,2),(5,292,1),(6,293,3),(6,294,4),(6,295,1),(6,296,2),(5,297,2),(5,298,3),(5,299,1),(5,300,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,301,4),(5,302,2),(6,303,4),(5,304,3),(6,305,3),(5,306,3),(5,307,2),(6,308,4),(5,309,4),(6,310,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,311,1),(5,312,0),(6,313,2),(6,314,0),(5,315,2),(5,316,2),(5,317,2),(5,318,4),(6,319,4),(6,320,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,321,0),(5,322,3),(6,323,2),(5,324,3),(5,325,0),(6,326,3),(5,327,0),(6,328,0),(5,329,3),(5,330,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,331,3),(6,332,4),(5,333,3),(5,334,2),(6,335,2),(5,336,2),(6,337,1),(5,338,2),(6,339,1),(6,340,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,341,1),(5,342,2),(6,343,3),(6,344,3),(5,345,3),(6,346,1),(5,347,4),(6,348,0),(6,349,0),(5,350,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,351,0),(5,352,3),(6,353,4),(5,354,2),(6,355,4),(6,356,3),(6,357,2),(5,358,4),(6,359,0),(6,360,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,361,3),(5,362,1),(6,363,4),(6,364,0),(5,365,0),(5,366,2),(6,367,3),(5,368,3),(5,369,1),(6,370,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,371,3),(6,372,4),(5,373,4),(6,374,0),(6,375,2),(5,376,0),(5,377,1),(5,378,1),(5,379,4),(5,380,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,381,0),(6,382,4),(5,383,0),(6,384,4),(6,385,0),(6,386,4),(6,387,2),(6,388,3),(5,389,3),(5,390,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,391,4),(5,392,3),(5,393,4),(6,394,0),(6,395,0),(5,396,1),(5,397,4),(5,398,1),(5,399,3),(6,400,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,401,4),(6,402,1),(5,403,1),(5,404,1),(6,405,4),(5,406,1),(6,407,2),(6,408,3),(5,409,0),(5,410,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,411,1),(6,412,1),(5,413,2),(6,414,2),(6,415,0),(6,416,3),(6,417,3),(5,418,2),(5,419,1),(5,420,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,421,2),(6,422,2),(6,423,4),(6,424,1),(5,425,2),(6,426,1),(5,427,0),(5,428,1),(6,429,2),(5,430,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,431,3),(6,432,1),(6,433,1),(5,434,1),(5,435,3),(6,436,3),(6,437,0),(6,438,4),(5,439,2),(6,440,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,441,0),(5,442,0),(5,443,2),(5,444,2),(6,445,2),(5,446,2),(6,447,3),(5,448,3),(6,449,3),(6,450,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,451,0),(5,452,2),(6,453,1),(6,454,0),(5,455,4),(6,456,0),(6,457,0),(5,458,4),(5,459,4),(5,460,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,461,2),(6,462,0),(5,463,3),(5,464,1),(6,465,3),(5,466,2),(6,467,3),(6,468,1),(6,469,1),(5,470,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,471,0),(5,472,1),(5,473,3),(5,474,2),(6,475,2),(6,476,3),(5,477,3),(5,478,3),(6,479,2),(5,480,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,481,4),(6,482,2),(5,483,3),(5,484,1),(5,485,0),(5,486,2),(6,487,4),(5,488,3),(5,489,4),(6,490,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,491,0),(5,492,4),(6,493,3),(5,494,4),(6,495,2),(6,496,1),(6,497,1),(5,498,1),(5,499,4),(5,500,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,501,3),(5,502,3),(5,503,2),(5,504,1),(5,505,4),(5,506,1),(5,507,4),(6,508,3),(5,509,0),(6,510,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,511,3),(5,512,0),(5,513,3),(5,514,4),(6,515,1),(6,516,3),(5,517,3),(6,518,0),(5,519,3),(5,520,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,521,3),(5,522,3),(5,523,4),(5,524,0),(5,525,3),(5,526,1),(5,527,1),(6,528,2),(6,529,0),(6,530,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,531,2),(6,532,0),(5,533,0),(6,534,1),(6,535,4),(6,536,3),(6,537,1),(5,538,0),(5,539,0),(6,540,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,541,1),(5,542,2),(6,543,3),(6,544,4),(6,545,2),(5,546,2),(5,547,3),(6,548,3),(5,549,1),(5,550,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,551,0),(5,552,1),(5,553,1),(5,554,0),(6,555,2),(5,556,1),(6,557,2),(5,558,1),(6,559,3),(6,560,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,561,3),(6,562,4),(6,563,1),(6,564,2),(5,565,4),(5,566,0),(5,567,0),(5,568,1),(6,569,4),(5,570,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,571,2),(6,572,4),(5,573,1),(5,574,4),(6,575,3),(5,576,1),(6,577,0),(5,578,4),(5,579,4),(5,580,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,581,3),(5,582,2),(6,583,4),(6,584,3),(6,585,3),(6,586,2),(5,587,0),(5,588,2),(5,589,3),(5,590,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,591,2),(6,592,2),(5,593,4),(6,594,4),(6,595,1),(5,596,1),(5,597,3),(6,598,0),(6,599,1),(5,600,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,601,3),(6,602,2),(5,603,0),(5,604,2),(5,605,0),(6,606,0),(5,607,2),(6,608,4),(5,609,1),(6,610,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,611,3),(6,612,3),(6,613,1),(5,614,3),(5,615,0),(6,616,0),(6,617,1),(5,618,2),(6,619,4),(5,620,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,621,3),(6,622,3),(5,623,0),(6,624,1),(6,625,2),(5,626,1),(6,627,3),(5,628,0),(6,629,0),(5,630,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,631,0),(6,632,3),(6,633,0),(6,634,0),(6,635,2),(5,636,0),(6,637,0),(6,638,2),(5,639,2),(5,640,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,641,0),(5,642,2),(6,643,4),(6,644,0),(5,645,0),(6,646,1),(5,647,4),(5,648,1),(6,649,1),(5,650,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,651,1),(6,652,4),(5,653,2),(6,654,1),(5,655,4),(6,656,3),(6,657,1),(5,658,2),(6,659,3),(6,660,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,661,4),(6,662,4),(5,663,3),(6,664,3),(5,665,3),(6,666,1),(5,667,0),(5,668,1),(6,669,4),(5,670,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,671,0),(5,672,1),(6,673,3),(6,674,2),(6,675,2),(6,676,1),(5,677,3),(6,678,2),(5,679,0),(6,680,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,681,3),(6,682,4),(5,683,3),(6,684,1),(6,685,3),(6,686,4),(6,687,3),(6,688,0),(5,689,0),(6,690,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,691,2),(6,692,2),(5,693,0),(6,694,1),(5,695,4),(6,696,1),(5,697,2),(5,698,4),(6,699,4),(6,700,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,701,1),(6,702,4),(5,703,0),(5,704,1),(6,705,4),(5,706,1),(5,707,1),(6,708,2),(6,709,2),(5,710,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,711,0),(5,712,3),(5,713,4),(5,714,3),(5,715,0),(6,716,1),(5,717,3),(6,718,2),(6,719,2),(6,720,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,721,0),(5,722,0),(6,723,4),(6,724,4),(5,725,3),(5,726,1),(5,727,1),(5,728,4),(6,729,4),(5,730,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,731,0),(6,732,3),(6,733,3),(6,734,2),(6,735,4),(5,736,3),(5,737,3),(5,738,3),(5,739,0),(6,740,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,741,0),(5,742,1),(6,743,4),(6,744,4),(5,745,4),(6,746,1),(5,747,4),(6,748,3),(5,749,1),(6,750,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,751,1),(5,752,0),(6,753,4),(5,754,1),(6,755,4),(5,756,4),(6,757,1),(5,758,0),(6,759,4),(6,760,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,761,4),(6,762,2),(5,763,4),(6,764,3),(6,765,2),(6,766,2),(6,767,0),(6,768,1),(5,769,2),(6,770,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,771,1),(5,772,4),(5,773,2),(6,774,3),(6,775,1),(5,776,2),(5,777,4),(5,778,0),(5,779,2),(6,780,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,781,1),(6,782,1),(5,783,3),(6,784,4),(5,785,1),(5,786,3),(5,787,4),(5,788,3),(5,789,0),(5,790,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,791,1),(6,792,0),(6,793,2),(5,794,4),(5,795,0),(5,796,3),(6,797,4),(5,798,4),(6,799,3),(5,800,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,801,3),(6,802,4),(5,803,0),(5,804,3),(5,805,1),(6,806,0),(5,807,3),(5,808,2),(6,809,4),(5,810,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,811,4),(5,812,0),(5,813,2),(6,814,2),(5,815,0),(5,816,0),(6,817,2),(6,818,0),(5,819,0),(5,820,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,821,3),(5,822,3),(5,823,4),(6,824,2),(6,825,1),(5,826,0),(6,827,4),(5,828,0),(5,829,3),(6,830,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,831,2),(6,832,4),(5,833,3),(5,834,2),(5,835,1),(6,836,3),(6,837,4),(6,838,1),(5,839,4),(5,840,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,841,2),(5,842,0),(6,843,4),(6,844,0),(6,845,4),(5,846,4),(6,847,0),(6,848,0),(5,849,3),(6,850,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,851,3),(5,852,2),(6,853,4),(5,854,0),(5,855,2),(6,856,2),(6,857,4),(5,858,3),(5,859,4),(6,860,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,861,0),(5,862,0),(6,863,2),(5,864,2),(5,865,1),(6,866,1),(6,867,0),(6,868,3),(5,869,3),(5,870,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,871,3),(6,872,0),(5,873,1),(6,874,3),(5,875,1),(6,876,3),(6,877,3),(6,878,3),(5,879,3),(6,880,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,881,0),(6,882,1),(5,883,3),(6,884,0),(5,885,2),(5,886,2),(5,887,1),(6,888,4),(6,889,4),(6,890,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,891,4),(5,892,2),(6,893,0),(6,894,1),(6,895,0),(6,896,3),(5,897,2),(6,898,1),(5,899,2),(6,900,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,901,0),(6,902,3),(5,903,0),(5,904,1),(6,905,3),(6,906,0),(5,907,0),(5,908,2),(6,909,2),(6,910,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,911,2),(5,912,3),(6,913,0),(5,914,0),(5,915,1),(6,916,1),(5,917,0),(5,918,2),(6,919,0),(6,920,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,921,3),(5,922,0),(6,923,3),(6,924,1),(5,925,1),(5,926,0),(5,927,4),(6,928,3),(6,929,4),(5,930,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,931,3),(6,932,2),(6,933,1),(6,934,4),(5,935,0),(6,936,0),(6,937,0),(6,938,3),(5,939,0),(6,940,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,941,1),(5,942,3),(6,943,0),(6,944,4),(6,945,2),(6,946,3),(6,947,3),(6,948,3),(5,949,2),(5,950,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,951,0),(6,952,4),(5,953,1),(5,954,4),(6,955,1),(6,956,4),(6,957,1),(5,958,1),(6,959,3),(5,960,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,961,3),(6,962,3),(5,963,2),(5,964,0),(6,965,0),(5,966,3),(5,967,0),(5,968,2),(6,969,0),(6,970,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (6,971,0),(5,972,3),(5,973,3),(5,974,1),(6,975,4),(5,976,2),(6,977,0),(6,978,2),(6,979,3),(5,980,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,981,3),(5,982,4),(6,983,1),(5,984,4),(6,985,1),(5,986,1),(6,987,1),(6,988,2),(5,989,2),(5,990,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (5,991,1),(6,992,3),(5,993,4),(6,994,1),(6,995,0),(6,996,4),(6,997,4),(5,998,3),(5,999,0),(6,1000,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,1,1),(7,2,0),(8,3,1),(8,4,1),(7,5,3),(8,6,3),(7,7,4),(7,8,2),(8,9,0),(8,10,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,11,4),(8,12,2),(8,13,2),(7,14,3),(7,15,1),(8,16,0),(7,17,3),(7,18,2),(8,19,0),(7,20,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,21,1),(8,22,2),(7,23,3),(8,24,3),(7,25,2),(7,26,3),(7,27,1),(8,28,2),(7,29,1),(7,30,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,31,3),(7,32,0),(7,33,1),(8,34,1),(8,35,0),(8,36,2),(8,37,0),(8,38,4),(8,39,0),(7,40,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,41,1),(7,42,4),(7,43,1),(7,44,1),(8,45,4),(8,46,3),(8,47,3),(7,48,3),(8,49,3),(7,50,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,51,1),(7,52,1),(7,53,1),(7,54,4),(7,55,3),(7,56,2),(8,57,2),(7,58,1),(7,59,0),(8,60,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,61,3),(7,62,2),(7,63,3),(7,64,4),(7,65,4),(8,66,3),(8,67,0),(8,68,1),(7,69,0),(7,70,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,71,3),(7,72,0),(7,73,3),(8,74,4),(7,75,4),(7,76,0),(7,77,1),(7,78,3),(8,79,4),(8,80,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,81,3),(7,82,0),(7,83,1),(7,84,3),(7,85,2),(8,86,0),(8,87,4),(7,88,1),(8,89,1),(7,90,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,91,1),(8,92,0),(8,93,1),(8,94,2),(7,95,2),(7,96,2),(7,97,4),(8,98,2),(8,99,0),(8,100,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,101,0),(7,102,3),(8,103,3),(7,104,3),(8,105,0),(8,106,4),(7,107,2),(7,108,3),(7,109,1),(7,110,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,111,3),(8,112,1),(8,113,4),(8,114,2),(8,115,4),(8,116,1),(8,117,3),(7,118,1),(7,119,4),(8,120,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,121,2),(8,122,2),(8,123,2),(8,124,2),(8,125,3),(7,126,3),(7,127,1),(8,128,1),(8,129,2),(8,130,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,131,0),(7,132,4),(7,133,4),(7,134,2),(7,135,4),(8,136,0),(8,137,0),(8,138,1),(7,139,4),(8,140,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,141,3),(7,142,1),(8,143,0),(7,144,3),(7,145,2),(7,146,1),(7,147,4),(8,148,3),(7,149,4),(7,150,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,151,2),(8,152,4),(7,153,3),(7,154,4),(8,155,4),(7,156,4),(7,157,3),(7,158,0),(7,159,4),(8,160,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,161,1),(7,162,3),(8,163,4),(8,164,1),(8,165,0),(7,166,1),(8,167,0),(7,168,3),(7,169,3),(8,170,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,171,4),(7,172,0),(8,173,4),(7,174,3),(7,175,1),(8,176,0),(7,177,1),(7,178,2),(8,179,1),(8,180,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,181,0),(8,182,3),(8,183,2),(8,184,4),(7,185,0),(7,186,0),(8,187,2),(7,188,2),(8,189,3),(8,190,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,191,1),(8,192,0),(7,193,4),(7,194,1),(7,195,0),(8,196,2),(8,197,4),(7,198,0),(8,199,3),(7,200,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,201,2),(7,202,1),(8,203,4),(8,204,4),(8,205,0),(8,206,2),(8,207,0),(8,208,0),(8,209,1),(7,210,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,211,0),(8,212,4),(8,213,0),(8,214,4),(8,215,0),(7,216,4),(7,217,3),(7,218,1),(8,219,2),(8,220,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,221,0),(8,222,3),(7,223,3),(7,224,3),(8,225,3),(7,226,1),(7,227,0),(7,228,4),(7,229,3),(8,230,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,231,1),(8,232,2),(7,233,1),(7,234,4),(8,235,4),(8,236,4),(7,237,2),(8,238,3),(8,239,1),(8,240,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,241,0),(8,242,3),(8,243,4),(7,244,1),(8,245,3),(8,246,2),(7,247,2),(7,248,1),(8,249,4),(8,250,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,251,1),(7,252,1),(7,253,0),(7,254,2),(7,255,2),(7,256,1),(8,257,2),(8,258,4),(8,259,3),(8,260,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,261,2),(8,262,3),(7,263,4),(7,264,4),(8,265,3),(7,266,1),(8,267,4),(7,268,4),(7,269,0),(7,270,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,271,2),(7,272,3),(8,273,3),(8,274,2),(7,275,2),(7,276,4),(8,277,2),(8,278,2),(8,279,2),(8,280,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,281,4),(8,282,1),(8,283,1),(7,284,4),(8,285,0),(8,286,4),(7,287,1),(7,288,0),(7,289,3),(8,290,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,291,2),(7,292,4),(7,293,0),(8,294,2),(8,295,1),(7,296,4),(7,297,1),(7,298,3),(8,299,2),(7,300,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,301,4),(8,302,2),(8,303,3),(7,304,3),(7,305,1),(8,306,2),(8,307,2),(7,308,3),(8,309,1),(8,310,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,311,2),(7,312,2),(7,313,1),(8,314,2),(7,315,1),(7,316,0),(8,317,1),(8,318,0),(7,319,0),(7,320,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,321,1),(8,322,4),(8,323,3),(8,324,0),(7,325,4),(8,326,3),(7,327,4),(7,328,2),(8,329,0),(7,330,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,331,2),(7,332,2),(7,333,4),(8,334,3),(7,335,3),(8,336,4),(8,337,4),(8,338,3),(7,339,1),(7,340,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,341,3),(8,342,0),(8,343,0),(7,344,1),(7,345,4),(8,346,3),(8,347,2),(8,348,2),(7,349,4),(8,350,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,351,1),(7,352,3),(8,353,4),(7,354,4),(7,355,3),(7,356,3),(8,357,3),(8,358,0),(7,359,1),(7,360,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,361,2),(8,362,4),(8,363,1),(8,364,3),(7,365,0),(7,366,1),(8,367,2),(8,368,1),(8,369,2),(8,370,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,371,0),(7,372,0),(8,373,3),(8,374,3),(7,375,4),(7,376,2),(8,377,4),(7,378,3),(8,379,0),(8,380,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,381,1),(8,382,0),(8,383,3),(7,384,0),(8,385,4),(7,386,3),(7,387,3),(7,388,1),(7,389,3),(7,390,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,391,3),(7,392,3),(7,393,4),(7,394,4),(8,395,4),(7,396,0),(8,397,1),(8,398,4),(8,399,0),(7,400,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,401,2),(7,402,2),(8,403,3),(8,404,2),(7,405,2),(7,406,3),(8,407,4),(7,408,0),(8,409,0),(8,410,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,411,4),(7,412,0),(8,413,3),(7,414,0),(8,415,4),(8,416,4),(7,417,3),(8,418,0),(8,419,2),(7,420,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,421,0),(8,422,3),(7,423,0),(7,424,2),(7,425,2),(8,426,0),(7,427,0),(8,428,0),(7,429,0),(7,430,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,431,0),(7,432,0),(8,433,0),(7,434,1),(8,435,0),(8,436,1),(7,437,2),(7,438,1),(7,439,0),(8,440,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,441,2),(7,442,2),(8,443,0),(7,444,4),(8,445,2),(7,446,2),(7,447,2),(8,448,1),(8,449,2),(8,450,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,451,2),(7,452,2),(7,453,1),(7,454,2),(8,455,2),(7,456,3),(8,457,2),(7,458,3),(8,459,0),(7,460,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,461,4),(7,462,4),(8,463,4),(7,464,3),(7,465,1),(8,466,0),(7,467,4),(7,468,3),(8,469,2),(7,470,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,471,0),(7,472,3),(7,473,0),(7,474,4),(7,475,3),(8,476,0),(8,477,1),(7,478,4),(8,479,2),(8,480,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,481,4),(7,482,2),(8,483,1),(7,484,1),(8,485,3),(7,486,4),(7,487,2),(8,488,4),(8,489,4),(8,490,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,491,1),(8,492,2),(7,493,2),(7,494,0),(8,495,2),(8,496,0),(7,497,4),(8,498,4),(8,499,3),(8,500,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,501,3),(7,502,0),(8,503,4),(7,504,2),(7,505,2),(8,506,2),(8,507,1),(7,508,0),(8,509,3),(8,510,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,511,3),(7,512,1),(7,513,3),(7,514,3),(8,515,0),(8,516,3),(7,517,1),(8,518,2),(7,519,0),(7,520,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,521,2),(8,522,0),(8,523,1),(8,524,3),(8,525,4),(7,526,3),(8,527,0),(7,528,2),(8,529,2),(7,530,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,531,3),(7,532,3),(7,533,1),(7,534,3),(8,535,1),(7,536,0),(8,537,1),(7,538,0),(7,539,3),(7,540,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,541,3),(7,542,2),(8,543,4),(7,544,0),(8,545,2),(8,546,3),(7,547,3),(8,548,0),(7,549,3),(8,550,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,551,2),(7,552,0),(7,553,3),(8,554,3),(8,555,3),(7,556,0),(8,557,0),(7,558,4),(8,559,3),(7,560,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,561,0),(8,562,3),(8,563,3),(7,564,2),(8,565,2),(7,566,2),(7,567,2),(8,568,4),(7,569,1),(7,570,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,571,4),(8,572,1),(8,573,1),(8,574,4),(8,575,2),(8,576,4),(8,577,0),(7,578,2),(7,579,4),(8,580,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,581,2),(7,582,0),(7,583,2),(8,584,4),(8,585,2),(8,586,3),(8,587,3),(8,588,1),(7,589,0),(7,590,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,591,1),(7,592,2),(7,593,3),(7,594,3),(8,595,4),(7,596,4),(8,597,0),(8,598,2),(7,599,2),(7,600,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,601,0),(8,602,2),(7,603,3),(8,604,1),(7,605,2),(8,606,0),(8,607,3),(7,608,3),(8,609,2),(8,610,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,611,2),(8,612,2),(7,613,1),(8,614,2),(7,615,1),(7,616,4),(8,617,0),(7,618,3),(8,619,3),(7,620,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,621,1),(7,622,3),(7,623,0),(8,624,3),(8,625,0),(7,626,4),(8,627,3),(8,628,1),(8,629,3),(8,630,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,631,2),(7,632,4),(8,633,1),(7,634,4),(8,635,0),(7,636,4),(7,637,0),(8,638,2),(7,639,0),(8,640,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,641,1),(7,642,0),(7,643,2),(7,644,1),(8,645,0),(7,646,0),(8,647,1),(8,648,2),(7,649,2),(8,650,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,651,0),(7,652,3),(8,653,1),(8,654,1),(7,655,1),(7,656,2),(7,657,3),(8,658,2),(8,659,2),(8,660,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,661,3),(7,662,1),(8,663,2),(8,664,0),(8,665,2),(7,666,3),(7,667,0),(8,668,4),(8,669,3),(8,670,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,671,1),(7,672,1),(7,673,4),(8,674,4),(8,675,4),(8,676,2),(8,677,3),(8,678,3),(8,679,1),(8,680,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,681,1),(8,682,1),(8,683,4),(7,684,4),(7,685,2),(7,686,3),(8,687,4),(7,688,1),(8,689,3),(7,690,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,691,4),(8,692,0),(8,693,0),(8,694,3),(7,695,3),(8,696,3),(8,697,3),(7,698,1),(7,699,3),(8,700,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,701,2),(7,702,4),(7,703,1),(8,704,1),(8,705,0),(8,706,4),(7,707,3),(8,708,0),(7,709,0),(7,710,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,711,0),(7,712,1),(7,713,4),(8,714,1),(8,715,3),(7,716,4),(8,717,2),(7,718,0),(7,719,1),(7,720,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,721,3),(7,722,3),(8,723,2),(8,724,3),(7,725,1),(7,726,0),(7,727,4),(7,728,4),(7,729,2),(8,730,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,731,3),(7,732,3),(7,733,2),(8,734,0),(7,735,1),(8,736,1),(7,737,2),(7,738,3),(7,739,4),(7,740,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,741,2),(7,742,2),(8,743,4),(8,744,3),(8,745,0),(8,746,3),(8,747,2),(7,748,0),(8,749,4),(8,750,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,751,0),(7,752,0),(7,753,1),(8,754,2),(8,755,1),(7,756,1),(7,757,1),(7,758,4),(7,759,2),(8,760,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,761,1),(7,762,4),(8,763,2),(8,764,0),(8,765,4),(7,766,1),(8,767,1),(8,768,4),(7,769,2),(7,770,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,771,3),(7,772,1),(7,773,4),(8,774,4),(8,775,0),(8,776,2),(7,777,2),(8,778,4),(7,779,3),(8,780,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,781,2),(7,782,2),(8,783,2),(8,784,2),(7,785,3),(7,786,4),(8,787,4),(7,788,0),(7,789,2),(7,790,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,791,3),(7,792,1),(8,793,4),(8,794,1),(7,795,2),(7,796,1),(7,797,2),(7,798,4),(8,799,2),(8,800,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,801,2),(7,802,0),(7,803,1),(7,804,3),(8,805,0),(8,806,4),(8,807,1),(7,808,0),(7,809,3),(8,810,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,811,2),(7,812,4),(8,813,2),(8,814,4),(8,815,1),(8,816,1),(7,817,3),(8,818,1),(8,819,0),(7,820,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,821,4),(7,822,2),(8,823,2),(8,824,3),(7,825,1),(8,826,3),(7,827,0),(8,828,2),(7,829,4),(7,830,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,831,4),(8,832,3),(8,833,0),(8,834,1),(8,835,0),(8,836,4),(7,837,2),(7,838,0),(7,839,3),(8,840,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,841,0),(7,842,3),(8,843,3),(8,844,3),(8,845,1),(8,846,0),(7,847,2),(8,848,1),(8,849,1),(8,850,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,851,4),(8,852,1),(8,853,3),(7,854,3),(8,855,0),(7,856,1),(7,857,4),(7,858,4),(7,859,2),(7,860,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,861,4),(8,862,0),(8,863,2),(8,864,1),(7,865,1),(8,866,2),(8,867,0),(7,868,0),(7,869,2),(7,870,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,871,4),(7,872,0),(7,873,3),(7,874,4),(8,875,0),(8,876,2),(8,877,0),(8,878,1),(7,879,2),(8,880,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,881,0),(7,882,3),(8,883,1),(7,884,2),(7,885,3),(8,886,1),(8,887,0),(7,888,0),(7,889,4),(8,890,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,891,3),(7,892,1),(8,893,2),(7,894,0),(7,895,4),(7,896,2),(8,897,2),(7,898,0),(8,899,1),(7,900,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,901,4),(8,902,1),(8,903,0),(8,904,3),(7,905,4),(7,906,2),(7,907,0),(8,908,4),(8,909,1),(8,910,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,911,0),(7,912,2),(7,913,1),(8,914,2),(8,915,4),(7,916,1),(8,917,0),(8,918,2),(7,919,4),(8,920,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,921,1),(7,922,1),(7,923,0),(8,924,0),(7,925,1),(7,926,1),(8,927,1),(7,928,3),(8,929,2),(7,930,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,931,4),(7,932,3),(8,933,1),(8,934,4),(8,935,2),(8,936,2),(7,937,3),(8,938,4),(7,939,4),(8,940,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,941,1),(8,942,2),(7,943,0),(8,944,4),(8,945,4),(8,946,0),(8,947,3),(8,948,1),(7,949,0),(7,950,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,951,0),(8,952,3),(7,953,1),(8,954,2),(7,955,4),(7,956,4),(7,957,4),(7,958,0),(7,959,2),(7,960,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,961,3),(8,962,4),(7,963,0),(7,964,4),(8,965,4),(7,966,0),(8,967,0),(7,968,0),(8,969,1),(8,970,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,971,4),(7,972,1),(8,973,3),(7,974,2),(7,975,4),(7,976,0),(8,977,2),(8,978,0),(8,979,4),(7,980,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (7,981,2),(8,982,0),(7,983,3),(8,984,0),(8,985,1),(8,986,3),(8,987,2),(8,988,4),(7,989,2),(7,990,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (8,991,4),(7,992,2),(8,993,0),(8,994,1),(8,995,2),(8,996,0),(8,997,1),(8,998,0),(8,999,2),(7,1000,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,1,0),(9,2,2),(9,3,0),(10,4,3),(9,5,1),(9,6,1),(9,7,3),(9,8,1),(10,9,4),(10,10,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,11,1),(9,12,1),(9,13,2),(9,14,3),(10,15,1),(10,16,4),(9,17,2),(10,18,4),(9,19,2),(9,20,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,21,3),(9,22,2),(10,23,2),(9,24,2),(10,25,1),(9,26,4),(10,27,3),(10,28,2),(9,29,4),(9,30,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,31,1),(9,32,3),(9,33,0),(9,34,0),(9,35,0),(9,36,3),(10,37,3),(9,38,0),(9,39,2),(9,40,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,41,4),(9,42,4),(10,43,3),(10,44,1),(9,45,0),(10,46,2),(10,47,2),(9,48,1),(9,49,2),(9,50,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,51,0),(9,52,2),(10,53,1),(9,54,4),(10,55,1),(10,56,1),(9,57,3),(9,58,1),(9,59,2),(10,60,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,61,1),(10,62,2),(9,63,4),(10,64,4),(9,65,1),(10,66,1),(9,67,2),(10,68,3),(9,69,3),(9,70,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,71,3),(9,72,4),(10,73,0),(9,74,4),(10,75,1),(10,76,1),(10,77,3),(9,78,4),(9,79,0),(10,80,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,81,0),(10,82,1),(9,83,2),(10,84,0),(10,85,0),(10,86,3),(9,87,4),(9,88,2),(9,89,4),(9,90,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,91,2),(9,92,1),(9,93,0),(9,94,4),(9,95,1),(9,96,1),(10,97,1),(10,98,2),(9,99,4),(10,100,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,101,3),(10,102,3),(9,103,1),(9,104,1),(10,105,1),(9,106,3),(9,107,1),(10,108,1),(9,109,3),(9,110,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,111,1),(10,112,3),(9,113,2),(10,114,2),(10,115,4),(9,116,2),(9,117,0),(10,118,2),(10,119,0),(10,120,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,121,4),(9,122,4),(9,123,0),(9,124,3),(10,125,1),(9,126,0),(10,127,3),(10,128,1),(9,129,2),(9,130,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,131,4),(10,132,3),(10,133,4),(10,134,3),(9,135,3),(9,136,4),(10,137,4),(9,138,1),(9,139,3),(9,140,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,141,3),(9,142,2),(10,143,0),(9,144,4),(10,145,0),(9,146,1),(10,147,1),(10,148,1),(10,149,2),(9,150,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,151,4),(9,152,0),(10,153,4),(9,154,2),(9,155,1),(10,156,1),(9,157,2),(9,158,4),(10,159,2),(10,160,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,161,1),(9,162,2),(9,163,2),(9,164,4),(9,165,4),(9,166,0),(10,167,1),(9,168,3),(10,169,1),(9,170,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,171,1),(10,172,4),(9,173,2),(10,174,2),(10,175,1),(9,176,0),(10,177,0),(10,178,4),(10,179,4),(10,180,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,181,0),(9,182,4),(10,183,0),(10,184,1),(9,185,2),(10,186,2),(10,187,2),(10,188,2),(9,189,4),(10,190,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,191,3),(10,192,0),(9,193,2),(9,194,2),(9,195,1),(9,196,0),(10,197,4),(10,198,4),(10,199,4),(10,200,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,201,2),(10,202,2),(10,203,0),(10,204,4),(9,205,4),(9,206,3),(10,207,2),(9,208,3),(9,209,4),(10,210,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,211,2),(10,212,2),(10,213,1),(9,214,2),(10,215,0),(10,216,0),(9,217,4),(9,218,3),(9,219,4),(9,220,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,221,3),(10,222,1),(9,223,0),(9,224,2),(10,225,2),(10,226,3),(9,227,3),(9,228,2),(9,229,3),(9,230,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,231,0),(10,232,0),(10,233,2),(10,234,1),(10,235,1),(10,236,3),(9,237,4),(10,238,3),(9,239,0),(10,240,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,241,0),(10,242,4),(9,243,0),(10,244,0),(9,245,3),(10,246,1),(9,247,2),(9,248,2),(9,249,3),(10,250,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,251,2),(9,252,0),(10,253,0),(10,254,0),(9,255,0),(9,256,2),(9,257,4),(10,258,1),(9,259,4),(9,260,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,261,0),(10,262,0),(10,263,4),(9,264,2),(10,265,1),(10,266,0),(10,267,4),(10,268,2),(10,269,1),(9,270,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,271,3),(9,272,3),(10,273,4),(9,274,0),(10,275,3),(9,276,3),(9,277,0),(10,278,3),(10,279,4),(9,280,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,281,2),(10,282,3),(9,283,4),(10,284,1),(9,285,4),(9,286,3),(10,287,1),(9,288,0),(10,289,4),(9,290,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,291,4),(9,292,4),(9,293,4),(10,294,4),(9,295,1),(10,296,1),(10,297,4),(9,298,3),(9,299,3),(10,300,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,301,3),(9,302,3),(10,303,0),(10,304,3),(9,305,2),(9,306,2),(10,307,2),(10,308,0),(9,309,3),(10,310,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,311,2),(9,312,2),(10,313,3),(9,314,3),(10,315,4),(9,316,0),(9,317,4),(9,318,2),(9,319,3),(9,320,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,321,1),(9,322,1),(9,323,2),(10,324,1),(10,325,0),(9,326,3),(10,327,3),(9,328,3),(9,329,2),(9,330,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,331,1),(10,332,3),(10,333,0),(9,334,3),(10,335,2),(10,336,2),(9,337,3),(10,338,2),(9,339,0),(9,340,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,341,3),(10,342,1),(9,343,2),(9,344,4),(10,345,4),(9,346,3),(9,347,3),(10,348,3),(10,349,4),(9,350,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,351,0),(10,352,0),(9,353,3),(10,354,4),(10,355,4),(9,356,2),(9,357,0),(9,358,2),(9,359,4),(10,360,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,361,2),(10,362,3),(9,363,4),(10,364,1),(9,365,2),(9,366,4),(9,367,2),(10,368,0),(10,369,4),(10,370,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,371,0),(9,372,1),(9,373,3),(10,374,0),(9,375,0),(10,376,0),(10,377,3),(9,378,2),(9,379,1),(9,380,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,381,4),(10,382,1),(10,383,4),(9,384,4),(9,385,3),(9,386,1),(9,387,3),(10,388,1),(10,389,2),(10,390,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,391,0),(10,392,3),(10,393,1),(10,394,4),(10,395,0),(9,396,1),(9,397,3),(9,398,3),(10,399,4),(10,400,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,401,3),(10,402,2),(10,403,2),(10,404,4),(10,405,2),(10,406,4),(10,407,4),(9,408,3),(9,409,2),(10,410,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,411,0),(10,412,1),(9,413,2),(10,414,2),(10,415,2),(10,416,2),(10,417,0),(9,418,1),(9,419,1),(10,420,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,421,3),(10,422,4),(9,423,4),(9,424,0),(10,425,1),(10,426,1),(10,427,0),(9,428,3),(9,429,1),(10,430,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,431,0),(10,432,4),(10,433,2),(9,434,0),(10,435,3),(9,436,2),(10,437,2),(9,438,0),(10,439,2),(10,440,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,441,3),(10,442,2),(10,443,2),(10,444,3),(9,445,3),(10,446,1),(9,447,3),(10,448,2),(9,449,2),(10,450,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,451,4),(9,452,2),(9,453,0),(9,454,2),(9,455,3),(10,456,2),(9,457,0),(9,458,2),(10,459,0),(9,460,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,461,3),(10,462,4),(9,463,3),(9,464,0),(9,465,4),(10,466,3),(10,467,4),(10,468,3),(10,469,4),(10,470,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,471,0),(10,472,1),(10,473,2),(10,474,1),(9,475,0),(10,476,0),(9,477,0),(10,478,0),(10,479,3),(9,480,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,481,1),(10,482,0),(10,483,0),(9,484,2),(9,485,2),(10,486,4),(9,487,2),(9,488,3),(9,489,0),(9,490,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,491,1),(10,492,3),(9,493,3),(9,494,1),(10,495,1),(9,496,2),(10,497,2),(10,498,4),(9,499,0),(10,500,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,501,3),(9,502,1),(10,503,3),(10,504,3),(10,505,3),(10,506,1),(10,507,0),(10,508,2),(9,509,1),(9,510,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,511,4),(10,512,2),(9,513,3),(9,514,3),(9,515,1),(10,516,2),(10,517,3),(10,518,2),(9,519,0),(9,520,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,521,1),(10,522,1),(10,523,2),(10,524,1),(9,525,3),(10,526,2),(9,527,0),(9,528,0),(9,529,0),(10,530,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,531,2),(9,532,1),(9,533,4),(9,534,2),(10,535,0),(10,536,3),(9,537,4),(9,538,3),(9,539,1),(10,540,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,541,0),(10,542,4),(9,543,3),(10,544,0),(10,545,4),(10,546,0),(9,547,2),(10,548,1),(9,549,1),(9,550,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,551,1),(9,552,4),(10,553,0),(9,554,1),(9,555,4),(9,556,0),(10,557,0),(10,558,1),(9,559,0),(10,560,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,561,4),(9,562,4),(9,563,0),(10,564,0),(10,565,0),(10,566,4),(10,567,4),(10,568,2),(9,569,1),(9,570,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,571,2),(10,572,3),(10,573,1),(9,574,4),(9,575,1),(10,576,4),(9,577,0),(10,578,1),(10,579,4),(10,580,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,581,3),(10,582,0),(9,583,2),(10,584,4),(9,585,0),(10,586,2),(10,587,0),(10,588,1),(10,589,4),(9,590,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,591,2),(10,592,4),(10,593,0),(10,594,3),(9,595,1),(10,596,2),(10,597,1),(10,598,0),(9,599,3),(9,600,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,601,0),(9,602,1),(10,603,2),(9,604,4),(10,605,1),(10,606,3),(9,607,1),(10,608,2),(9,609,1),(10,610,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,611,1),(9,612,2),(10,613,3),(10,614,1),(10,615,2),(9,616,3),(9,617,4),(10,618,4),(10,619,0),(10,620,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,621,2),(10,622,2),(10,623,2),(10,624,2),(10,625,1),(10,626,0),(9,627,4),(9,628,1),(9,629,3),(10,630,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,631,0),(9,632,3),(10,633,2),(10,634,4),(10,635,4),(9,636,1),(10,637,0),(9,638,2),(10,639,2),(10,640,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,641,3),(9,642,0),(10,643,1),(10,644,0),(9,645,1),(10,646,1),(10,647,4),(10,648,0),(10,649,2),(10,650,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,651,4),(9,652,2),(9,653,0),(10,654,4),(9,655,0),(10,656,0),(9,657,1),(10,658,1),(10,659,1),(10,660,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,661,3),(9,662,3),(10,663,3),(9,664,4),(10,665,4),(10,666,1),(9,667,2),(9,668,1),(10,669,4),(10,670,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,671,2),(10,672,4),(9,673,3),(10,674,3),(10,675,2),(10,676,3),(10,677,0),(9,678,4),(9,679,1),(10,680,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,681,1),(10,682,3),(10,683,0),(10,684,4),(9,685,2),(10,686,1),(9,687,0),(10,688,0),(9,689,2),(9,690,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,691,3),(9,692,4),(10,693,4),(10,694,1),(9,695,0),(10,696,3),(10,697,1),(9,698,0),(9,699,4),(10,700,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,701,0),(9,702,0),(9,703,2),(10,704,1),(10,705,1),(10,706,4),(10,707,0),(9,708,2),(10,709,3),(10,710,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,711,3),(10,712,1),(9,713,1),(9,714,4),(10,715,0),(9,716,1),(9,717,2),(10,718,2),(9,719,0),(10,720,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,721,3),(9,722,0),(9,723,0),(10,724,4),(9,725,4),(10,726,0),(9,727,0),(9,728,3),(10,729,4),(9,730,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,731,0),(9,732,0),(10,733,0),(9,734,3),(10,735,4),(10,736,0),(9,737,0),(10,738,3),(9,739,2),(10,740,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,741,3),(10,742,2),(10,743,3),(9,744,4),(10,745,2),(10,746,4),(10,747,2),(9,748,1),(9,749,4),(9,750,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,751,0),(9,752,0),(9,753,1),(9,754,3),(10,755,1),(10,756,1),(9,757,0),(10,758,4),(10,759,0),(10,760,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,761,1),(10,762,0),(10,763,1),(9,764,0),(9,765,2),(10,766,2),(10,767,3),(9,768,2),(10,769,3),(10,770,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,771,4),(10,772,2),(10,773,3),(10,774,3),(9,775,3),(10,776,4),(10,777,2),(9,778,2),(9,779,2),(10,780,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,781,4),(9,782,0),(10,783,3),(9,784,4),(10,785,0),(9,786,4),(10,787,2),(10,788,4),(9,789,0),(10,790,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,791,3),(9,792,0),(9,793,1),(9,794,4),(10,795,4),(9,796,3),(9,797,3),(10,798,1),(10,799,0),(9,800,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,801,0),(9,802,1),(10,803,4),(9,804,0),(10,805,0),(10,806,1),(9,807,1),(10,808,0),(10,809,0),(9,810,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,811,4),(9,812,0),(10,813,4),(9,814,4),(10,815,0),(10,816,3),(10,817,1),(10,818,0),(9,819,2),(10,820,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,821,3),(9,822,1),(10,823,2),(9,824,1),(10,825,3),(10,826,4),(10,827,4),(9,828,1),(10,829,2),(10,830,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,831,1),(10,832,2),(10,833,2),(9,834,2),(9,835,1),(10,836,1),(9,837,1),(10,838,2),(10,839,2),(10,840,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,841,1),(10,842,2),(9,843,1),(10,844,0),(10,845,3),(9,846,0),(9,847,0),(10,848,1),(9,849,3),(9,850,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,851,1),(9,852,0),(9,853,1),(9,854,2),(10,855,2),(10,856,3),(9,857,3),(9,858,2),(10,859,4),(10,860,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,861,0),(10,862,1),(10,863,2),(9,864,1),(9,865,0),(10,866,1),(10,867,3),(10,868,3),(9,869,0),(10,870,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,871,4),(9,872,0),(10,873,3),(10,874,3),(9,875,2),(9,876,3),(9,877,3),(9,878,1),(9,879,4),(9,880,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,881,0),(9,882,3),(10,883,4),(10,884,4),(10,885,0),(10,886,2),(9,887,3),(9,888,3),(9,889,2),(9,890,3);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,891,3),(10,892,0),(9,893,1),(10,894,3),(9,895,1),(9,896,3),(9,897,2),(9,898,4),(10,899,4),(10,900,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,901,4),(9,902,4),(9,903,0),(10,904,3),(9,905,4),(9,906,0),(10,907,4),(10,908,2),(9,909,0),(10,910,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,911,1),(10,912,2),(9,913,2),(9,914,2),(9,915,1),(9,916,4),(9,917,4),(9,918,0),(9,919,2),(9,920,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,921,3),(9,922,2),(10,923,4),(9,924,1),(9,925,3),(10,926,2),(9,927,4),(10,928,2),(10,929,4),(9,930,2);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,931,0),(10,932,1),(9,933,1),(10,934,3),(10,935,1),(9,936,2),(9,937,4),(9,938,2),(9,939,2),(10,940,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,941,0),(9,942,3),(10,943,0),(9,944,3),(10,945,0),(10,946,2),(9,947,4),(10,948,3),(9,949,3),(9,950,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,951,1),(10,952,4),(10,953,4),(9,954,1),(9,955,3),(10,956,3),(10,957,1),(10,958,2),(9,959,0),(9,960,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (10,961,1),(9,962,1),(10,963,3),(10,964,2),(9,965,0),(10,966,2),(9,967,3),(9,968,0),(10,969,4),(9,970,1);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,971,4),(9,972,2),(9,973,4),(10,974,1),(9,975,3),(10,976,3),(10,977,1),(10,978,3),(10,979,4),(9,980,0);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,981,0),(9,982,2),(10,983,2),(10,984,1),(10,985,3),(10,986,4),(10,987,1),(9,988,2),(10,989,1),(10,990,4);
INSERT INTO CourseStudent (CourseId,StudentId,GradePoints) VALUES (9,991,4),(10,992,0),(9,993,1),(10,994,4),(10,995,4),(10,996,1),(10,997,0),(10,998,2),(10,999,2),(10,1000,1);

/* Update course grades for each student to follow realistic pattern based on other attributes*/
SET SQL_SAFE_UPDATES = 0;
UPDATE CourseStudent CS
SET CS.GradePoints = (
	select (
        ABS(
        (info.GPA / 4 * 100) /* 100% baseline w/ 4.0*/
        + (5 * info.OnCampus) - (5 * info.IsWorking) - (C.CourseLevel / 100) - (0.5 * C.CreditHours)
        + (5 * coalesce(AST.HasPosition, 0)) - (0.2 * info.TotalCreditHours)
        )
    )
    from (Select * from CourseStudent) as CS2
	join (
		Select S.StudentId, SUM(C.CreditHours) as TotalCreditHours,
		S.GPA, S.OnCampus, S.IsWorking
		from CourseStudent CS
		join Course C on C.CourseId = CS.CourseId
		join Student S on S.StudentId = CS.StudentId
		group by S.StudentId
	) as info on info.StudentId = CS2.StudentID
    join Course C on C.CourseId = CS2.CourseId
    left join ActivityStudent AST on AST.StudentId = CS2.StudentId
    where cs2.studentId = cs.studentId and cs2.courseid = cs.courseid
)
WHERE !isnull(cs.studentId)