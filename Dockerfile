FROM python:3.9.16

# Working Directory
WORKDIR /app

# Copy source code to working directory
COPY . app.py /app/

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install  --upgrade pip &&\
    pip install   -r requirements.txt

EXPOSE 8090

# Setting the environment variable for flask app
ENV FLASK_APP = app.py

# Command for running flask app
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0"]

