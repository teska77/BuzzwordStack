from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_marshmallow import Marshmallow
# from flask_cors import CORS

app = Flask(__name__, static_folder="views", template_folder="views")
app.config.from_object('backend_apiconfig')
# CORS(app)
db = SQLAlchemy(app)
ma = Marshmallow(app)

import backend_api.controllers.index