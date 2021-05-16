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
    parser.add_argument('username',
                        type=str,
                        required=True,
                        help='Username field cannot be left blank.')
    parser.add_argument('phone_number',
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
    parser.add_argument('first_name',
                        type=str,
                        required=True,
                        help='First Name field cannot be left blank.')
    parser.add_argument('last_name',
                        type=str,
                        required=True,
                        help='Last Name field cannot be left blank.')
    parser.add_argument('university',
                        type=str,
                        required=True,
                        help='University field cannot be left blank.')
    parser.add_argument('gender',
                        type=str,
                        required=True,
                        help='Gender field cannot be left blank.')
    parser.add_argument('date_of_birth',
                        type=str,
                        required=True,
                        help='Birth Date field cannot be left blank.')
    # create other required fields

    def get(self, username):
        return firebase_functions.get_user_by_username(username)

    def post(self, username):
        # check whether the provided user already exists
        data = User.parser.parse_args()   # the data that frontend sends
        return firebase_functions.signup_customer(data)


class Authenticate(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('phone_number',
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
    parser.add_argument('first_name',
                        type=str,
                        required=False,
                        help='First Name field cannot be left blank.')
    parser.add_argument('last_name',
                        type=str,
                        required=False,
                        help='Last Name field cannot be left blank.')
    parser.add_argument('university',
                        type=str,
                        required=False,
                        help='University field cannot be left blank.')
    parser.add_argument('gender',
                        type=str,
                        required=False,
                        help='Gender field cannot be left blank.')
    parser.add_argument('date_of_birth',
                        type=str,
                        required=False,
                        help='Birth Date field cannot be left blank.')

    def post(self):
        # check whether the provided user is in firebase, if not break
        data = Authenticate.parser.parse_args()  # the data that frontend sends
        em = data['email']
        em = em.replace('%40', '@')
        pwd = data['password']
        return firebase_functions.login(em, pwd)


class Cafe(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('company_name',
                        type=str,
                        required=True,
                        help='Company Name field cannot be left blank.')
    parser.add_argument('email',
                        type=str,
                        required=True,
                        help='Email field cannot be left blank.')
    parser.add_argument('password',
                        type=str,
                        required=True,
                        help='Password field cannot be left blank.')
    parser.add_argument('phone_number',
                        type=str,
                        required=True,
                        help='Phone Number field cannot be left blank.')
    parser.add_argument('location_info',
                        type=str,
                        required=True,
                        help='Location Information field cannot be left blank.')
    parser.add_argument('university',
                        type=str,
                        required=True,
                        help='University Information field cannot be left blank.')

    def post(self, university):
        data = Cafe.parser.parse_args()
        return firebase_functions.signup_service(data)

    def get(self, university):
        return firebase_functions.get_all_services(university)


class getCafe(Resource):
    def get(self, companyname):
        return firebase_functions.get_cafe_by_company(companyname)


class MenuAdd(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('product_name',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('price',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('product_description',
                        type=str,
                        required=True,
                        help='Product Description field cannot be left blank.')
    parser.add_argument('product_id',
                        type=str,
                        required=True,
                        help='Phone Number field cannot be left blank.')

    def post(self, companyname):
        data = MenuAdd.parser.parse_args()
        # firebase function for new product
        return firebase_functions.add_to_menu(data, companyname)

    def get(self, companyname):
        return firebase_functions.get_menu(companyname)


class MenuDrop(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('product_name',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    def post(self, companyname):
        data = MenuDrop.parser.parse_args()
        return firebase_functions.remove_from_menu(data['product_name'], companyname)

    def get(self, companyname):
        return firebase_functions.get_menu(companyname)


class Basket(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('product_name',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('price',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('product_description',
                        type=str,
                        required=True,
                        help='Product Description field cannot be left blank.')
    parser.add_argument('product_id',
                        type=str,
                        required=True,
                        help='Product ID field cannot be left blank.')
    parser.add_argument('additional_notes',
                        type=str,
                        required=False)

    def post(self, username):
        data = Basket.parser.parse_args()
        return firebase_functions.add_to_basket(data, username)

    def get(self, username):
        return firebase_functions.get_basket(username)


class BasketDrop(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('product_name',
                        type=str,
                        required=True,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('price',
                        type=str,
                        required=False,
                        help='Product Name field cannot be left blank.')
    parser.add_argument('product_description',
                        type=str,
                        required=False,
                        help='Product Description field cannot be left blank.')
    parser.add_argument('product_id',
                        type=str,
                        required=False,
                        help='Phone Number field cannot be left blank.')
    parser.add_argument('additional_notes',
                        type=str,
                        required=False)

    def get(self, username):
        return firebase_functions.get_basket(username)

    def post(self, username):
        data = BasketDrop.parser.parse_args()
        return firebase_functions.drop_from_basket(data['product_name'], username)


class BasketEmpty(Resource):

    def get(self, username):
        return firebase_functions.empty_basket(username)

    def post(self, username):
        return firebase_functions.empty_basket(username)


class BasketTotal(Resource):
    def get(self, username):
        return firebase_functions.calculate_total(username)


class TimeSlots(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('company_name',
                        type=str,
                        required=True,
                        help='Company Name field can not be left blank for setting up the time slots.')
    parser.add_argument('opening_hour',
                        type=int,
                        required=True,
                        help='Opening Hour field can not be left blank for setting up the time slots.')
    parser.add_argument('closing_hour',
                        type=int,
                        required=True,
                        help='Closing Hour field can not be left blank for setting up the time slots.')
    parser.add_argument('limit',
                        type=str,
                        required=True,
                        help='Limit field can not be left blank for setting up the time slots.')

    def post(self, companyname):
        data = TimeSlots.parser.parse_args()
        return firebase_functions.define_timeslots(data['company_name'], data['opening_hour'],
                                                   data['closing_hour'], data['limit'])

    def get(self, companyname):
# get all time slots for a given cafe
        pass


class OrderEvent(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('username',
                        type=str,
                        required=True,
                        help='Username field can not be left blank for an order event.')
    parser.add_argument('timeslot',
                        type=str,
                        required=True,
                        help='Timeslot field can not be left blank for an order event.')

    def post(self, companyname):
        data = OrderEvent.parser.parse_args()
        return firebase_functions.add_to_active_orders(companyname, data['username'], data['timeslot'])

    def get(self, companyname):
        return firebase_functions.get_active_orders_cafe(companyname)


class OrderReady(Resource):
    parser = reqparse.RequestParser()
    parser.add_argument('company_name',
                        type=str,
                        required=True,
                        help='Company Name field can not be left blank for an order event.')

    def post(self, username):
        data = OrderReady.parser.parse_args()
        return firebase_functions.order_ready(data['company_name'], username)

    def get(self, username):
        return firebase_functions.get_order_history(username)

api.add_resource(User, '/user/<string:username>')
api.add_resource(getCafe, '/getcafe/<string:companyname>')
api.add_resource(Authenticate, '/authenticate')
api.add_resource(Cafe, '/cafe/<string:university>')
api.add_resource(MenuAdd, '/menu/<string:companyname>')
api.add_resource(MenuDrop, '/remmenu/<string:companyname>')
api.add_resource(BasketDrop, '/rembasket/<string:username>')
api.add_resource(Basket, '/basket/<string:username>')
api.add_resource(BasketEmpty, '/empbasket/<string:username>')
api.add_resource(BasketTotal, '/totbasket/<string:username>')
api.add_resource(TimeSlots, '/timeslots/<string:companyname>')
api.add_resource(OrderEvent, '/orderevent/<string:companyname>')
api.add_resource(OrderReady, '/orderready/<string:username>')

