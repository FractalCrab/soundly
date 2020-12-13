from flask import Flask, request, redirect,jsonify, url_for, session
from flask import json
from flask_mysqldb import MySQL,MySQLdb
import pymysql
import requests
from flask_mysqldb import MySQL
import mysql.connector
from mysql.connector import (connection)
app = Flask(__name__)

app.config['MYSQL_HOST'] = 'us-cdbr-east-02.cleardb.com'
app.config['MYSQL_USER'] = 'b7c1d59815aede'
app.config['MYSQL_PASSWORD'] = 'd1f287c2' 
app.config['MYSQL_DB'] = 'heroku_0f834e948b2d904' 
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
mysql = MySQL(app)

# @app.route('/')
# def hello():
#     usernamexyz="usernamexyz"
#     curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
#     curl.execute("SELECT * FROM user WHERE username=%s",(usernamexyz,))
#     user = curl.fetchone()
#     print(user["password"])


@app.route('/')
def home():
	if 'username' in session:
		username = session['username']
		return jsonify({'message' : 'You are already logged in', 'username' : username})
	else:
		resp = jsonify({'message' : 'register'})
		resp.status_code = 401
		return resp

@app.route('/login',methods=["GET","POST"])
def login():
    if request.method == 'POST':
        _json = request.get_json()
        print(_json)
        username = _json['username']
        password = _json['password']
        islogged = False
        print("form "+password)
        try:
                curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                curl.execute("SELECT * FROM user WHERE username=%s",(username,))
                user = curl.fetchone()
                # print (user)
                # curl.close()
                print("user"+user["password"])
                # print(len(user))
                print(user)
                if (password == user["password"]):
                    # session['name'] = user['name']
                    # session['username'] = user['username']
                    # print(session['name'])
                    isLogged= True
                    return "is logged"
                else:
                        return "Error passowrd didnt match"
        except Exception as e:
                return jsonify({'message' : 'error'})
        finally:
            if curl:
                curl.close()
    else:
        return jsonify({'message' : 'please login'})
#to be written song route
# @app.route('/song', methods=['GET', 'POST'])
# def index():
  

@app.route('/logout', methods=["GET", "POST"])
def logout():
    session.clear()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(port=5001)
