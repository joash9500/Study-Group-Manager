-- Customers table

-- students ID	    Name    Email   Password_hash   Date_joined
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT,
  email TEXT,
  date_joined DATE,
  password_hash TEXT
);

-- Subjects table

-- subject ID   Title     Total_students 
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    subject_title TEXT
);

-- Preference table

-- preferences id   student_id  subjects
CREATE TABLE preferences (
  id SERIAL PRIMARY KEY,
  student_id INTEGER,
  subject_id INTEGER,

  FOREIGN KEY(student_id)
    REFERENCES students(id),
  FOREIGN KEY(subject_id)
    REFERENCES subjects(id)
);

-- Groups table

-- groups id  subject_id  name
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  subject_id INTEGER,
  group_name TEXT,

  FOREIGN KEY(subject_id)
    REFERENCES subjects(id)
);

-- Groups setup table (may remove this later)
CREATE TABLE groups_setup (
  id SERIAL PRIMARY KEY,
  student_id INTEGER,
  group_id INTEGER,

  FOREIGN KEY(student_id)
    REFERENCES students(id),

  FOREIGN KEY(group_id)
    REFERENCES groups(id)
    ON DELETE CASCADE -- delete this reference if the parent element is deleted
);

-- Table for user posts
CREATE TABLE group_post (
  id SERIAL PRIMARY KEY,
  student_id INTEGER,
  group_id INTEGER,
  user_post TEXT,

  FOREIGN KEY(student_id)
    REFERENCES students(id),

  FOREIGN KEY(group_id)
    REFERENCES groups(id)
    ON DELETE CASCADE -- delete this reference if the parent element is deleted
);

-- prepopulate data (to remove later)

INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Bob Example', 'bob@example.com', '2022-04-10','$2b$12$H4kyXALZeuxc11pF.9I7S.waEmGTdtFJfffiX4K7pOKeXTAbay3/.'); -- password123
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Sally Example', 'sally@example.com', '2022-04-10','$2b$12$/oygWGX8k6K8iplJnR4Gh.OdPEYK8LllH6zabMklQaJNIOsV9nEUe'); -- password456
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Joash Example', 'joash@example.com', '2022-04-09','$2b$12$UlH7q.ty83TzSoTj1v64zeTUqmmAIjzBcdeztHxuC3daZwbHghNRW'); -- password000

-- prepopulate subjects list

INSERT INTO subjects (subject_title) VALUES ('python');