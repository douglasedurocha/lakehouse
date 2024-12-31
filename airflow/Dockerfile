# Customiza a partir da imagem padrão do airflow 
FROM apache/airflow:slim-2.10.0-python3.8

USER root

# atualiza o gerenciador de pacotes do container e instala o pip
RUN apt-get update \
  && apt-get install -y python3-pip \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Create the folders and set the permissions
RUN mkdir -p /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins \
  && chmod -R 775 /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins \
  && chown -R airflow:root /opt/airflow/dags /opt/airflow/logs /opt/airflow/plugins

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

USER airflow
# copia o arquivo com as dependencias do python/airflow
COPY requirements.txt ./

# instala as dependencias necessárias para o projeto (operators e libs python)
RUN pip install --no-cache-dir --upgrade pip && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["bash", "entrypoint.sh"]