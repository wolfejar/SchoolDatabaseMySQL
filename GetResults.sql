use CollegeStateUniversity;

Select CS.GradePoints as Grade, info.GPA as StudentGPA, info.TotalCreditHours as StudentTotalCreditHours,
info.OnCampus as StudentOnCampus, info.IsWorking as StudentIsWorking,
coalesce(AST.HasPosition, 0) as StudentHasActivityPosition, C.CreditHours as CourseCreditHours,
C.CourseLevel,
case when CT.CourseTypeId = 1 then 1 else 0 end as AestheticInterpretation,
case when CT.CourseTypeId = 2 then 1 else 0 end as EmpiricalandQuantitativeReasoning,
case when CT.CourseTypeId = 3 then 1 else 0 end as EthicalReasoningandResponsibility,
case when CT.CourseTypeId = 4 then 1 else 0 end as GlobalIssuesandPerspectives,
case when CT.CourseTypeId = 5 then 1 else 0 end as HistoricalPerspectives,
case when CT.CourseTypeId = 6 then 1 else 0 end as HumanDiversitywithintheUS,
case when CT.CourseTypeId = 7 then 1 else 0 end as NaturalandPhysicalSciences,
case when CT.CourseTypeId = 8 then 1 else 0 end as SocialSciences
from CourseStudent CS 
join (
	Select S.StudentId, S.FirstName, S.LastName, SUM(C.CreditHours) as TotalCreditHours,
    S.GPA, S.OnCampus, S.IsWorking
    from CourseStudent CS
    join Course C on C.CourseId = CS.CourseId
    join Student S on S.StudentId = CS.StudentId
    group by S.StudentId
) as info on info.StudentId = CS.StudentId
left join ActivityStudent AST on AST.StudentId = CS.StudentId
join Course C on C.CourseId = CS.CourseId
join CourseType CT on CT.CourseTypeId = C.CourseTypeId
order by info.studentid asc