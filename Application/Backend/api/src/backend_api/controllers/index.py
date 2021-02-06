from backend_api import app, db
from flask import render_template

@app.route('/')
def index():
    return "Hi"

@app.route('/config/init/')
def init_database():
    print("Creating tables")
    db.drop_all()
    db.create_all()
    db.session.commit()
    return 'Init complete'
