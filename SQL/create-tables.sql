CREATE TABLE Gender (
  id INT PRIMARY KEY,
  gender VARCHAR(255)
);

CREATE TABLE PartsOfDay (
  id INT PRIMARY KEY,
  part_of_day VARCHAR(255)
);

CREATE TABLE Exercises (
  id INT PRIMARY KEY,
  exercise VARCHAR(255)
);

CREATE TABLE Intensity (
  id INT PRIMARY KEY,
  intensity VARCHAR(255)
);

CREATE TABLE Medicine (
  id INT PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE [User] (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  password VARCHAR(255),
  date_birth DATE,
  gender_id INT FOREIGN KEY REFERENCES Gender(id)
);

CREATE TABLE Doctor (
  id INT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255)
);

CREATE TABLE Report (
  id INT PRIMARY KEY,
  created_at DATE,
  glucose DECIMAL,
  ketones DECIMAL,
  notes TEXT,
  user_id INT FOREIGN KEY REFERENCES [User](id),
  part_of_day_id INT FOREIGN KEY REFERENCES PartsOfDay(id)
);

CREATE TABLE ReportMedicines (
  id INT PRIMARY KEY,
  quantity INT,
  report_id INT FOREIGN KEY REFERENCES Report(id),
  medicine_id INT FOREIGN KEY REFERENCES Medicine(id)
);

CREATE TABLE Tracking (
  id INT PRIMARY KEY,
  created_at DATE,
  exercise_id INT FOREIGN KEY REFERENCES Exercises(id),
  intensity_id INT FOREIGN KEY REFERENCES Intensity(id),
  calories INT,
  notes TEXT,
  user_id INT FOREIGN KEY REFERENCES [User](id),
  start_hour TIME,
  end_hour TIME
);

CREATE TABLE FollowUp (
  id INT PRIMARY KEY,
  date DATE,
  notes TEXT,
  user_id INT FOREIGN KEY REFERENCES [User](id),
  doctor_id INT FOREIGN KEY REFERENCES Doctor(id)
);

CREATE TABLE UserMedicine (
  quantity INT,
  user_id INT NOT NULL FOREIGN KEY REFERENCES [User](id),
  medicine_id INT NOT NULL FOREIGN KEY REFERENCES Medicine(id),
  PRIMARY KEY (user_id, medicine_id)
);

CREATE TABLE ForumMessage (
  id INT PRIMARY KEY,
  message TEXT,
  created_at DATETIME,
  user_id INT FOREIGN KEY REFERENCES [User](id)
);

CREATE TABLE UserDoctor (
  user_id INT FOREIGN KEY REFERENCES [User](id),
  doctor_id INT FOREIGN KEY REFERENCES Doctor(id),
  PRIMARY KEY (user_id, doctor_id)
);

CREATE TABLE Admin (
  id INT PRIMARY KEY,
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255)
);