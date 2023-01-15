-- prepopulate data (to remove later)

INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Bob Example', 'bob@example.com', '2022-04-10','$2b$12$H4kyXALZeuxc11pF.9I7S.waEmGTdtFJfffiX4K7pOKeXTAbay3/.'); -- password123
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Sally Example', 'sally@example.com', '2022-04-10','$2b$12$/oygWGX8k6K8iplJnR4Gh.OdPEYK8LllH6zabMklQaJNIOsV9nEUe'); -- password456
INSERT INTO students (name, email, date_joined, password_hash) VALUES ('Joash Example', 'joash@example.com', '2022-04-09','$2b$12$hxl0vh78EE3yIjaP7zeGFu4Z3Ehy5lfKVb1lD2AXwQ3ni4wXDUMiK'); -- password

-- prepopulate subjects list

INSERT INTO subjects (subject_title) VALUES ('java');
INSERT INTO subjects (subject_title) VALUES ('python');
INSERT INTO subjects (subject_title) VALUES ('javascript');
