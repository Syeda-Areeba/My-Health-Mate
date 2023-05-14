from flask import Blueprint , request, render_template
from datetime import date, datetime, timedelta
from Services.user_services import *
from templates import *

router = Blueprint('router', __name__)

@router.route('/')
def home():
	# return 'Server is Running :)'
    return render_template('create-account.html')

@router.route('/login.html')
def display_login():
    return render_template('login.html')

@router.route('/create-account.html')
def display_create_account():
    return render_template('create-account.html')

@router.route('/home.html')
def display_home():
    return render_template('home.html')

@router.route('/appointments.html')
def display_appointments():
    return render_template('appointments.html')

# @router.route('/medical_history.html')
# def display_medical_history():
#     return render_template('medical_history.html')

@router.route('/Symptoms_selector_form.html')
def display_symptoms_form():
    return render_template('Symptoms_selector_form.html')

@router.route('/Login',methods=['POST'])
def perform_login():
    email = request.form["email"]
    password = request.form["password"]

    if(len(email) == 0 or len(password) == 0 ):
        return 'Null Value Provided. Login Failed'

    res = login_function(email,password)
    print(f'respone: {res}')
    
    if(res):
        with open("email.txt", "w") as f:
            f.write(email)
        return render_template('home.html')
    else:
        return "Login Failed for "+ email

@router.route("/SignUp",methods=['POST'])
def perform_registration():
    email = request.form["email"]
    password = request.form["password"]
    name = request.form["name"]
    phone = request.form["phone"]
    age = request.form["age"]

    if(len(email) == 0 or len(password) == 0 or len(name) == 0 or len(phone) == 0 or len(age) == 0):
        return 'Null Value Provided. Registration Failed.'
    
    if(len(phone)!=11) or (not phone.isdigit()):
        return 'Invalid phone number. Registration Failed.'
    
    if(int(age) < 18 or (not age.isdigit())):
        return 'Cannot register with age less than 18. Registration Failed.'

    res = registration_function(name,email,password,age,phone)

    with open(".email.txt", "w") as f:
            f.write(email)
    return render_template('home.html')

@router.route("/Symptom-Form",methods=['POST'])
def perform_prediction():
    symptoms = request.form
    print(symptoms)
    disease = predict_disease(symptoms)
    precautions = get_precautions(disease)

    return render_template('precautions.html', precautions=precautions)
    #print("Disease : ", disease)
    # p_string = ''
    # for i in range(4):
    #     print(f'{i+1}. {precautions[i].capitalize()}.',end = '\n')
    #     p_string = p_string + f'{i+1}. {precautions[i].capitalize()}.'
    # # return "Symptoms collected. Disease: "+ disease
    # return "Disease: " + disease  + p_string

@router.route("/medical_history.html",methods=['GET'])
def get_medical_history():
    # email = 'mohamed12@gmail.com'
    with open("email.txt", "r") as f:
        email = f.read()

    print(email)
    medical_history = view_medical_history(email)
    print(medical_history)
    # return "this is your medical history"
    # patient_name = 'John Doe'
#     medical_history = [
#     {'date': '2022-01-01', 'date': 'd1', 'diagnosis': 'Flu', 'treatment': 'Rest and fluids'},
#     {'date': '2021-11-15', 'doctor': 'd2', 'diagnosis': 'Broken leg', 'treatment': 'Cast'},
#     {'date': '2021-09-01', 'doctor': 'd3', 'diagnosis': 'High blood pressure', 'treatment': 'Medication'},
# ]
    # return render_template('med.html', patient_name=patient_name, medical_history=medical_history)
    return render_template('medical_history.html', medical_history=medical_history)

@router.route("/Appointments-list",methods=['GET'])
def get_appointments():
    email = 'andreas12@gmail.com'
    view_appointments(email)
    return "this is your appointment details"

@router.route("/Appointments-booking",methods=['POST'])
def book_appointment():
    date = request.form["date"]
    time = request.form["time"]
    doctor_name = request.form['doctor']
    reason = request.form['reason']

    if(len(date)== 0 or len(time) == 0 or len(doctor_name) == 0 or len(reason) == 0):
        return 'Appointment Booking Failed. NULL value provided.'

    date =  datetime.strptime(date, '%Y-%m-%d').date()
    time = time + ':00'
    time = datetime.strptime(time, '%H:%M:%S').time()

    today = date.today()
    current_time = datetime.now().time()

    if(date < today):
        return 'Invalid Appointment Date.'
    elif (date > today + timedelta(days=365)):
        return 'Invalid Appointment Date.'
    elif(date == today and time < current_time):
        return 'Invalid Appointment Time.'
    elif(len(reason) > 200):
        return 'Appointment Booking Failed. Reason Length too Long.'
    # else:
    #     print(True)

    with open("email.txt", "r") as f:
        email = f.read()
        # print(email)
    
    schedule_appointment(email,doctor_name,time,date)
    return f"Your appointment has been booked on {date} at {time} with Doctor: {doctor_name}"