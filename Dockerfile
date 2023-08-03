FROM python:3.8-slim-buster
WORKDIR /flask-yolo

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

RUN apt update -y && apt install ffmpeg libsm6 libxext6  -y

#Gmail APIs
RUN pip3 install --upgrade google-api-python-client google-auth-httplib2 google-auth-oauthlib

COPY . .

CMD [ "python3", "-m" , "flask", "--app", "app", "run", "--host=0.0.0.0"]
