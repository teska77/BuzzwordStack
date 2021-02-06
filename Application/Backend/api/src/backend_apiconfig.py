import os
DEBUG = True
SQLALCHEMY_DATABASE_URI = str(os.getenv('DB_URI'))
print('my name is ' + os.getenv('DB_URI'))
SQLALCHEMY_TRACK_MODIFICATIONS = True
DATABASE_CONNECT_OPTIONS = {}
THREADS_PER_PAGE = 2
