# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Project #2: Building Your First Full-stack Application

### Overview

This second project is your first foray into **building a full-stack database-backed application.**
This means you'll learn about what it takes to build a functional application from the ground up yourself.

**This is exciting!** It's a lot, but we'll give you the tools to be able build what you need,
and you get to decide what you do with it.
You get to be creative in choosing what sort of application you want to build! 

**You will be working individually for this project**, and you'll be designing the app yourself.
We hope you'll exercise creativity on this project, sketch some wireframes before you start,
and write user stories to define what your users will want to do with the app.
Make sure you have time to run these ideas by your instructors to get their feedback before
you dive too deep into code!

Be ambitious! Stretch yourself! But remember to **start small**! Focus only on the most crucial parts of your app to get them working first.

---

### Technical Requirements

Your app must:

* **Have at _least_ 2 tables** (more if they make sense) – one of them should represent the people using your application (users).
* **Include sign up/log in functionality (if it makes sense)**, with encrypted passwords & an authorization flow
* **Modify data in the database** There should be ways for users to add/change some data in the database (it's ok if only admins can make changes).
* Have **semantically clean HTML and CSS**
* **Be deployed online** and accessible to the public

---

### Necessary Deliverables

* A **working full-stack application, built by you**, hosted somewhere on the internet
* A **link to your hosted working app** in the URL section of your GitHub repo
* A **git repository hosted on GitHub**, with a link to your hosted project,  and frequent commits dating back to the **very beginning** of the project. Commit early, commit often.
* **A ``README.md`` file** with explanations of the technologies used, the approach taken, installation instructions, unsolved problems, etc.

### Optional extras
* Use your JavaScript skills to make a smooth UI, e.g. validating your forms before submitting.
* Interact with an external JSON API (check the weather, get book/movie info, space pictures, send SMSs, etc.)
* Upload and store images or files using [AWS S3](https://devcenter.heroku.com/articles/s3-upload-python)

---

### Suggested Ways to Get Started

* **User stories define what a specific type of user wants to accomplish with your application**. Keep focused on what a user wants to do with your app, it'll help you know what to build.
* **Build the most important parts first.** What is the minimum you can build that is useful?
* **Don’t hesitate to write throwaway code to solve short term problems** 
* **Commit early, commit often.** Don’t be afraid to break something because you can always go back in time to a previous version.

### Pro-tips!
* Commit and deploy often! Bugs are much easier to fix if only one bit of code has changed since the last deploy.
* Create a file `setup.sql` (or a Python script) which creates all your tables and inserts a bunch of test data. Then you can delete and reset your database whenever you want.
---

### Potential Project Ideas

##### Cheerups
The world is a depressing place.

Your task is to create an app that will allow people to create and share "cheerups" - happy little quips to brighten other people's' days. Cheerups will be small - limited to 139 characters. Members will be able to promote Cheerups that they like and maybe even boost the reputation of the Cheerupper.

##### Bookmarket
You will create an application where users can bookmark links they want to keep.

But what if users could trade bookmarks for other bookmarks? Or sell bookmarks for points? Or send bookmarks to your friends. Or something even crazier.

##### Dating online
Online dating is a multibillion dollar industry.
Produce a new online dating platform to help people to connect, maybe even connect groups of friends or professional networks.

##### Recipe sharing
Allow users to share their recipes, with options to search for recipes by ingredient and add reviews or comments.

##### Event planning
Users can create public events and other users can find and say they're going to those events. This could be for political demonstrations, art showings, flashmobs. Alternatively, make it for private events where only invited people can see the event and RSVP, use it to plan a wedding, a birthday or a holiday with your mates.

Bonus: Use the Twilio API to send SMS reminders, or a weather API to check the forecast for the event day.

##### Photo sharing app
Users will be able to register and create albums and photos.
Albums and photos will need to be named and described by their owners.
Users will be able to view other user's' albums.
Maybe users can comment on photos, or either up/down vote them.

See the [Heroku documentation for doing file uploads in a Python app](https://devcenter.heroku.com/articles/s3-upload-python).

---

### Useful Resources

* **[Heroku](http://www.heroku.com)** _(for hosting your back-end)_
* **[Presenting Information Architecture](http://webstyleguide.com/wsg3/3-information-architecture/4-presenting-information.html)** _(for more insight into wireframing)_
* [Postgresql SQL commands](https://www.postgresql.org/docs/9.1/static/sql-commands.html)
* [Postgresql Data Types](https://www.postgresql.org/docs/9.5/datatype.html) _(for storing dates and times)_
* **[Trello](https://trello.com)** for tracking your todo list/user stories
* **https://sqlbolt.com/**