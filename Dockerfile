FROM python:3.10-slim
WORKDIR /hello 

COPY hello.py

CMD ["python","hello.py"]
