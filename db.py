import os
import psycopg2

DB_URL = os.environ.get("DATABASE_URL", "dbname=studygroup_db")
def sql_fetch(query, params=[]):
    conn = psycopg2.connect(DB_URL)
    cur = conn.cursor()
    cur.execute(query, params)
    results = cur.fetchall()
    conn.close()
    return results
# writes sql query and commits the change to the database
def sql_post(query, params=[]):
    conn = psycopg2.connect(DB_URL)
    cur = conn.cursor()
    cur.execute(query, params)
    conn.commit()
    conn.close()


