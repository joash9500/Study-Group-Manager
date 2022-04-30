DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS subjects;

-- Customers table

-- students ID	    Name    Email   Password_hash   Date_joined
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  date_joined DATE,
  password_hash TEXT
);

-- Subjects table

-- subject ID   Title     Total_students 
CREATE TABLE subjects (
    subject_id SERIAL PRIMARY KEY,
    title TEXT,
    total_students INTEGER NOT NULL
);

-- prepopulate data (to remove later)

INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Bob Example', 'bob@example.com', '2022-04-10','$2b$12$H4kyXALZeuxc11pF.9I7S.waEmGTdtFJfffiX4K7pOKeXTAbay3/.'); -- password123
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Sally Example', 'sally@example.com', '2022-04-10','$2b$12$/oygWGX8k6K8iplJnR4Gh.OdPEYK8LllH6zabMklQaJNIOsV9nEUe'); -- password456
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Joash Example', 'joash@example.com', '2022-04-09','$2b$12$UlH7q.ty83TzSoTj1v64zeTUqmmAIjzBcdeztHxuC3daZwbHghNRW'); -- password000