# Study Group Manager
Database-backed project

## Goal:
Website that services communities that support group work and collaboration when learning a new skill

## Walkthough

### Home Page / Welcome Page

The starting point where students can see the welcome page. 

1. Nav Bar
Students can see the nav bar at the top, to move around the web app:
 - login : students can sign into the program to join and interact with communities
 - sign up: new visitors can sign up as students with their name, email and password
 - subjects: visitors/users can see what is on offer with the subjects that the app supports
 
 2. Description
 What the web app is about

 3. Our members
 Who has joined our communities

 ### Sign up page
 User can see the sign up form. 

 (WIP) New user needs to type a valid password (with number of capitals, and symbols)
 (WIP) New user needs to also use a valid email (check the validity)
 
 ### Login page
 User can sign in here. 
 Typed password is checked with the hashed version of their password (created when they sign in) - password_hash in the students database
 After user signs in, the user can see their login name ('signed in as name')

 ### After sign in (normal user)
 User can see the groups (within the subjects page) and join the community or sign up to a new group.

 ### After sign in (admin user)
 Admin users (with the email stored in admin_email , at the top of app.py) have more functionality to 
 - add/delete groups on the subjects page. 
 - add/delete subjects

 ### Group page
 Communities that the user joins will have a group page.

 (WIP) Cleaner html/css
 (WIP) Twillo api to communicate in real time
 (WIP) Whiteboard to easily share ideas LIVE without form submission
 (WIP) LIVE user posts on group page
 (WIP) Post images or videos (youtube) on the group page
 (WIP) Group members can like (no unlike will be built in) posts and comment on post
 (WIP) Most popular (most liked) posts will be featured at the top of the group page
 
 ### Events page (WIP)

(WIP) Weekly events for members
(WIP) Eventbrite api
 
### User profile page (WIP)

(WIP) student can have a profile page (with bio, fb link etc.)
(WIP) Other students in shared groups can see other user profiles

### To start the Python app/server (on localhost)
1. enter the virtual environment (with pre-installed python packages/modules) by typing in terminal:
```
source venv/bin/activate
```

2. then you can start the server by typing in terminal: 
```
python app.py

```
## NOTE
1. Procfile is required, to deploy the python app
2. Deployment of python app is achieved with gunicorn (installed in virtual environment)





