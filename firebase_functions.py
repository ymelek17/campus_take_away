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
        people = db.child('Users').child('Customers').get()
        cafes = db.child('Users').child('Services').get()
        if people.val() is not None:
            for p in people.each():
                if p.val()['email'] == email:
                    return p.val()['username']
        if cafes.val() is not None:
            for c in cafes.each():
                if c.val()['email'] == email:
                    return c.val()['company_name']
        return {'message': 'No user with ' + email}, 203
    except:
        return {'message': 'Authetication Failed'}, 403


def update(username, attribute, newval):
    db.child('Users').child('Customers').child(username).update({attribute: newval})


def update(username, attribute, newval):
    db.child('Users').child('Services').child(username).update({attribute: newval})


def delete_user(username):
    db.child('Users').child('Customers').child(username).remove()


def get_user_by_username(username):
    try:
        return db.child('Users').child('Customers').child(username).get().val()
    except:
        return {'message': username + ' no such cafe found'}


def get_cafe_by_company(company):
    try:
        return db.child('Users').child('Services').child(company).get().val()
    except:
        return {'message': company + ' no such cafe found'}


def get_all_services(university):
    dict1 = dict()
    services = db.child('Users').child('Services').get()
    count = 0
    dict1[count] = 'No Cafes found for ' + university
    if services.val() is None:
        return dict1
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
    if not check_if_cafe_exists(username):
        return {'message': username + ' no such cafe exists'}
    db.child('Users').child('Services').child(username).child('Menu').child(json['product_name']).set(json)


def get_menu(username):
    js = db.child('Users').child('Services').child(username).child('Menu').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    if js.val() is None:
        return dict1
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def remove_from_menu(name, username):
    if not check_if_cafe_exists(username):
        return {'message': username + ' no such cafe exists'}
    db.child('Users').child('Services').child(username).child('Menu').child(name).remove()


#Basket
def add_to_basket(json, username):
    if not check_if_user_exists(username):
        return {'message': username + ' no such user exists'}
    count = 0
    js = db.child('Users').child('Customers').child(username).child('Basket').get()
    if js.val() is not None:
        for j in js.each():
            count = count + 1
    db.child('Users').child('Customers').child(username).child('Basket').child(count).set(json)


def get_basket(username):
    js = db.child('Users').child('Customers').child(username).child('Basket').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    if js.val() is None:
        return dict1
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def drop_from_basket(name, username):
    js = db.child('Users').child('Customers').child(username).child('Basket').get()
    count = 0
    if js.val() is not None:
        for j in js.each():
            if j.val()['product_name'] == name:
                db.child('Users').child('Customers').child(username).child('Basket').child(count).remove()
                js = db.child('Users').child('Customers').child(username).child('Basket').get()
                if js.val() is not None:
                    new_js = list(filter(None.__ne__, js.val()))
                    db.child('Users').child('Customers').child(username).child('Basket').set(new_js)
                return {'message': name + ' successfully removed from ' + username + ' s basket.'}
            count = count + 1
        return {'message': name + ' no such item in ' + username + ' s basket.'}
    else:
        return {'message': username + ' s basket is empty.'}


def empty_basket(username): # call after empty_basket/payment_complete/new_provider
    db.child('Users').child('Customers').child(username).child('Basket').remove()


def check_if_cafe_exists(company):
    cafes = db.child('Users').child('Services').get()
    if cafes is not None:
        for cafe in cafes.each():
            if cafe.val()['company_name'] == company:
                return 1
    return 0


def check_if_user_exists(username):
    users = db.child('Users').child('Customers').get()
    if users is not None:
        for user in users.each():
            if user.val()['username'] == username:
                return 1
    return 0


def calculate_total(username):
    total = 0.0
    items = db.child('Users').child('Customers').child(username).child('Basket').get()
    if items.val() is None:
        return {'message': 'basket empty'}
    for i in items.each():
        total = total + float(i.val()['price'])
    return total


# Work Package 3: Timeslots & Tracking ##

def define_timeslots(username, opening_hour, closing_hour, limit):
    if not check_if_cafe_exists(username):
        return {'message': username + ' no such cafe exists'}
    number_of_timeslots = (closing_hour - opening_hour) * 2
    data = {}
    for i in range(number_of_timeslots):
        k = 'timeslot' + str(i+1)
        data[k] = limit

    db.child('Users').child('Services').child(username).child('Timeslots').set(data)
    db.child('Users').child('Services').child(username).child('Opening Hour').set(opening_hour)
    db.child('Users').child('Services').child(username).child('Closing Hour').set(closing_hour)


def timeslot_conversion(timeslot, company):
    optimes = db.child('Users').child('Services').child(company).child('Opening Hour').get().val()
    time = float(optimes) + 0.5*float(timeslot)
    if time%1 == 0:
        return str(int(time)) + ':00'
    else:
        return str(int(time - 0.5)) + ':30'


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
    if not check_if_user_exists(username):
        return {'message': username + ' no such user exists'}
    if not check_if_cafe_exists(company):
        return {'message': company + ' no such cafe exists'}
    ordinaryus = db.child('Users').child('Customers').child(username).child('Pending Orders').get()
    if ordinaryus.val() is not None:
        return {'message': 'Already have an active order'}
    bask = db.child('Users').child('Customers').child(username).child('Basket').get()
    if bask.val() is None:
        return {'message': username + ' s basket is empty'}
    times = db.child('Users').child('Services').child(company).child('Timeslots').get()
    timeslot1 = 'timeslot' + str(timeslot)
    if times.val() is None:
        return company + ' is not available for an order.'
    if times.val()[timeslot1] is None:
        return {'message': company + ' is not available for an order at this timeslot.', 'timeslot': timeslot}
    if times.val()[timeslot1] == 0:
        return {'message': company + ' is not available for an order at this timeslot.', 'timeslot': timeslot}
    basket_user = db.child('Users').child('Customers').child(username).child('Basket').get().val()
    basket_cafe = db.child('Users').child('Customers').child(username).child('Basket').get().val()
    count_cafe = 0
    act = db.child('Users').child('Services').child(company).child('Active Orders').get()
    if act.val() is not None:
        for o in act.each():
            count_cafe = count_cafe + 1
    basket_user.insert(0, company)
    basket_user.insert(1, timeslot_conversion(timeslot, company))
    db.child('Users').child('Customers').child(username).child('Pending Orders').set(basket_user)
    basket_cafe.insert(0, username)
    basket_cafe.insert(1, timeslot_conversion(timeslot, company))
    db.child('Users').child('Services').child(company).child('Active Orders').child(count_cafe).set(basket_cafe)
    js = db.child('Users').child('Services').child(company).child('Active Orders').get()
    new_js = list(filter(None.__ne__, js.val()))
    db.child('Users').child('Services').child(company).child('Active Orders').set(new_js)
    decrease_availabile_slot(company, timeslot)
    empty_basket(username)
    #send_new_order_notification()


def get_active_orders_cafe(company):
    if not check_if_cafe_exists(company):
        return {'message': company + ' no such user exists'}
    js = db.child('Users').child('Services').child(company).child('Active Orders').get()
    if js.val() is None:
        return {'message': company + ' has no active orders'}
    new_js = list(filter(None.__ne__, js.val()))
    db.child('Users').child('Services').child(company).child('Active Orders').set(new_js)
    return new_js


def get_active_orders_user(username):
    if not check_if_user_exists(username):
        return {'message': username + ' no such user exists'}
    js = db.child('Users').child('Customers').child(username).child('Pending Orders').get()
    dict1 = dict()
    count = 0
    dict1[count] = 'Empty'
    if js.val() is None:
        return dict1
    for j in js.each():
        dict1[count] = j.val()
        count = count + 1
    return dict1


def order_ready(company, username):
    count_cafe = 0
    count_user = 0
    count_order = 0
    found = 0
    active = db.child('Users').child('Services').child(company).child('Active Orders').get()
    userord = db.child('Users').child('Customers').child(username).child('Pending Orders').get()
    orderhistory = db.child('Users').child('Customers').child(username).child('Order History').get()
    orderhistory_cafe = db.child('Users').child('Services').child(company).child('Order History').get()
    if active.val() is None:
        return {'message': company + ' has no active orders to be completed.'}
    for order in active.each():
        if order.val()[0] == username:
            if orderhistory_cafe.val() is None:
                db.child('Users').child('Services').child(company).child('Order History').child(count_order).set(
                    order.val())
            else:
                for o in orderhistory_cafe.each():
                    count_order = count_order + 1
                db.child('Users').child('Services').child(company).child('Order History').child(count_order).set(
                    order.val())
            db.child('Users').child('Services').child(company).child('Active Orders').child(count_cafe).remove()
            js = db.child('Users').child('Services').child(company).child('Active Orders').get()
            if js.val() is not None:
                new_js = list(filter(None.__ne__, js.val()))
                db.child('Users').child('Services').child(company).child('Active Orders').set(new_js)
            found = 1
        else:
            count_cafe = count_cafe + 1
    if not found:
        return {'message': 'no order from ' + username + ' for ' + company}
    if userord.val() is None:
        return {'message': username + ' has no pending order'}
    db.child('Users').child('Customers').child(username).child('Pending Orders').remove()
    if orderhistory.val() is None:
        db.child('Users').child('Customers').child(username).child('Order History').child(count_user).set(userord.val())
    else:
        for o in orderhistory.each():
            count_user = count_user + 1
        db.child('Users').child('Customers').child(username).child('Order History').child(count_user).set(userord.val())
    return {'message': 'Order for ' + username + ' from ' + company + ' is completed. It has been moved to '
                                                                      'Order History for both the user and the company'}


def get_order_history(username):
    customers = db.child('Users').child('Customers').get()
    services = db.child('Users').child('Services').get()
    if customers.val() is None:
        if services.val() is None:
            return {'message': 'There is no registered user and service'}
    for customer in customers.each():
        if customer.val()['username'] == username:
            try:
                return customer.val()['Order History']
            except:
                return {'message': username + ' has no previous order'}
    if services.val() is None:
        return {'message': 'There is no registered user ' + username + ' also there is no registered service'}
    for service in services.each():
        if service.val()['company_name'] == username:
            try:
                return service.val()['Order History']
            except:
                return {'message': username + ' has no previous order'}
    return {'message': 'There is no user or service with ' + username}

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
