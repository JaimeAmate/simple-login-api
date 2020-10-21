FROM python:3.8.3-alpine

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1

# Set working directory
WORKDIR /app

# Copy project
ADD . ./

#update pip
RUN pip install --upgrade pip

# install psycopg2 dependencies
RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT python3 manage.py makemigrations && python3 manage.py migrate && python3 manage.py runserver 0.0.0.0:8000