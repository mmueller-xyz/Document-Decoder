FROM python:alpine
WORKDIR /pdf-server
ADD ./src /pdf-server
RUN pip install -r requirements.txt
CMD ["python","server.py"]