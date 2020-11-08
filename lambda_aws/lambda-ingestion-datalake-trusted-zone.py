import boto3
import json
import os

athena = boto3.client('athena')
s3 = boto3.client('s3')
athena_path_results = os.environ['env_athena_result']

with open('query.sql', 'r') as f:
    query_stmt = f.read()


def athena_execute_query():
    """ Funcao para execucao do job no athena """

    return athena.start_query_execution(
        QueryString=query_stmt,
        QueryExecutionContext={'Database': 'trd_nyc_taxi_trips'},
        ResultConfiguration={'OutputLocation': f's3://{athena_path_results}/'}
    )


def main():
    """ funcao de controle da execucao da query """

    dct_result = {}
    print("Iniciando ingestão...")
    response = athena_execute_query()
    query_id = response.get('QueryExecutionId')
    dct_result['query_id'] = query_id

    while True:
        res = athena.get_query_execution(QueryExecutionId=query_id)
        status = res.get('QueryExecution').get('Status').get('State')
        desc_status = res.get('QueryExecution').get('Status').get('StateChangeReason')

        if status == 'FAILED':
            dct_result['status'] = status
            dct_result['description'] = desc_status
            break
        elif status == 'CANCELLED':
            dct_result['status'] = status
            dct_result['description'] = desc_status
            break
        elif status == 'SUCCEEDED':
            dct_result['status'] = status
            dct_result['description'] = desc_status
            break
    return dct_result


def lambda_handler(event, context):
    k = main()
    print(k)
