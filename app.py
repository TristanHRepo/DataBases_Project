from flask import Flask, render_template, json
import os
from flaskext.mysql import MySQL
from dotenv import load_dotenv, find_dotenv


load_dotenv(find_dotenv())

app = Flask(__name__)
mysql = MySQL()
app.config['MYSQL_DATABASE_USER'] = os.environ.get("340DBUSER")
app.config['MYSQL_DATABASE_PASSWORD'] = os.environ.get("340DBPW")
app.config['MYSQL_DATABASE_DB'] = os.environ.get("340DB")
app.config['MYSQL_DATABASE_HOST'] = os.environ.get("340DBHOST")
mysql.init_app(app)

conn = mysql.connect()
cursor =conn.cursor()

@app.route('/')
def root():
    return render_template('index.html')

@app.route('/plants')
def plants():
    return render_template('plants.html')

@app.route('/care')
def care():
    return render_template('care.html')

@app.route('/guides')
def guides():
    cursor.execute("SELECT * FROM `Guides`")
    guide_data = cursor.fetchall()
    print(guide_data)

    return render_template('guides.html', data=guide_data)

@app.route('/guides/create')
def create_guide():
    return render_template('createGuide.html')

@app.route('/guides/example')
def example_guide():
    return render_template('exampleGuide.html')

@app.route('/login')
def users_login():
    return render_template('usersLogin.html')

@app.route('/users')
def users():
    return render_template('users.html')

@app.route('/register')
def register():
    return render_template('registerUser.html')

@app.route('/experts')
def experts():
    return render_template('experts.html')

# Listener

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 7777))
    app.run(port=port)