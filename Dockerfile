FROM python:3.8.3-alpine
ENV PYTHONUNBUFFERED 1
ARG SECRET_KEY_ARG
ARG ALLOWED_HOSTS_ARG
ENV SECRET_KEY=$SECRET_KEY_ARG
ENV ALLOWED_HOSTS=$ALLOWED_HOSTS_ARG
WORKDIR /app
ADD . ./
RUN pip install --upgrade pip
RUN apk update && apk add gcc python3-dev musl-dev
RUN pip install -r requirements.txt
EXPOSE 8000
ENTRYPOINT python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000