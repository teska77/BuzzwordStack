from setuptools import setup

setup(
    name='backend_api',
    packages=['backend_api',
              'backend_api.controllers',
              'backend_api.models'],
    include_package_data=True,
    install_requires=[
        'flask',
        'flask-sqlalchemy',
        'flask-marshmallow<0.12.0',
        'marshmallow-sqlalchemy',
        'marshmallow',
        'marshmallow_enum',
        'flask-cors',
        'flask_jwt',
        'psycopg2-binary',
        'pytest'
    ],
)
