FROM python:3.6-alpine

RUN /usr/local/bin/python -m pip install --upgrade pip
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
RUN pip install -r requirements.txt
ADD . /app/

ENTRYPOINT [ "python" ]
CMD ["xkp-dash-app.py"]
