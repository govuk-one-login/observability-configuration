#!/usr/bin/env python3
import csv
import requests
from pathlib import Path
from os import environ

api_token = environ['DYNATRACE_API_TOKEN']
api_url = environ['DYNATRACE_ENV_URL']

def get_all_credentials():
  return requests.get(f'{api_url}/api/config/v1/aws/credentials',
                      headers={
                        'Authorization': f'Api-Token {api_token}'
                      }).json()

def get_credential_account_id(id):
  return requests.get(f'{api_url}/api/config/v1/aws/credentials/{id}',
                      headers={
                        'Authorization': f'Api-Token {api_token}'
                      }).json()['authenticationData']['roleBasedAuthentication']['accountId']

def list_accounts():
  for credential in get_all_credentials():
    account_id = get_credential_account_id(credential['id'])
    yield {
      'name': credential['name'],
      'id': account_id
    }

def main():
  path = Path(__file__).parent / 'accounts.csv'
  with open(path, 'w', newline='') as f:
    fieldnames = ['name', 'id']
    writer = csv.DictWriter(f, fieldnames)

    writer.writeheader()

    for account in list_accounts():
      writer.writerow(account)
    

if __name__ == '__main__':
  main()