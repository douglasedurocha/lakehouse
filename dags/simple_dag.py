from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def print_hello():
    print("Hello, Airflow!")

# Define a DAG
with DAG(
    dag_id="test_dag",
    default_args={
        "owner": "airflow",
        "depends_on_past": False,
        "retries": 1,
    },
    description="A simple test DAG",
    schedule_interval=None,
    start_date=datetime(2024, 1, 1),
    catchup=False,
) as dag:

    hello_task = PythonOperator(
        task_id="say_hello"
        python_callable=print_hello,
    )
