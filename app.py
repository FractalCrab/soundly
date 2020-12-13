from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

app = Flask(__name__)

app.secret_key = 'secret'

app.config['MYSQL_HOST'] = 'us-cdbr-east-02.cleardb.com'
app.config['MYSQL_USER'] = 'b7c1d59815aede'
app.config['MYSQL_PASSWORD'] = 'd1f287c2' 
app.config['MYSQL_DB'] = 'heroku_0f834e948b2d904' 
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)




@app.route('/login', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST':
        # Create variables for easy access
        _json = request.get_json()
        # print(_json)
        username = _json['username']
        password = _json['password']
        # Check if user exists using MySQL
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        user = cursor.fetchone()
        # If user exists in users table in out database
        if user:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id'] = user['id']
            session['username'] = user['username']
            # Redirect to song list
            # return url_for()
            return 'Logged in successfully!'
        else:
            # user doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    # 
    return redirect(url_for('register'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    # Check if "username", "password" and "email" POST requests exist (user submitted form)
    if request.method == 'POST':
        # Create variables for easy access
        _json = request.get_json()
        # print(_json)
        username = _json['username']
        password = _json['password']
        email    = _json['email']
        name     =_json['name']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE username = %s', (username,))
        user = cursor.fetchone()
        # If user exists show error and validation checks
        if user:
            msg = 'user already exists!'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address!'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers!'
        elif not username or not password or not email:
            msg = 'Please fill out the form!'
        else:
            # user doesnt exists and the form data is valid, now insert new user into users table
            cursor.execute('INSERT INTO user VALUES (NULL, %s, %s, %s,%s)', (username, password,name, email,))
            mysql.connection.commit()
            return "register success redirect(url_for('login')) "
        # cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

        # cursor.execute('INSERT INTO user VALUES (NULL, %s, %s, %s,%s)', (username, password,name, email,))
        # mysql.connection.commit()
        # return "login succes redirect(url_for('login')) "
    # not registered
    return msg
    # return redirect(url_for('register'))
#
@app.route('/feed')
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the profile page
        return "Soundly"
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/feed')
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:
        #to be done
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM user WHERE id = %s', (session['id'],))
        user = cursor.fetchone()
        # Show the profile page with user info
        return "to be added"
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))



@app.route('/logout',methods=['GET'])
def logout():
    # Remove session data, this will log the user out
    if 'loggedin' in session:
        session.pop('loggedin', None)
        session.pop('id', None)
        session.pop('username', None)
        # Redirect to login page
        return redirect(url_for('login'))
    else:
        return "redirect(url_for('login'))"
    # return "redirect(url_for('login'))"
if __name__ == "__main__":
    app.run()
