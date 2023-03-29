from flask import Blueprint , request
router = Blueprint('router', __name__)


@router.route('/')
def home():
	return 'Server is Running :)'

@router.route('/Login',methods=['POST'])
def perform_login():
    email = request.form["email"]
    password = request.form["password"]
    print(email,password)
    return "Login Successful for "+ email

@router.route("/SignUp",methods=['POST'])
def perform_registration():
    email = request.form["email"]
    password = request.form["password"]
    name = request.form["name"]
    phone = request.form["phone"]
    age = request.form["age"]
    print(email,password,name)
    return "Registration Done"

