FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY services /app/services

ENV PYTHONPATH=/app

CMD ["python", "-c", "print('Platform Health service container ready')"]
