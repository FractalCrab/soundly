from flask import Flask, render_template

app = Flask(__name__)


@app.route('/', methods=['POST', 'GET'])
def index():
    # renders an html file and uses it for the url
    return render_template("index.html", name="test")


if __name__ == "__main__":
    app.run(debug=True)
