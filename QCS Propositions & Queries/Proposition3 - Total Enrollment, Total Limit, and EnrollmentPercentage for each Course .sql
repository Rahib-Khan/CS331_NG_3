-- How may classes that are being taught that semester grouped by course and aggregating the total enrollment, total class limit and the percentage of enrollment.
select CourseCode, count(a.CourseId), sum(Enrollment), sum(Limit), (sum(Enrollment) * 100/ sum(Limit)) from Course.CoursesCLassMode a
join Course.Class b on a.ClassID = b.Classid
join Course.Course c on a.CourseId = c.Courseid
group by a.CourseId,CourseCode
having sum(Limit) <> 0
order by CourseCode
