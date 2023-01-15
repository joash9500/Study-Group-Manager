-- Customers table

DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS subjects CASCADE;
DROP TABLE IF EXISTS preferences CASCADE;
DROP TABLE IF EXISTS groups CASCADE;
DROP TABLE IF EXISTS groups_setup CASCADE;
DROP TABLE IF EXISTS group_post CASCADE;

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
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  subject_id INT REFERENCES subjects(id) ON DELETE CASCADE
);

-- Groups table

-- groups id  subject_id  name
CREATE TABLE groups (
  id SERIAL PRIMARY KEY,
  subject_id INT REFERENCES subjects(id) ON DELETE CASCADE,
  group_name TEXT
);

-- Groups setup table (may remove this later)
CREATE TABLE groups_setup (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  group_id INT REFERENCES groups(id) ON DELETE CASCADE -- delete this reference if the parent element is deleted,
);

-- Table for user posts
CREATE TABLE group_post (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id) ON DELETE CASCADE,
  group_id INT REFERENCES groups(id) ON DELETE CASCADE, -- delete this reference if the parent element is deleted
  date_post DATE,
  user_post TEXT
);