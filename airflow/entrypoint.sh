#!/bin/bash

# Exit on error
set -e

# Initialize the Airflow database
airflow db migrate

# # Create a default superuser if needed
if [ "$AIRFLOW_CREATE_DEFAULT_USER" = "True" ]; then
    echo "Creating a default superuser"

    airflow users create \
      --username ${AIRFLOW_USER_USERNAME:-admin} \
      --password ${AIRFLOW_USER_PASSWORD:-admin} \
      --firstname ${AIRFLOW_USER_FIRSTNAME:-Admin} \
      --lastname ${AIRFLOW_USER_LASTNAME:-User} \
      --role ${AIRFLOW_USER_ROLE:-Admin} \
      --email ${AIRFLOW_USER_EMAIL:-admin@example.com}
fi

# Start the Airflow webserver and scheduler
# Using 'exec' to ensure signals are properly forwarded
exec airflow webserver & \
    airflow scheduler
