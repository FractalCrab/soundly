from flask import Flask, jsonify, request
import mysql.connector

mydb = mysql.connector.connect(
    host="us-cdbr-east-02.cleardb.net",
    user=" b7c1d59815aede",
    password="d1f287c2",
)
mycursor = mydb.cursor()

mycursor.execute(
    "use heroku_0f834e948b2d904;")
mycursor.execute("create table test2(id int);")



app = Flask(__name__)


@app.route('/')
def main():
    return "Hello"


@app.route('/api/register', methods=['POST', 'GET'])
def test():
    return jsonify(request.form.to_dict())


if __name__ == '__main__':
    app.run(debug=True)
