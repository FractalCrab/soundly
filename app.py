from flask import Flask, request, redirect, jsonify, url_for, session
from flask import json
from flask.helpers import make_response
from flask_mysqldb import MySQL, MySQLdb
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
        response = make_response(
            jsonify({'message': 'You are already logged in', 'username': username}),
            200,
        )
        return response

    else:
        response = make_response(
            jsonify(
                "Soundly Base API"
            ),
            200,
        )
        return response


@app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == 'POST':
        _json = request.form
        
        username = _json['username']
        password = _json['password']
      
        try:
            curl = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            curl.execute("SELECT * FROM user WHERE username=%s", (username,))
            user = curl.fetchone()
            # print (user)
            curl.close()
            print("user"+user["password"])
            # print(len(user))
            print(user)
            if (password == user["password"]):
                session['name'] = user['name']
                session['username'] = user['username']

                response = make_response(
                    jsonify({'message': 'logedin success'}),
                    200,
                )
                return response
            else:
                response = make_response(
                    jsonify({'message': 'invalid password'}),
                    201,
                )
                return response
        except Exception as e:
            response = make_response(
                jsonify({'message': e}),
                500,
            )
            return response

    else:
        response = make_response(
            jsonify({'message': 'invalid password'}),
            201,
        )
        return response

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
    return jsonify({'message': 'You successfully logged out'})


if __name__ == "__main__":
    app.secret_key="soundlySessionKey"
    app.run(port=5001)
