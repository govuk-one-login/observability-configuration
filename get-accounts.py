#!/usr/bin/env python3
import sys
import csv
import boto3

orgs = boto3.client('organizations')



non_production_configs = [
  {
    'ou': 'ou-xvhe-98ompuj8',
    'name': 'build'
  },
  {
    'ou': 'ou-xvhe-90rbpmd6',
    'name': 'dev'
  },
  {
    'ou': 'ou-xvhe-tziggy32',
    'name': 'staging'
  }
]

production_configs = [
  {
    'ou': 'ou-xvhe-o7ufh54l',
    'name': 'integration'
  },
  {
    'ou': 'ou-xvhe-rjk6poda',
    'name': 'production'
  }
]

def get_accounts_in_ou(ou):
  for response in orgs.get_paginator('list_accounts_for_parent').paginate(ParentId=ou):
    for account in response['Accounts']:
      yield account

def main():
  output = []

  if sys.argv[1] == "production":
    for config in production_configs:
      for account in get_accounts_in_ou(config['ou']):
        output.append({
          'id': account['Id'],
          'name': account['Name'],
          'environment': config['name']
        })
  else:
    for config in non_production_configs:
      for account in get_accounts_in_ou(config['ou']):
        output.append({
          'id': account['Id'],
          'name': account['Name'],
          'environment': config['name']
        })

  with open('accounts.csv', 'w') as f:
    writer = csv.DictWriter(f, ['id', 'name', 'environment'])
    writer.writeheader()
    writer.writerows(output)

if __name__ == '__main__':
  main()