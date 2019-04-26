use CollegeStateUniversity;

DROP TABLE IF EXISTS ActivityStudent;
DROP TABLE IF EXISTS CourseInstructor;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseType;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Institution;

CREATE TABLE Institution (
	InstitutionId int Identity(1,1) not null primary key,
  InstitutionName varchar(64) not null
);

CREATE TABLE Activity (
  ActivityId int NOT NULL Identity(1,1) PRIMARY KEY,
  ActivityName varchar(64) NOT NULL UNIQUE
);

CREATE TABLE CourseType (
	CourseTypeId int Identity(1,1) NOT NULL Primary Key,
  CourseTypeName varchar(64) NOT NULL UNIQUE,
);

CREATE TABLE Course (
  CourseId int Identity(1,1) NOT NULL Primary Key,
  CourseTypeId int NOT NULL foreign key references CourseType(CourseTypeId),
  CourseDept varchar(64) NOT NULL,
  CourseLevel int NOT NULL,
  CreditHours int NOT NULL
);


CREATE TABLE Student (
  StudentId int identity(1,1) primary key NOT NULL,
  HashedPass varchar(256) not null,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  OnCampus int NOT NULL,
  IsWorking int NOT NULL,
  GPA float NOT NULL,
  Email varchar(64) not null unique,
  InstitutionId int not null FOREIGN KEY REFERENCES Institution(InstitutionId)
);

CREATE TABLE Instructor (
  InstructorId int identity(1,1) primary key NOT NULL,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  IsTenured int NOT NULL,
  YearsTeaching int NOT NULL,
  Degree int default NULL
);

CREATE TABLE CourseStudent (
  CourseId int NOT NULL,
  StudentId int NOT NULL,
  GradePercentage float NOT NULL,
  FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);

CREATE TABLE CourseInstructor (
  CourseId int NOT NULL,
  InstructorId int NOT NULL,
  FOREIGN KEY (CourseId) REFERENCES Course (CourseId),
  FOREIGN KEY (InstructorId) REFERENCES Instructor (InstructorId)
)

CREATE TABLE ActivityStudent (
  StudentId int NOT NULL,
  ActivityId int NOT NULL,
  HasPosition int NOT NULL
  FOREIGN KEY (StudentId) REFERENCES Student (StudentId),
  FOREIGN KEY (ActivityId) REFERENCES Activity(ActivityId)
);

SELECT S.OnCampus, S.IsWorking, S.GPA, CS.GradePercentage, AST.HasPosition, C.CourseDept
FROM Institution I
JOIN Student S on S.InstitutionId = I.InstitutionId
JOIN ActivityStudent AST on AST.StudentId = S.StudentId
JOIN CourseStudent CS on CS.StudentId = S.StudentId
JOIN Course C on C.CourseId = CS.CourseId
WHERE I.InstitutionId = 1

SELECT (RAND()*(-30) + RAND()*30)

SELECT *
FROM CourseStudent
/* Update course grades for each student to follow realistic pattern based on other attributes */
UPDATE Final
SET Final.GradePercentage = (
	select (
        ABS(
        (info.GPA / 4 * 100) -- 100% baseline w/ 4.0
        + (5 * info.OnCampus) - (5 * info.IsWorking) - (info.CourseLevel / 1000) - (0.1 * info.CreditHours)
        + (7 * info.HasPosition) - (0.2 * info.TotalCreditHours) + CHECKSUM(NewId()) % 6-- add some randomness
        )
  )
  from (
    SELECT temp.CourseId, temp.StudentId, temp.GradePercentage, temp.TotalCreditHours, temp.GPA, temp.OnCampus, temp.IsWorking,
    temp.CourseLevel, temp.CreditHours, temp.HasPosition 
    from CourseStudent CS
    inner join (
      Select CS2.CourseId, CS2.StudentId, CS2.GradePercentage, info.TotalCreditHours, S.GPA, S.OnCampus, S.IsWorking,
      C.CourseLevel, C.CreditHours, (CASE WHEN EXISTS((SELECT 1 FROM ActivityStudent WHERE HasPosition = 1)) THEN 1 ELSE 0 END) as HasPosition
      from CourseStudent CS2
	    join (
		    Select S.StudentId, SUM(C.CreditHours) as TotalCreditHours
		    from CourseStudent CS
		    join Course C on C.CourseId = CS.CourseId
		    join Student S on S.StudentId = CS.StudentId
		    group by S.StudentId
	    ) as info on info.StudentId = CS2.StudentID
      join Student S on S.StudentId = CS2.StudentId
      join Course C on C.CourseId = CS2.CourseId --ActivityStudent AST on AST.StudentId = CS2.StudentId -- returning multiple activites per student!
    ) as temp on temp.StudentId = CS.StudentId and temp.CourseId = CS.CourseId) as info
  where info.StudentId = Final.StudentId and info.CourseId = Final.CourseId
)
From CourseStudent Final
WHERE (Final.StudentId) IS NOT NULL;
