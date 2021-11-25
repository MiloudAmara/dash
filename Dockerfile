FROM python:3.6.1-alpine
RUN apk add build-base
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
#RUN python -m pip install --only-binary=:all: -r requirements.txt
RUN pip install -r requirements.txt
ADD . /app/

ENTRYPOINT [ "python" ]
CMD ["xkp-dash-app.py"]
