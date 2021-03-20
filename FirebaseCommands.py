import pyrebase

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

json = {"phoneNumber": 11112222333,
        "password": "123456",
        "firstName": "NAME",
        "university": "Koc",
        "gender": "female",
        "dateOfBirth": -73191600,
        "email": "dummy@ku.edu.tr",
        "type": "student",
        "lastName": "SURNAME"}

json2 = {"email":"depari@deparis.com",
         "password":"98765",
         "type":"cafeteria",
         "name":"DeParis",
         "university":"Koc",
         "phoneNumber":44445555666}

json3 = {"name": "Filter Coffee",
         "price": 8.0,
         "notes": "Soy-Milk"}

def add_to_menu(json, id):
    db.child('Users').child('Services').child(id).child('Menu').set(json)

def add_to_basket(json, id):
    db.child('Users').child('Customers').child(id).child('Basket').push(json)

def empty_basket(id): #call after empty_basket/payment_complete/new_provider
    db.child('Users').child('Customers').child(id).child('Basket').remove()

def signup_service(json_info): 
    email = json_info['email']
    password = json_info['password']
    type = json_info['type']
    name = json_info['name']
    university = json_info['university']
    phoneNumber = json_info['phoneNumber']

    data = {'email': email, 'password': password, 'type': type, 'name': name,
            'university': university, 'phone number': phoneNumber}

    try:
        auth.create_user_with_email_and_password(email, password)
        #create(data)
        print('success')
    except:
        print('User already exists!')

def signup(json_info):  # for Students/Staff
    email = json_info['email']
    password = json_info['password']
    firstName = json_info['firstName']
    lastName = json_info['lastName']
    university = json_info['university']
    gender = json_info['gender']
    dateOfBirth = json_info['dateOfBirth']
    phoneNumber = json_info['phoneNumber']
    type = json_info['type']

    data = {'email': email, 'password': password, 'first name': firstName, 'last name': lastName,
            'university': university, 'date of birth': dateOfBirth, 'phone number': phoneNumber, 'type': type}

    try:
        auth.create_user_with_email_and_password(email, password)
        create(data)
        print('success')
    except:
        print('User already exists!')




def login(email, password):
    try:
        auth.sign_in_with_email_and_password(email, password)
        print('success')
    except:
        print('Invalid mail or password.')


def create(data):
    if data['type'] == 'student' or data['type'] == 'staff':
        db.child('Users').child('Customers').child(data['email'][:-10]).set(data) #!!!for ku mail!!!
    else:
        db.child('Users').child('Services').child(data['name']).set(data)


def update(email, title, newval):
    id = email[:-10]
    db.child('Users').child('Customers').child(id).update({title: newval})


def delete_user(email):
    id = email[:-10]
    db.child('Users').child('Customers').child(id).remove()


def get_user_by_mail(mail):
    id = mail[:-10]
    people = db.child('Users').child('Customers').get()
    for p in people.each():
        if p.key() == id:
            return p.val()


def get_all_customers(type):
    dict1 = dict()
    if type == 'customers':
        people = db.child('Users').child('Customers').get()
        for p in people.each():
            dict1[p.key()] = p.val()
        return dict1
    elif type == 'services':
        services = db.child('Users').child('Services').get()
        for cafe in services.each():
            dict1[cafe.key()] = cafe.val()
        return dict1

#############TESTS######################
# signup(json)
# login('dummy@ku.edu.tr','123456')
# update('dummy@ku.edu.tr', 'first name', 'Ege')
# update('dummy@ku.edu.tr', 'last name', 'Yelken')
# print(get_user_by_mail('dummy@ku.edu.tr'))
# print(get_all_customers('customers'))
# signup_service(json2)
# add_to_menu(json3, "MW5WYa4J6-2M4WQxNEF")
# add_to_basket(json3, "aras")
# empty_basket('aras')
