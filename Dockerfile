FROM python:latest
WORKDIR /usr/app/src
COPY src/initial_python_server.py ./

CMD [ "python", "./initial_python_server.py"]