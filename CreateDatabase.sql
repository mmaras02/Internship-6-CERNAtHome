CREATE TABLE Accelerators (
	AcceleratorId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Projects(
	ProjectId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE AcceleratorsProjects(
	AcceleratorId INT REFERENCES Accelerators(AcceleratorId),
	ProjectId INT REFERENCES Projects(ProjectId)
);

CREATE TABLE Professions(
	ProfessionId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL UNIQUE CHECK(Name ='engineer' OR Name= 'programmer' OR Name='physicist' OR Name='material scientist')
);

CREATE TABLE Countries(
	CountryId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	Population INT NOT NULL,
	PPP INT CHECK(PPP>0)
);

CREATE TABLE Cities(
	CityId SERIAL PRIMARY KEY,
	Name VARCHAR(30) NOT NULL,
	CountryId INT REFERENCES Countries(CountryId)
);

CREATE TABLE Hotels(
	HotelId SERIAL PRIMARY KEY,
	Capacity INT NOT NULL,
	CityId INT REFERENCES Cities(CityId)
);

CREATE TABLE Scientists(
	ScientistId SERIAL PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	BirthDate TIMESTAMP NOT NULL,
	CountryId INT REFERENCES Countries(CountryId),
	Gender VARCHAR(30) NOT NULL UNIQUE CHECK(Gender ='Male' OR Gender='Female' OR Gender ='Not known' OR Gender='not applicable'),
	ProfessionId INT REFERENCES Professions(ProfessionId),
	HotelId INT REFERENCES Hotels(HotelId)
);


CREATE TABLE ReasearchPapers(
	ReasearchPaperId SERIAL PRIMARY KEY,
	Title CHAR(30) NOT NULL,
	Quoted INT CHECK (Quoted>=0),
	ProjectId INT REFERENCES Projects(ProjectId)
);

ALTER TABLE ReasearchPapers
	ADD DateOfIssue TIMESTAMP NOT NULL


CREATE TABLE ScientistsWork(
	ReasearchPaperId INT REFERENCES ReasearchPapers(ReasearchPaperId),
	ScientistId INT REFERENCES Scientists(ScientistId)
);

