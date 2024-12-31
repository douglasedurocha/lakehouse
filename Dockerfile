FROM apache/airflow:slim-2.10.0-python3.8

USER root

RUN apt-get update \
  && apt-get install -y python3-pip \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

USER airflow

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["bash", "entrypoint.sh"]