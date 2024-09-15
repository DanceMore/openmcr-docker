# hard depends 3.10, 3.11 explodes
FROM python:3.10

# install opencv and tkinter
RUN apt update && apt install -y python3-opencv python3-tk

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# copy project
ADD requirements.txt .
ADD src/ .

# install deps
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3", "main.py"]
CMD []
