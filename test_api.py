from flask import Flask, request
from flask_restful import Resource, Api, reqparse
import flask_jwt
from werkzeug.security import safe_str_cmp
from flask_jwt import JWT
import pyrebase
import string
import firebase_functions

app = Flask(__name__)
api = Api(app)

# Create JWT Authentication in the future


class User(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('phoneNumber',
                        type=str,
                        required=True,
                        help='Phone Number field cannot be left blank.')
    parser.add_argument('email',
                        type=str,
                        required=True,
                        help='Email field cannot be left blank.')
    parser.add_argument('password',
                        type=str,
                        required=True,
                        help='Password field cannot be left blank.')
    parser.add_argument('firstName',
                        type=str,
                        required=True,
                        help='First Name field cannot be left blank.')
    parser.add_argument('university',
                        type=str,
                        required=True,
                        help='University field cannot be left blank.')
    parser.add_argument('gender',
                        type=str,
                        required=True,
                        help='Gender field cannot be left blank.')
    parser.add_argument('dateOfBirth',
                        type=str,
                        required=True,
                        help='Birth Date field cannot be left blank.')
    parser.add_argument('type',
                        type=str,
                        required=True,
                        help='Type field cannot be left blank.')
    parser.add_argument('lastName',
                        type=str,
                        required=True,
                        help='Last Name field cannot be left blank.')
    # create other required fields

    def get(self, username):
        # check whether the provided user is in firebase, if not break
        data = request.get_json()   # the data that frontend sends
        # get the user with the provided field
        pass

    def post(self, username):
        # check whether the provided user already exists
        data = User.parser.parse_args()   # the data that frontend sends
        return firebase_functions.signup(data)

    def delete(self, username):
        return {'message': 'DELETE not implemented yet'}
        # check whether the provided user is in firebase, if not break
        data = request.get_json()  # the data that frontend sends
        # delete the user on firebase
        pass    # 200 for successfully deleted the user
        return {'message': 'User Successfully Deleted'}


class Authenticate(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('phoneNumber',
                        type=str,
                        required=False,
                        help='Phone Number field cannot be left blank.')
    parser.add_argument('email',
                        type=str,
                        required=True,
                        help='Email field cannot be left blank.')
    parser.add_argument('password',
                        type=str,
                        required=True,
                        help='Password field cannot be left blank.')
    parser.add_argument('firstName',
                        type=str,
                        required=False,
                        help='First Name field cannot be left blank.')
    parser.add_argument('university',
                        type=str,
                        required=False,
                        help='University field cannot be left blank.')
    parser.add_argument('gender',
                        type=str,
                        required=False,
                        help='Gender field cannot be left blank.')
    parser.add_argument('dateOfBirth',
                        type=str,
                        required=False,
                        help='Birth Date field cannot be left blank.')
    parser.add_argument('type',
                        type=str,
                        required=False,
                        help='Type field cannot be left blank.')
    parser.add_argument('lastName',
                        type=str,
                        required=False,
                        help='Last Name field cannot be left blank.')

    def post(self, username):
        # check whether the provided user is in firebase, if not break
        data = request.get_json()   # the data that frontend sends
        em = data['email']
        em = em.replace('%40', '@')
        pwd = data['password']
        return firebase_functions.login(em, pwd)



api.add_resource(User, '/user/<string:username>')
api.add_resource(Authenticate, '/authenticate/<string:username>')
