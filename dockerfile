
FROM python:3.8-slim


ENV PYSPARK_PYTHON=python3
ENV PYSPARK_DRIVER_PYTHON=python3


RUN apt-get update \
    && apt-get install -y default-jre \
    && rm -rf /var/lib/apt/lists/*


RUN pip install streamlit pyspark

WORKDIR /app

COPY app.py /
COPY crime_classification.py /

CMD ["streamlit", "run", "--server.enableCORS", "false", "app.py"]
