FROM registry.access.redhat.com/ubi9/ubi-minimal:latest

WORKDIR /app

COPY . /app

RUN microdnf update -y && \ 
    microdnf install python -y && \
    python3.9 -m ensurepip && \
    python3.9 -m pip install --upgrade pip

RUN python --version

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8080

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]