from flask import Blueprint , request
from Services.user_services import *
router = Blueprint('router', __name__)


@router.route('/')
def home():
	return 'Server is Running :)'

@router.route('/Login',methods=['POST'])
def perform_login():
    email = request.form["email"]
    password = request.form["password"]
    res = login_fucntion(email,password)
    print(f'respone: {res}')
    # print(email,password)
    if(res):
        return "Login Successful for "+ email
    else:
        return "Login Failed for "+ email

@router.route("/SignUp",methods=['POST'])
def perform_registration():
    email = request.form["email"]
    password = request.form["password"]
    name = request.form["name"]
    phone = request.form["phone"]
    age = request.form["age"]
    # res = registration_fucntion(name,email,password,age,phone)
    # print(f'respone: {res}')
    print(email,password,name)
    return "Registration Done"

@router.route("/Symptom-Form",methods=['POST'])
def perform_prediction():
    symptoms = request.form
    print(symptoms)
    disease = predict_disease(symptoms)
    return "Symptoms collected. Disease: "+ disease

@router.route("/Medical-History",methods=['GET'])
def get_medical_history():
    email = 'mohamed12@gmail.com'
    view_medical_history(email)
    return "this is your medical history"

@router.route("/Appointments-list",methods=['GET'])
def get_appointments():
    email = 'andreas12@gmail.com'
    view_appointments(email)
    return "this is your appointment details"

@router.route("/Appointments-booking",methods=['POST'])
def book_appointment():
    email = 'andreas12@gmail.com'
    doctor_name = 'Dr. Mohamed Ahmed'
    time = '15:00:00'
    date = '2023-04-30'
    schedule_appointment(email,doctor_name,time,date)
    return "this is your appointment details"

