from backend_api import app, db
from flask import render_template
from flask import jsonify
from backend_api.models.countmodel import CountModel

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

@app.route('/count')
def count():
    db.session.add(CountModel())
    db.session.commit()
    return jsonify({
        "count":len(CountModel.query.all())
    })