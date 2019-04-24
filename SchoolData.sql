use CollegeStateUniversity;

DROP TABLE IF EXISTS ActivityStudent;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS CourseType;
DROP TABLE IF EXISTS Activity;
DROP TABLE IF EXISTS Institution;
DROP TABLE IF EXISTS Instructor;


CREATE TABLE Activity (
  ActivityId int NOT NULL Identity(1,1) PRIMARY KEY,
  ActivityName varchar(64) NOT NULL UNIQUE
);

CREATE TABLE CourseType (
	CourseTypeId int Identity(1,1) NOT NULL Primary Key,
    CourseTypeName varchar(64) NOT NULL UNIQUE
);

CREATE TABLE Course (
  CourseId int Identity(1,1) NOT NULL Primary Key,
  CourseTypeId int NOT NULL foreign key references CourseType(CourseTypeId),
  CourseDept varchar(64) NOT NULL,
  CourseLevel int NOT NULL,
  CreditHours int NOT NULL
);


CREATE TABLE Institution (
	InstitutionId int Identity(1,1) not null primary key,
    InstitutionName varchar(64) not null
);

CREATE TABLE Student (
  StudentId int identity(1,1) primary key NOT NULL,
  HashedPass varchar(256) not null,
  FirstName varchar(64) NOT NULL,
  LastName varchar(64) NOT NULL,
  OnCampus int NOT NULL,
  IsWorking int NOT NULL,
  GPA float NOT NULL,
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

CREATE TABLE CourseStudent (
  CourseId int NOT NULL,
  StudentId int NOT NULL,
  GradePercentage int NOT NULL,
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