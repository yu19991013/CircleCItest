FROM python:3.6.1-alpine
RUN python3 -m venv venv. venv/bin/activate
RUN pip install -r requirements.txt