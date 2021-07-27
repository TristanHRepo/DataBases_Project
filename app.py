from flask import Flask, render_template, json, request
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


def database_query(query):
    """Queries the database for the specified query and returns raw data sent from database."""
    conn = mysql.connect()
    cursor = conn.cursor()
    cursor.execute(query)
    data = cursor.fetchall()
    cursor.close()
    conn.close()
    return data


@app.route('/')
def root():
    return render_template('index.html')


@app.route('/plants', methods=['GET', 'POST'])
def plants():
    if request.method == 'POST':
        if request.form['plant'] == 'all':
            query = "SELECT picture, commonName, type  FROM `Plants`"
            plant_data = database_query(query)
            return render_template('plants.html', data=plant_data)
        else:
            type = request.form['plant']
            query = f"SELECT picture, commonName, type  FROM `Plants` WHERE type='{type}'"
            plant_data = database_query(query)
            return render_template('plants.html', data=plant_data)
    else:
        query = "SELECT picture, commonName, type  FROM `Plants`"
        plant_data = database_query(query)
        return render_template('plants.html', data=plant_data)


@app.route('/care')
def care():
    return render_template('care.html')


@app.route('/guides')
def guides():
    query = "SELECT * FROM `Guides`"
    guide_data = database_query(query)
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
    query = "SELECT * FROM `Users`"
    data = database_query(query)
    return render_template('adminusers.html', data=data)


@app.route('/admins/plants')
def adminsplants():
    query = "SELECT * FROM `Plants`"
    data = database_query(query)
    return render_template('adminplants.html', data=data)


@app.route('/admins/care')
def adminscare():
    query = "SELECT * FROM `Care`"
    data = database_query(query)
    return render_template('admincare.html', data=data)


@app.route('/admins/guides')
def adminsguides():
    query = "SELECT * FROM `Guides`"
    data = database_query(query)
    return render_template('adminguides.html', data=data)


@app.route('/admins/experts')
def adminsexperts():
    query = "SELECT * FROM `Experts`"
    data = database_query(query)
    return render_template('adminexperts.html', data=data)


@app.route('/admins/plantsowned')
def adminspo():
    query = "SELECT * FROM `PlantsOwned`"
    data = database_query(query)
    return render_template('adminpo.html', data=data)


@app.route('/admins/userexperts')
def adminsue():
    query = "SELECT * FROM `UserExpert`"
    data = database_query(query)
    return render_template('adminue.html', data=data)


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 7777))
    app.run(port=port, debug=True)
