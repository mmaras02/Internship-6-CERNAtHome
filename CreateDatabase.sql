create database CernAtHome

CREATE TABLE Accelerators (
	AcceleratorId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Projects(
	ProjectId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE AcceleratorsProjects(
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId),
	ProjectId INT REFERENCES Projects(ProjectId)
);

CREATE TABLE Professions(
	ProfessionId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(30) NOT NULL UNIQUE CHECK(Name ='engineer' OR Name= 'programmer' OR Name='physicist' OR Name='material scientist')
);

CREATE TABLE Countries(
	CountryId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(30) NOT NULL,
	Population INT NOT NULL,
	PPP INT CHECK(PPP>0)
);

CREATE TABLE Cities(
	CityId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Name VARCHAR(30) NOT NULL,
	CountryId INT REFERENCES Countries(CountryId)
);

CREATE TABLE Hotels(
	HotelId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Capacity INT NOT NULL,
	CityId INT REFERENCES Cities(CityId)
);

CREATE TABLE Scientists(
	ScientistId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthDate TIMESTAMP NOT NULL,
	CountryId INT REFERENCES Countries(CountryId),
	Gender VARCHAR(30) NOT NULL UNIQUE CHECK(Gender ='Male' OR Gender='Female' OR Gender ='Not known' OR Gender='not applicable'),
	ProfessionId INT REFERENCES Professions(ProfessionId),
	HotelId INT REFERENCES Hotels(HotelId)
);

CREATE TABLE ReasearchPapers(
	ReasearchPaperId int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	Title CHAR(30) NOT NULL,
	Quoted INT CHECK (Quoted>=0),
	ProjectId INT REFERENCES Projects(ProjectId)
);

ALTER TABLE ReasearchPapers
	ADD DateOfIssue TIMESTAMP NOT NULL
	
ALTER TABLE ReasearchPapers
	RENAME TO ResearchPapers
	
ALTER TABLE ResearchPapers 
RENAME COLUMN ReasearchPaperId TO ResearchPaperId

CREATE TABLE ScientistsWork(
	ResearchPaperId INT REFERENCES ResearchPapers(ResearchPaperId),
	ScientistId INT REFERENCES Scientists(ScientistId)
);

