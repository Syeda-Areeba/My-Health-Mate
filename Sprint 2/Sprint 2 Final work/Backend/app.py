from flask import Flask 
from Routes.routes import router

application = Flask(__name__)
application.register_blueprint(router)

if __name__ == '__main__':
	application.run(debug=True)