FROM python:3.6.1-alpine
RUN apk add --no-cache gcc
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
#RUN python -m pip install --only-binary=:all: -r requirements.txt

RUN pip install wheel
RUN pip install --use-wheel --no-index --find-links=https://files.pythonhosted.org/packages/3a/7f/52adb1a253579749064d705f0b0db40adedc565b72eb22b68f1347db93cb/Brotli-1.0.9-cp27-cp27m-manylinux1_x86_64.whl
RUN pip install --no-cache-dir -r requirements.txt

ADD . /app/

ENTRYPOINT [ "python" ]
CMD ["xkp-dash-app.py"]
