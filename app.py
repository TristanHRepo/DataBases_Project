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
    cursor.execute("SELECT * FROM `Plants`")
    plant_data = cursor.fetchall()
    return render_template('plants.html', data=plant_data)

@app.route('/care')
def care():
    return render_template('care.html')

@app.route('/guides')
def guides():
    cursor.execute("SELECT * FROM `Guides`")
    guide_data = cursor.fetchall()
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

@app.route('/admins')
def admins():
    return render_template('admins.html')

@app.route('/admins/users')
def adminsusers():
    cursor.execute("SELECT * FROM `Users`")
    data = cursor.fetchall()
    return render_template('adminusers.html', data=data)

@app.route('/admins/plants')
def adminsplants():
    cursor.execute("SELECT * FROM `Plants`")
    data = cursor.fetchall()
    return render_template('adminplants.html', data=data)

@app.route('/admins/care')
def adminscare():
    cursor.execute("SELECT * FROM `Care`")
    data = cursor.fetchall()
    return render_template('admincare.html', data=data)

@app.route('/admins/guides')
def adminsguides():
    cursor.execute("SELECT * FROM `Guides`")
    data = cursor.fetchall()
    return render_template('adminguides.html', data=data)

@app.route('/admins/experts')
def adminsexperts():
    cursor.execute("SELECT * FROM `Experts`")
    data = cursor.fetchall()
    return render_template('adminexperts.html', data=data)

@app.route('/admins/plantsowned')
def adminspo():
    cursor.execute("SELECT * FROM `PlantsOwned`")
    data = cursor.fetchall()
    return render_template('adminpo.html', data=data)

@app.route('/admins/userexperts')
def adminsue():
    cursor.execute("SELECT * FROM `UserExpert`")
    data = cursor.fetchall()
    return render_template('adminue.html', data=data)

# Listener

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 7777))
    app.run(port=port, debug=True)
