from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import flask_jwt
from werkzeug.security import safe_str_cmp
from flask_jwt import JWT

app = Flask(__name__)
api = Api(app)

# Create JWT Authentication in the future


class User(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('email',
                        type=str,
                        required=True,
                        help='Email field cannot be left blank.')

    # create other required fields

    def get(self, username):
        # check whether the provided user is in firebase, if not break
        return {'message': 'API is working'}
        data = request.get_json()   # the data that frontend sends
        # send the user information
        pass    # 200 for successfully returned to get request

    def post(self, username):
        return {'message': 'API is working'}
        # check whether the provided user already exists
        data = User.parser.parse_args()   # the data that frontend sends
        # create a new user on firebase with data
        pass    # 201 for successfully created the user
        return {'message': 'User Successfully Created'}

    def delete(self, username):
        return {'message': 'API is working'}
        # check whether the provided user is in firebase, if not break
        data = request.get_json()  # the data that frontend sends
        # delete the user on firebase
        pass    # 200 for successfully deleted the user
        return {'message': 'User Successfully Deleted'}


api.add_resource(User, '/user/<string:username>')
app.run()