--------------------------------------
/*QUERIES*/
--------------------------------------
--1--
SELECT rp.Title,rp.DateOfIssue, STRING_AGG(CONCAT(s.LastName, ', ', LEFT(s.FirstName, 1)), '; ') AS Scientists FROM ResearchPapers rp
JOIN ScientistsWork sw ON sw.ResearchPaperId=rp.ResearchPaperId
JOIN Scientists s ON s.ScientistId=sw.ScientistId
GROUP BY rp.Title,rp.DateOfIssue

--2--
SELECT s.FirstName, s.LastName, s.Gender, c.Name, c.PPP FROM Scientists s
JOIN Countries c ON c.CountryId = s.CountryId

--3--
SELECT DISTINCT p.Name AS Project,a.Name AS Accelerator FROM Projects p
JOIN AcceleratorsProjects ap ON ap.ProjectId=p.ProjectId
JOIN Accelerators a ON a.AcceleratorId=ap.AcceleratorId
GROUP BY DISTINCT p.Name,a.Name,
CASE
	WHEN(a.Name IS NULL) THEN 'None'
	ELSE (a.Name) END

--4--
SELECT DISTINCT p.Name FROM Projects p
JOIN ResearchPapers rp ON rp.ProjectId=p.ProjectId
WHERE EXTRACT(YEAR FROM rp.DateOfIssue)>=2015 AND EXTRACT(YEAR FROM rp.DateOfIssue)<=2017

--5--
SELECT c.Name AS Country, COUNT(rp.ResearchPaperId) AS NumberOfResearchPapers,
COALESCE (CAST((SELECT rps.Title AS MostQuotedPaper FROM ResearchPapers rps
	JOIN ScientistsWork sws ON sws.ResearchPaperId=rps.ResearchPaperId
	JOIN Scientists sn ON sn.ScientistId=sws.ScientistId
	JOIN Countries cn ON cn.CountryId=sn.CountryId
	WHERE c.Name=cn.Name
	ORDER BY rps.Quoted DESC
	LIMIT 1) AS VARCHAR),'None')
FROM Countries c
JOIN Scientists s ON s.CountryId=c.CountryId
JOIN ScientistsWork sw ON sw.ScientistId=s.ScientistId
JOIN ResearchPapers rp ON rp.ResearchPaperId=sw.ResearchPaperId
GROUP BY c.Name


--6--
SELECT c.Name AS Country,
	COALESCE(CAST((SELECT MIN(rp.DateOfIssue) FROM ResearchPapers rp
	JOIN ScientistsWork sw ON sw.ResearchPaperId = rp.ResearchPaperId
	JOIN Scientists s ON s.ScientistId = sw.ScientistId
	WHERE s.CountryId = c.CountryId) AS varchar), 'None') AS FirstPaper
FROM Countries c

--7--
SELECT ci.Name AS City,COUNT(*) AS NumberOfScientists FROM Cities ci
JOIN Hotels h ON h.CityId=ci.CityId
JOIN Scientists s ON s.HotelId=h.HotelId
GROUP BY ci.Name
ORDER BY COUNT(s.FirstName) DESC

--8--
SELECT a.Name, ROUND(AVG(rp.Quoted),2) FROM Accelerators a
JOIN AcceleratorsProjects ap ON ap.AcceleratorId = a.AcceleratorId
JOIN Projects p ON p.ProjectId = ap.ProjectId
JOIN ResearchPapers rp ON rp.ProjectId = p.ProjectId
GROUP BY a.Name


--9--
SELECT DISTINCT pr.Name,DATE_PART('decade', s.BirthDate) AS BirthDecade, s.Gender, COUNT(*) AS NumberOfScientists FROM Scientists s
JOIN Professions pr ON pr.ProfessionId=s.ProfessionId
GROUP BY pr.Name, DATE_PART('decade', s.BirthDate), s.Gender
--HAVING COUNT(*) > 20
ORDER BY  DATE_PART('decade', s.BirthDate)
