from logging import exception
from flask import Flask, jsonify, request
import mysql.connector
import random
import queries
mydb = mysql.connector.connect(
    host="us-cdbr-east-02.cleardb.net",
    user=" b7c1d59815aede",
    password="d1f287c2",
)
mycursor = mydb.cursor(dictionary=True)

mycursor.execute(
    "use heroku_0f834e948b2d904;")

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def index():
    return app.response_class(status=200,response="Test")
        

    


@app.route('/songs', methods=['POST', 'GET'])
def getSongs():
    try:

        data = queries.select("song", mycursor)
        return jsonify({data})

    except Exception as exception:
        return jsonify({"error": str(exception)})


@app.route('/login', methods=['GET'])
def login():

    try:
       
            
        uid = request.headers.get("username")
        password = request.headers.get("password")
        data = queries.selectWhere("user_info", mycursor, "User_ID="+uid)
        if(len(data) == 0):
            return jsonify({"success": False, "error": "auth invalid"})
        else:
            user = data[0]
            if user["Password"] == password:

                return jsonify({"success": True})
            else:
                return jsonify({"success": False, "error": "auth invalid"})

       

    except Exception as exception:
        return jsonify({"success": False, "error": str(exception)})


if __name__ == '__main__':
    app.run(debug=True)
