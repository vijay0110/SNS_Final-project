FROM python:3.10
WORKDIR /app

RUN pip install pymodbus

COPY modbus_server.py modbus_server.py

CMD ["python","modbus_server.py"]
