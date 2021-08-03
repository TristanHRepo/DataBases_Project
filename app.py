from flask import Flask, render_template, redirect, request
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


def database_query(query, args=None):
    """Queries the database for the specified query and returns raw data sent from database."""
    conn = mysql.connect()
    cursor = conn.cursor()
    if args is None:
        cursor.execute(query)
    else:
        cursor.execute(query, args)
    conn.commit()
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


@app.route('/admins/users', methods=['GET', 'POST'])
@app.route('/admins/users/update_user', methods=['GET', 'POST'])
def adminsusers():
    if request.method == 'POST':

        # POST to get the current information for placeholders in form
        if request.form['function'] == 'edit':
            id = request.form['id']
            select_query = f"SELECT * FROM `Users` WHERE userID='{id}'"
            select_data = database_query(select_query)
            return render_template('admUsersUpdate.html', data=select_data)

        # POST to send UPDATE query to DB
        elif request.form['function'] == 'update':
            id = request.form['id']
            first = request.form['first']
            last = request.form['last']
            email = request.form['email']
            location = request.form['location'] or None
            pic = request.form['picture'] or None

            update_query = "UPDATE `Users` SET first = %s, last = %s, email = %s, location = %s, picture = %s " \
                           "WHERE userID = %s"
            args = (first, last, email, location, pic, id)
            database_query(update_query, args)

            return redirect('/admins/users')

        # POST to DELETE a row
        elif request.form['function'] == 'delete':
            id = request.form['id']
            delete_query = f"DELETE FROM `Users` WHERE userID = '{id}'"
            database_query(delete_query)
            return redirect('/admins/users')

    # Default GET table to be displayed
    query = "SELECT * FROM `Users`"
    data = database_query(query)
    return render_template('adminusers.html', data=data)


@app.route('/admins/plants', methods=['GET', 'POST'])
@app.route('/admins/plants/update_plant', methods=['GET', 'POST'])
def adminsplants():
    if request.method == 'POST':

        # POST to get the current information for placeholders in form
        if request.form['function'] == 'edit':
            id = request.form['id']
            select_query = f"SELECT * FROM `Plants` WHERE plantID='{id}'"
            select_data = database_query(select_query)
            return render_template('admPlantsUpdate.html', data=select_data)

        # POST to send UPDATE query to DB
        elif request.form['function'] == 'update':
            id = request.form['id']
            comId = request.form['commonName']
            sciId = request.form['scienceName'] or None
            type = request.form['type'] or None
            color = request.form['color'] or None
            vari = request.form['variegated']
            pets = request.form['petSafe']
            size = request.form['maxSize'] or None
            pic = request.form['picture'] or None
            careId = request.form['careID'] or None

            update_query = "UPDATE `Plants` SET commonName = %s, scienceName = %s, type = %s, color = %s, " \
                           "variegated = %s, petSafe = %s, maxSize = %s,  picture = %s, careID = %s  " \
                           "WHERE plantID = %s"
            args = (comId, sciId, type, color, vari, pets, size, pic, careId, id)
            database_query(update_query, args)

            return redirect('/admins/plants')

        # POST to DELETE a row
        elif request.form['function'] == 'delete':
            id = request.form['id']
            delete_query = f"DELETE FROM `Plants` WHERE plantID = '{id}'"
            database_query(delete_query)
            return redirect('/admins/plants')

    # Default GET table to be displayed
    query = "SELECT * FROM `Plants`"
    data = database_query(query)
    return render_template('adminplants.html', data=data)


@app.route('/admins/care', methods=['GET', 'POST'])
@app.route('/admins/care/update_care', methods=['GET', 'POST'])
def adminscare():
    if request.method == 'POST':

        # POST to get the current information for placeholders in form
        if request.form['function'] == 'edit':
            id = request.form['id']
            select_query = f"SELECT * FROM `Care` WHERE careID='{id}'"
            select_data = database_query(select_query)
            return render_template('admCareUpdate.html', data=select_data)

        # POST to send UPDATE query to DB
        elif request.form['function'] == 'update':
            id = request.form['id']
            water = request.form['water']
            light = request.form['light']
            temp = request.form['temp']
            humidity = request.form['humidity']
            fert = request.form['fert']
            soil = request.form['soil']

            update_query = f"UPDATE `Care` SET water = %s, light = CAST(%s AS time), temperature = CAST(%s AS int), " \
                           f"humidity = %s, fertilizer = %s, soil = %s WHERE careID = %s"
            args = (water, light, temp, humidity, fert, soil, id)
            database_query(update_query, args)
            return redirect('/admins/care')

        # POST to DELETE a row
        elif request.form['function'] == 'delete':
            id = request.form['id']
            delete_query = f"DELETE FROM `Care` WHERE careID = '{id}'"
            database_query(delete_query)
            return redirect('/admins/care')

    # Default GET table to be displayed
    query = "SELECT * FROM `Care`"
    data = database_query(query)
    return render_template('admincare.html', data=data)

@app.route('/admins/guides', methods=['GET', 'POST'])
@app.route('/admins/guides/update_guide', methods=['GET', 'POST'])
def adminsguides():
    if request.method == 'POST':

        # POST to get the current information for placeholders in form
        if request.form['function'] == 'edit':
            id = request.form['id']
            select_query = f"SELECT * FROM `Guides` WHERE guideID='{id}'"
            select_data = database_query(select_query)
            return render_template('admGuidesUpdate.html', data=select_data)

        # POST to send UPDATE query to DB
        elif request.form['function'] == 'update':
            id = request.form['id']
            title = request.form['title']
            video = request.form['video'] or None
            desc = request.form['desc']
            plantid = request.form['plantid'] or None
            userid = request.form['userid']


            update_query = f"UPDATE `Guides` SET title = %s, video = %s, description = %s, plantid = CAST(%s AS int), " \
                           f"userid = CAST(%s AS int) WHERE guideID = %s"
            args = (title, video, desc, plantid, userid, id)
            database_query(update_query, args)
            return redirect('/admins/guides')

        # POST to DELETE a row
        elif request.form['function'] == 'delete':
            id = request.form['id']
            delete_query = f"DELETE FROM `Guides` WHERE guideID = '{id}'"
            database_query(delete_query)
            return redirect('/admins/guides')

    # Default GET table to be displayed
    query = "SELECT * FROM `Guides`"
    data = database_query(query)
    return render_template('adminguides.html', data=data)


@app.route('/admins/experts', methods=['GET', 'POST'])
@app.route('/admins/experts/update_expert', methods=['GET', 'POST'])
def adminsexperts():
    if request.method == 'POST':

        # POST to get the current information for placeholders in form
        if request.form['function'] == 'edit':
            id = request.form['id']
            select_query = f"SELECT * FROM `Experts` WHERE expertID='{id}'"
            select_data = database_query(select_query)
            return render_template('admExpertsUpdate.html', data=select_data)

        # POST to send UPDATE query to DB
        elif request.form['function'] == 'update':
            id = request.form['id']
            name = request.form['name'] or None
            desc = request.form['description'] or None

            update_query = "UPDATE `Experts` SET tagName = %s, tagDescription = %s WHERE expertID = %s"
            args = (name, desc, id)
            database_query(update_query, args)

            return redirect('/admins/experts')

            # POST to DELETE a row
        elif request.form['function'] == 'delete':
            id = request.form['id']
            delete_query = f"DELETE FROM `Experts` WHERE expertID = '{id}'"
            database_query(delete_query)
            return redirect('/admins/experts')

    # Default GET table to be displayed
    query = "SELECT * FROM `Experts`"
    data = database_query(query)
    return render_template('adminexperts.html', data=data)


@app.route('/admins/plantsowned', methods=['GET', 'POST'])
# @app.route('/admins/plantsowned/update_po', methods=['GET', 'POST'])
def adminspo():
    # if request.method == 'POST':
    #
    #     # POST to get the current information for placeholders in form
    #     if request.form['function'] == 'edit':
    #         id = request.form['id']
    #         select_query = f"SELECT * FROM `Experts` WHERE expertID='{id}'"
    #         select_data = database_query(select_query)
    #         return render_template('admExpertsUpdate.html', data=select_data)
    #
    #     # POST to send UPDATE query to DB
    #     elif request.form['function'] == 'update':
    #         id = request.form['id']
    #         name = request.form['name'] or None
    #         desc = request.form['description'] or None
    #
    #         update_query = "UPDATE `Experts` SET tagName = %s, tagDescription = %s WHERE expertID = %s"
    #         args = (name, desc, id)
    #         database_query(update_query, args)
    #
    #         return redirect('/admins/experts')
    #
    #     # POST to DELETE a row
    #     elif request.form['function'] == 'delete':
    #         id = request.form['id']
    #         delete_query = f"DELETE FROM `Experts` WHERE expertID = '{id}'"
    #         database_query(delete_query)
    #         return redirect('/admins/experts')
    #
    # # Default GET table to be displayed
    query = "SELECT * FROM `PlantsOwned`"
    data = database_query(query)
    return render_template('adminpo.html', data=data)


@app.route('/admins/userexperts', methods=['GET', 'POST'])
# @app.route('/admins/userexperts/update_ue', methods=['GET', 'POST'])
def adminsue():
    # if request.method == 'POST':
    #
    #     # POST to get the current information for placeholders in form
    #     if request.form['function'] == 'edit':
    #         id = request.form['id']
    #         select_query = f"SELECT * FROM `Experts` WHERE expertID='{id}'"
    #         select_data = database_query(select_query)
    #         return render_template('admExpertsUpdate.html', data=select_data)
    #
    #     # POST to send UPDATE query to DB
    #     elif request.form['function'] == 'update':
    #         id = request.form['id']
    #         name = request.form['name'] or None
    #         desc = request.form['description'] or None
    #
    #         update_query = "UPDATE `Experts` SET tagName = %s, tagDescription = %s WHERE expertID = %s"
    #         args = (name, desc, id)
    #         database_query(update_query, args)
    #
    #         return redirect('/admins/experts')
    #
    #         # POST to DELETE a row
    #     elif request.form['function'] == 'delete':
    #         id = request.form['id']
    #         delete_query = f"DELETE FROM `Experts` WHERE expertID = '{id}'"
    #         database_query(delete_query)
    #         return redirect('/admins/experts')
    #
    # # Default GET table to be displayed
    query = "SELECT * FROM `UserExpert`"
    data = database_query(query)
    return render_template('adminue.html', data=data)


if __name__ == "__main__":
    port = int(os.environ.get('PORT', 7777))
    app.run(port=port, debug=True)
