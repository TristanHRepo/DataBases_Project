from flask import Flask, render_template, json, url_for
import os

app = Flask(__name__)


# Routes

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
    return render_template('guides.html')

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