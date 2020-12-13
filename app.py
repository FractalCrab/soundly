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
        print("form "+password)
        try:
                curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                curl.execute("SELECT * FROM user WHERE username=%s",(username,))
                user = curl.fetchone()
                # print (user)
                curl.close()
                print("user"+user["password"])
                # print(len(user))
                print(user)
                if (password == user["password"]):
                    session['name'] = user['name']
                    session['username'] = user['username']
                    return jsonify({'message' : 'logedin success'})
                else:
                        return "Error passowrd didnt match"
        except Exception as e:
                return jsonify({'message' : 'error'})
    else:
        return jsonify({'message' : 'please login'})

# @app.route('/login', methods=['POST'])
# def login():
# 	conn = None;
# 	cursor = None;
	
# 	try:
# 		_json = request.json
# 		_username = _json['username']
# 		_password = _json['password']
		
# 		# validate the received values
# 		if _username and _password:
# 			#check user exists			
# 			conn =  mysql.connection
# 			cursor = conn.cursor()
			
# 			sql = "SELECT * FROM user WHERE username=%s"
# 			sql_where = (_username,)
			
# 			cursor.execute(sql, sql_where)
# 			row = cursor.fetchone()
# 			print(row[2])
# 			# if row:
# 			# 	if (password == user["password"]):
# 			# 		session['username'] = row[1]
# 			# 		#cursor.close()
# 			# 		#conn.close()
# 			# 		return jsonify({'message' : 'You are logged in successfully'})
# 			# 	else:
# 			# 		resp = jsonify({'message' : 'Bad Request - invalid password'})
# 			# 		resp.status_code = 400
# 			# 		return resp
# 		else:
# 			resp = jsonify({'message' : 'Bad Request - invalid credendtials'})
# 			resp.status_code = 400
# 			return resp

	# except Exception as e:
	# 	print(e)

	# finally:
	# 	if cursor and conn:
	# 		cursor.close()
	# 		conn.close()



# def logout():
#     session.clear()
#     return redirect('/login')
@app.route('/logout', methods=["GET", "POST"])
def logout():
	if 'username' in session:
		session.pop('username', None)
	return jsonify({'message' : 'You successfully logged out'})

if __name__ == "__main__":
    app.run(port=5001)