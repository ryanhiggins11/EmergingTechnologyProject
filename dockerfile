 #Link to website https://runnable.com/docker/python/dockerize-your-flask-application

# flask_web/app.py

From flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world:
    return 'Hey, we have Flask in a Docker container!'


if __name == '__main__':
    app.run(debug=True, host='0.0.0.0')
    
# Flask Dockerfile 
FROM ubuntu:16.04

MAINTANER Your Name "youremail@domain.tld"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
