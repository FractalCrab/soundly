from flask import Flask, jsonify, request
import mysql.connector
import random
mydb = mysql.connector.connect(
    host="us-cdbr-east-02.cleardb.net",
    user=" b7c1d59815aede",
    password="d1f287c2",
)
mycursor = mydb.cursor()

mycursor.execute(
    "use heroku_0f834e948b2d904;")


app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def index():
    return "Soundly API"

@app.route('/register', methods=['POST', 'GET'])
def register():
 
        if request.form != None:

            username = request.form.get("username")
            password = request.form.get("password")
            id=random.randint(1,1000)
            query = "insert into users values("+str(id),"user","pass"
            mycursor.execute(query)
            return jsonify("success")
        else:
            return jsonify("no data")
        


@app.route('/login', methods=['POST', 'GET'])
def test():
    return jsonify(request.form.to_dict())


if __name__ == '__main__':
    app.run(debug=True)
