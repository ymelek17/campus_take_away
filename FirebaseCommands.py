import pyrebase
import json
import collections

firebaseConfig = {'apiKey': "AIzaSyC5gsWS4yRMLoKftc-rEhYOj9XnZeFC-1Y",
                  'authDomain': "campustakeaway-fadb9.firebaseapp.com",
                  'databaseURL': "https://campustakeaway-fadb9-default-rtdb.firebaseio.com",
                  'projectId': "campustakeaway-fadb9",
                  'storageBucket': "campustakeaway-fadb9.appspot.com",
                  'messagingSenderId': "728683767049",
                  'appId': "1:728683767049:web:2376af863327f7d2155fd8"}

firebase = pyrebase.initialize_app(firebaseConfig)
db = firebase.database()
auth = firebase.auth()
storage = firebase.storage()

## Work Package 1: Signup and Login ##

json = {"username": "aratello",
        "phone_number": 11112222333,
        "email": "arasyelken@ku.edu.tr",
        "password": "ASD123456asd",
        "first_name": "Ege",
        "last_name": "Özkan",
        "university": "Koc",
        "gender": 'female',
        "date_of_birth": "11.03.1998"}


def signup_customer(json_info):
    username = json_info['username']
    phone_number = json_info['phone_number']
    email = json_info['email']
    password = json_info['password']
    first_name = json_info['first_name']
    last_name = json_info['last_name']
    university = json_info['university']
    gender = json_info['gender']
    date_of_birth = json_info['date_of_birth']

    data = {'username': username, 'phone_number': phone_number, 'email': email, 'password': password, 'first_name': first_name,
            'last_name': last_name,'university': university, 'gender': gender, 'date_of_birth': date_of_birth}

    auth = firebase.auth()

    try:
        auth.create_user_with_email_and_password(email, password)
        create_customer(data)
        return {'message': 'User Successfully Created', 'username': username}, 201
    except:
        return {'message': 'User Creation Failed', 'username': 'FAIL'}, 401


def create_customer(data):
    db.child('Users').child('Customers').child(data['username']).set(data)


json2 = {"company_name":"DeParis",
         "email":"egeparis@deparis.com",
         "password":"9876576",
         "phone_number": "123123123",
         "location_info": "Koc University SNA-1",
         "university": "KocUniversity"}


def signup_service(json_info):
    email = json_info['email']
    password = json_info['password']
    company_name = json_info['company_name']
    location_info = json_info['location_info']
    phone_number = json_info['phone_number']
    university = json_info['university']

    data = {'email': email, 'password': password, 'company_name': company_name,
            'location_info': location_info, 'phone_number': phone_number, 'university': university}

    auth = firebase.auth()

    try:
        auth.create_user_with_email_and_password(email, password)
        create_service(data)
        return {'message': 'Cafe Successfully Created', 'Company Name': company_name}, 202
    except:
        return {'message': 'Cafe Creation Failed', 'Company Name': 'FAIL'}, 402


def create_service(data):
    db.child('Users').child('Services').child(data['company_name']).set(data)


def login(email, password):
    try:
        auth.sign_in_with_email_and_password(email, password)
        return {'message': 'Authetication Successful'}, 203
    except:
        return {'message': 'Authetication Failed'}, 403


def update(username, attribute, newval):
    db.child('Users').child('Customers').child(username).update({attribute: newval})


def update(username, attribute, newval):
    db.child('Users').child('Services').child(username).update({attribute: newval})


def delete_user(username):
    db.child('Users').child('Customers').child(username).remove()


def get_user_by_username(username):
    people = db.child('Users').child('Customers').get()
    for p in people.each():
        if p.key() == username:
            return p.val()


def get_all_services(university):
    dict1 = dict()
    services = db.child('Users').child('Services').get()
    count = 0
    dict1[count] = 'No Cafes found for ' + university
    for cafe in services.each():
        if cafe.val()['university'] == university:
            dict1[count] = cafe.val()
            count = count + 1
    return dict1


# Work Package 2: Menu and Basket ##

json3 = {"product_id": "NEROFK1",
         "name": "Filter Coffee",
         "price": 8.0,
         "product_description": "Fresh Filter Coffee",
         "additional_notes": "No-Milk"}
json4 = {"product_id": "NEROFK2",
         "name": "Filter Coffee with Milk",
         "price": 10.0,
         "product_description": "Fresh Filter Coffee with Milk",
         "additional_notes": "Soy-Milk"}


#Menu
def add_to_menu(json, username):
    db.child('Users').child('Services').child(username).child('Menu').child(json['product_name']).set(json)


def get_menu(username):
    js = db.child('Users').child('Services').child(username).child('Menu').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def remove_from_menu(name, username):
    db.child('Users').child('Services').child(username).child('Menu').child(name).remove()


#Basket
def add_to_basket(json, username):
    db.child('Users').child('Customers').child(username).child('Basket').child(json['product_name']).set(json)


def get_basket(username):
    js = db.child('Users').child('Customers').child(username).child('Basket').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def drop_from_basket(name, username):
    db.child('Users').child('Customers').child(username).child('Basket').child(name).remove()


def empty_basket(username): # call after empty_basket/payment_complete/new_provider
    db.child('Users').child('Customers').child(username).child('Basket').remove()


def calculate_total(username):
    total = 0.0
    items = db.child('Users').child('Customers').child(username).child('Basket').get()
    for i in items.each():
        total = total + i.val()['price']
    return total


# Work Package 3: Timeslots & Tracking ##

def define_timeslots(username, opening_hour, closing_hour, limit):
    number_of_timeslots = (closing_hour - opening_hour) * 2
    data = {}
    for i in range(number_of_timeslots):
        k = 'timeslot' + str(i+1)
        data[k] = limit

    db.child('Users').child('Services').child(username).child('Timeslots').set(data)


def decrease_availabile_slot(username, index):
    remaining = 0
    timeslots = db.child('Users').child('Services').child(username).child('Timeslots').get()

    for t in timeslots.each():
        if t.key() == "timeslot" + str(index):
            remaining = int(t.val())
    newval = remaining - 1

    if newval >= 0:
      db.child('Users').child('Services').child(username).child('Timeslots').update({"timeslot" + str(index): newval})


def add_to_active_orders(company, username, timeslot):
    basket = db.child('Users').child('Customers').child(username).child('Basket').get().val()
    db.child('Users').child('Services').child(company).child('Active Orders').child(username).set(basket)
    db.child('Users').child('Customers').child(username).child('Pending Orders').child(company).set(basket)
    decrease_availabile_slot(company, timeslot)
    empty_basket(username)
    #send_new_order_notification()


def get_active_orders_cafe(company):
    js = db.child('Users').child('Services').child(company).child('Active Orders').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def get_active_orders_user(username):
    js = db.child('Users').child('Customers').child(username).child('Pending Orders').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def order_ready(company, username):
    order = get_active_orders_user(username)
    db.child('Users').child('Services').child(company).child('Active Orders').child(username).remove()
    db.child('Users').child('Customers').child(username).child('Pending Orders').child(company).remove()
    db.child('Users').child('Customers').child(username).child('Order History').child(company).set(order)
    return order
    #send_ready_notification()


############# TESTS #############
#signup_customer(json)
# login('dummy@ku.edu.tr','123456')
# update('dummy@ku.edu.tr', 'first name', 'Ege')
# update('dummy@ku.edu.tr', 'last name', 'Yelken')
#print(get_user_by_username('aratello'))
#print(get_all_services('Koc University'))
#signup_service(json2)
#add_to_menu(json3, "DeParis")
#remove_from_menu('Filter Coffee', 'DeParis')
#add_to_basket(json4, "aratello")
#drop_from_basket('Filter Coffee', 'aratello')
#empty_basket('aras')
#print(calculate_total('aratello'))
#print(get_basket('aratello'))
#print(get_menu('DeParis'))
#define_timeslots("DeParis", 8, 17, 5)
#decrease_availabile_slot("DeParis", 9)
#add_to_active_orders('DeParis', 'aratello', 5)
#order_ready('DeParis', 'aratello')
#print(get_active_orders('DeParis'))
