use wolfejar;

DROP TABLE IF EXISTS ActivityStudent;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseType;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Institution;
drop table if exists Instructor;

CREATE TABLE Activity (
  ActivityId int NOT NULL Identity(1,1) PRIMARY KEY,
  ActivityName varchar(64) NOT NULL UNIQUE
);

INSERT INTO Activity (ActivityName) VALUES ('ACM'),('Soccer Club'),('Tennis Club'),('Book Club'),('Gaming Club'),('Rock Climbing Club'),('AI Club'),('Math Club'),('Rugby Club'),('Physics Club');


CREATE TABLE CourseType (
	CourseTypeId int Identity(1,1) NOT NULL Primary Key,
    CourseTypeName varchar(64) NOT NULL UNIQUE
);

INSERT INTO CourseType (CourseTypeName) VALUES ('Aesthetic Interpretation'),
('Empirical and Quantitative Reasoning'), ('Ethical Reasoning and Responsibility'), 
('Global Issues and Perspectives'), ('Historical Perspectives'), ('Human Diversity within the U.S.'),
('Natural and Physical Sciences'), ('Social Sciences');


CREATE TABLE Course (
  CourseId int Identity(1,1) NOT NULL Primary Key,
  CourseTypeId int NOT NULL foreign key references CourseType(CourseTypeId),
  CourseDept varchar(64) NOT NULL,
  CourseLevel int NOT NULL,
  CreditHours int NOT NULL
);

-- TODO: CourseId will auto increment
INSERT INTO Course (CourseTypeId,CourseDept,CourseLevel,CreditHours) VALUES (6,'Math',235,6),(6,'Math',303,5),(1,'Math',428,1),(3,'Math',676,5),(6,'Math',805,5),(1,'Math',549,6),(3,'Math',845,3),(5,'Math',446,5),(4,'Math',147,4),(2,'Math',410,4);
INSERT INTO Course (CourseTypeId,CourseDept,CourseLevel,CreditHours) VALUES (8,'CIS',278,5),(1,'CIS',712,4),(7,'CIS',831,1),(7,'CIS',473,1),(2,'CIS',155,5),(4,'CIS',167,5),(3,'CIS',146,3),(6,'CIS',668,4),(7,'CIS',958,4),(8,'CIS',695,1);
INSERT INTO Course (CourseTypeId,CourseDept,CourseLevel,CreditHours) VALUES (5,'ENGL',891,6),(5,'ENGL',869,3),(6,'ENGL',449,4),(2,'ENGL',502,5),(3,'ENGL',161,2),(5,'ENGL',471,1),(8,'ENGL',710,3),(8,'ENGL',309,1),(2,'ENGL',493,2),(5,'ENGL',613,6);

CREATE TABLE Institution (
	InstitutionId int Identity(1,1) not null primary key,
    InstitutionName varchar(64) not null
);

INSERT INTO Institution (InstitutionName) VALUES ('Kansas State University'),('University of Kansas'),('Wichita State University'),('Emporia State University'),('Fort Hays State University');

CREATE TABLE Student (
  StudentId int identity(1,1) primary key NOT NULL,
  HashedPass varchar(256) not null,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  OnCampus int NOT NULL,
  IsWorking int NOT NULL,
  GPA float NOT NULL,
  InstitutionId int not null foreign key references Institution(InstitutionId),
  Email varchar(64) not null unique
);

CREATE TABLE Instructor (
  InstructorId int identity(1,1) primary key NOT NULL,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  IsTenured int NOT NULL,
  YearsTeaching int NOT NULL,
  Degree int default NULL
);

-- need to fix these entries, InstructorId will auto increment
INSERT INTO Instructor (FirstName,LastName,IsTenured,YearsTeaching,Degree) VALUES ('Amber','Solomon','0','4',3),('Cally','Burris','0','4',2),('Rahim','Swanson','0','5',3),('Kimberly','Cline','0','3',2),('Rebekah','Massey','1','6',3),('Ethan','Osborne','1','4',3),('Athena','Odonnell','1','7',2),('Keith','Osborn','1','4',3),('Kelly','Branch','0','5',3),('Brynn','Randolph','0','6',2);
INSERT INTO Instructor (FirstName,LastName,IsTenured,YearsTeaching,Degree) VALUES ('Hoyt','Bradley','1','5',2),('Chaim','Mays','1','4',3),('Jamal','Huffman','0','5',3),('Lois','Glass','0','5',3),('Olga','Whitney','0','8',3),('Harriet','Merritt','1','4',2),('Brooke','Velez','1','5',2),('Sawyer','Wall','0','6',2),('Uriah','Kidd','0','5',3),('Howard','Suarez','0','4',2);
INSERT INTO Instructor (FirstName,LastName,IsTenured,YearsTeaching,Degree) VALUES ('Robert','Perkins','1','8',3),('Holmes','Russell','0','5',2),('Rhiannon','Parker','1','4',2),('Kelsie','Whitfield','0','5',2),('Nasim','Cross','1','5',2),('Orli','Schmidt','1','5',3),('Rashad','Lewis','1','4',3),('Thane','Anthony','0','6',3),('Linda','Levy','1','4',3),('Warren','Bender','0','4',3);
INSERT INTO Instructor (FirstName,LastName,IsTenured,YearsTeaching,Degree) VALUES ('Kathleen','Conley','1','6',3),('Damian','Ewing','1','6',3),('Avye','Benton','1','6',2),('James','Watts','0','4',2),('Zena','Garza','1','6',3),('Leroy','Shaffer','1','6',3),('Fitzgerald','Clarke','0','6',3),('Adam','Holder','0','8',2),('Tasha','Gardner','1','5',2),('Chaney','Coleman','0','5',3);
INSERT INTO Instructor (FirstName,LastName,IsTenured,YearsTeaching,Degree) VALUES ('Yardley','Oliver','0','3',2),('Dennis','Walter','1','8',2),('Evan','Lowe','1','4',3),('Maxwell','Sears','0','4',2),('Channing','Pugh','0','5',2),('Aurelia','Johnson','0','6',2),('Ivana','Donaldson','1','5',2),('Gregory','Decker','0','6',3),('Eleanor','Head','1','5',2),('Tatyana','Mason','0','5',3);


CREATE TABLE CourseStudent (
  CourseId int NOT NULL,
  StudentId int NOT NULL,
  GradePercentage int NOT NULL,
  FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

Select count(StudentId)
from CourseStudent;

CREATE TABLE ActivityStudent (
  StudentId int NOT NULL,
  ActivityId int NOT NULL,
  HasPosition int NOT NULL
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId),
  FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);

/*
 Update course grades for each student to follow realistic pattern based on other attributes
SET SQL_SAFE_UPDATES = 0;
UPDATE CourseStudent CS
SET CS.GradePercentage = (
	select (
        ABS(
        (info.GPA / 4 * 100) /* 100% baseline w/ 4.0
        + (5 * info.OnCampus) - (3 * info.IsWorking) - (C.CourseLevel / 1000) - (0.2 * C.CreditHours)
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
WHERE !isnull(cs.studentId) */