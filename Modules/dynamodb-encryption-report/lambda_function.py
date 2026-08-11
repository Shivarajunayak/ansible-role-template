import boto3
import json
import os
dynamodb = boto3.client('dynamodb')
sns = boto3.client('sns')
iam = boto3.client('iam')
def lambda_handler(event, context):
    # Get a list of all DynamoDB tables
    response = dynamodb.list_tables()
    tables = response.get('TableNames', [])
    account_alias = iam.get_paginator('list_account_aliases')
    report = []
    # Iterate through each table and retrieve encryption details
    for table_name in tables:
        try:
            table_description = dynamodb.describe_table(TableName=table_name)
            table_info = {
                'TableName': table_name,
                'EncryptionEnabled': table_description['Table']['SSEDescription']['Status'] == 'ENABLED',
                'EncryptionType': table_description['Table']['SSEDescription']['SSEType'],
                'KMSKeyARN': table_description['Table']['SSEDescription']['KMSMasterKeyArn'],
                'DeleteProtectionStatus': table_description['Table']['DeletionProtectionEnabled']
            }
            report.append(table_info)
        except Exception as e:
            print(f"Error retrieving information for table {table_name}: {e}")
    # Convert the report to a JSON string
    report_json = json.dumps(report, indent=2)
    # Send the report via SNS
    topic_arn = os.environ.get('SNS_topic_ARN')
    subject = 'DynamoDB Tables Encryption Report - Region: {}, Account: {}'.format(context.invoked_function_arn.split(':')[3], context.invoked_function_arn.split(':')[4])
    message = f"DynamoDB Tables Encryption Report:\n\n{report_json}"
    try:
        response = sns.publish(
            TopicArn=topic_arn,
            Subject=subject,
            Message=message
        )
    except Exception as e:
        print(f"Error publishing to SNS: {e}")
    return {
        'statusCode': 200,
        'body': "Report sent successfully"
    }