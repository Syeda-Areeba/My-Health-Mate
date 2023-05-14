from flask import Blueprint , request, render_template
from Services.user_services import *
from templates import *
from static import *

router = Blueprint('router', __name__)

@router.route('/')
def home():
	return 'Server is Running :)'
    #return render_template('create-account.html')

@router.route('/Login',methods=['POST'])
def perform_login():
    email = request.form["email"]
    password = request.form["password"]
    res = login_function(email,password)
    print(f'respone: {res}')
    # print(email,password)
    if(res):
        #return render_template('home.html')
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
    res = registration_function(name,email,password,age,phone)
    print(f'respone: {res}')
    print(email,password,name)
    return "Registration Done"

@router.route("/Symptom-Form",methods=['POST'])
def perform_prediction():
    symptoms = request.form
    print(symptoms)
    disease = predict_disease(symptoms)
    precautions = get_precautions(disease)
    #print("Disease : ", disease)
    p_string = ''
    for i in range(4):
        print(f'{i+1}. {precautions[i].capitalize()}.',end = '\n')
        p_string = p_string + f'{i+1}. {precautions[i].capitalize()}.'
    # return "Symptoms collected. Disease: "+ disease
    return "Disease: " + disease  + p_string

@router.route("/Medical-History",methods=['GET'])
def get_medical_history():
    # email = 'mohamed12@gmail.com'
    # view_medical_history(email)
    # return "this is your medical history"
    patient_name = 'John Doe'
    medical_history = [
    {'date': '2022-01-01', 'diagnosis': 'Flu', 'treatment': 'Rest and fluids'},
    {'date': '2021-11-15', 'diagnosis': 'Broken leg', 'treatment': 'Cast'},
    {'date': '2021-09-01', 'diagnosis': 'High blood pressure', 'treatment': 'Medication'},
]
    return render_template('medical_history.html', patient_name=patient_name, medical_history=medical_history)

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

