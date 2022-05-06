from crypt import methods
from flask import Flask, redirect, render_template, request, session
from db import sql_post, sql_fetch

import bcrypt
import psycopg2
import os #get the heroku database url
from datetime import date, datetime

DATABASE_URL = os.environ.get('DATABASE_URL', 'dbname=studygroup_db') #get the secret key from heroku database
SECRET_KEY = os.environ.get('SECRET_KEY', 'pretend secret key for testing') #use the heroku secret key

app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY

admin_email = 'joash@example.com' #adminstrator email to update website backend etc.

@app.route('/')
def index():
    conn = psycopg2.connect(DATABASE_URL)
    cur = conn.cursor()
    cur.execute('SELECT name FROM students')
    students_list = cur.fetchall()
    return render_template('index.html', list = students_list, name = session.get('name')) #checks if name cookie has been set up with session

@app.route('/login', methods=['POST'])
def login_action():

    email = request.form.get('email')
    password = request.form.get('password')

    #fetch email if it exists in database studygroup_db o/w an empty array is returned
    students_info = sql_fetch('SELECT name, email, password_hash FROM students WHERE email = %s', [email])
    
    if students_info != []: #check email 
        pass_hash = students_info[0][2]
        valid = bcrypt.checkpw(password.encode(), pass_hash.encode())

        if valid and email == admin_email:
            session['name'] = 'admin'
            return redirect('/')

        elif valid:
            session['name'] = students_info[0][0]
            session['last login'] = str(datetime.now())
            
            return redirect('/') #go back to home page if email and password checks passed

    return redirect('/login')

@app.route('/login')
def login():
    
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()

    return redirect('/')

@app.route('/signup')
def signup():

    return render_template('signup.html')

@app.route('/signup', methods=['POST'])
def signup_action():

    name = request.form.get('name')
    email = request.form.get('email')
    password = request.form.get('password')
    password_hashed = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode() #store hashed version of password
    date_joined = date.today().strftime("%d/%m/%y")

    # check if user exists in database 
    students_info = sql_fetch('SELECT name, email, password_hash FROM students WHERE email = %s', [email])
    
    if students_info != []: #check email 
        print('user already in database, please log in or sign up with a different email')
        return redirect('/signup')
    else:
        sql_post('INSERT INTO students (name, email, date_joined, password_hash) VALUES (%s, %s, %s, %s)',[name, email, date_joined, password_hashed])
        session['name'] = name
        session['last login'] = str(datetime.now())
        return redirect('/')
    
@app.route('/subjects')
def subjects():

    subjects_list = sql_fetch('SELECT subject_title FROM subjects')

    return render_template('subjects.html', name=session.get('name'), subjects = subjects_list) #check login name 

@app.route('/subjects', methods=['POST']) #update subjects - add new or delete existing
def subjects_update():

    new_subject = request.form.get('add_subject')
    
    sql_post('INSERT INTO subjects (subject_title) VALUES (%s)', [new_subject]) #add subject

    del_subject = request.form.get('delete_subject')
    sql_post('DELETE FROM subjects WHERE subject_title = %s', [del_subject]) #delete subject
    return redirect('/subjects')

#indivudal subject html pages
@app.route('/subjects/<subject>')
def subject(subject):
    
    subject_id = sql_fetch('SELECT id FROM subjects WHERE subject_title = %s', [subject])
    group_list = sql_fetch('SELECT group_name FROM groups WHERE subject_id = %s', [subject_id[0][0]])

    name = session.get('name') #get login name of user

    # use innerjoin to check dt tables with student id and group id
    student_id = sql_fetch('SELECT id FROM students WHERE name = %s', [name])
    joined_groups = sql_fetch('SELECT group_name FROM groups_setup INNER JOIN groups ON group_id = groups.id INNER JOIN students ON student_id = students.id WHERE student_id = %s', [student_id[0][0]])

    joined = list(set(group_list).intersection(joined_groups)) #get groups that user has joined in the subject community
    not_joined = list(set(group_list).difference(joined_groups)) #get groups that user has NOT joined in the subject community

    return render_template('subjects/subject.html', subject = subject, name = name, joined_list = joined, not_joined_list = not_joined)

@app.route('/subject_action', methods=['POST'])
def groups_update():

    subject = request.form.get('subject')
    subject_id = sql_fetch('SELECT id FROM subjects WHERE subject_title = %s', [subject])

    new_group = request.form.get('add_group')
    delete_group = request.form.get('delete_group')

    sql_post('INSERT INTO groups (subject_id, group_name) VALUES (%s, %s)', [subject_id[0][0], new_group]) #update database with new group and its subject id
    sql_post('DELETE FROM groups WHERE group_name = %s', [delete_group]) #update database with new group

    return redirect('/subjects')

#join groups

@app.route('/group_join', methods=['POST'])
def group_join():

    name = session.get('name') #get name of logged in user
    group = request.form.get('groupname')
    group_id = sql_fetch('SELECT id FROM groups WHERE group_name = %s', [group]) #update database to add student into group
    name_id = sql_fetch('SELECT id FROM students WHERE name = %s', [name])
    sql_post('INSERT INTO groups_setup (student_id, group_id) VALUES (%s, %s)', [ name_id[0][0], group_id[0][0] ])  #add student to group 

    return redirect('/subjects')

#group page

@app.route('/groups/<groupname>')
def group(groupname):

    return render_template('groups/group.html', groupname = groupname, name=session.get('name'))

if __name__ == '__main__': #we need this for heroku to work
    app.run(debug=True)