from flask import Flask
import psycopg2
import os #get the heroku database url

DATABASE_URL = os.environ.get('DATABASE_URL', 'dbname=studygroup_db') #get the secret key from heroku database
SECRET_KEY = os.environ.get('SECRET_KEY', 'pretend secret key for testing') #use the heroku secret key

app = Flask(__name__)
app.config['SECRET_KEY'] = SECRET_KEY

@app.route('/')
def index():
    conn = psycopg2.connect(DATABASE_URL)

    return 'Hello World!'

if __name__ == '__main__': #we need this for heroku to work
    app.run(debug=True)