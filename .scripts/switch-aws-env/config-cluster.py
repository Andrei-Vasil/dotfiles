import os
import json
import yaml
import re

RED = '\033[91m'
RESET = '\033[0m'

PROXY_PORT = 1081
KUBE_CONFIG_LOCATION = f'{os.environ["HOME"]}/.kube/config'


def select_cluster() -> str:
  clusters = json.loads(os.popen("aws eks list-clusters").read())
  assert 'clusters' in clusters and len(clusters['clusters']) > 0, f"{RED}[ERR] Can't update {KUBE_CONFIG_LOCATION}: You don't have an EKS cluster in your cloudroom{RESET}"
  return clusters['clusters'][0]


def add_proxy(cluster, aws_account_id, cluster_name):
  if re.search(f'arn:aws:eks:eu-central-1:{aws_account_id}:cluster/{cluster_name}', cluster['name']) is not None:
    cluster['cluster']['proxy-url'] = f'socks5://127.0.0.1:{PROXY_PORT}'
  return cluster


def add_proxy_setting_to_kubectl(aws_account_id, cluster_name):
  kubeconf = ''
  with open(KUBE_CONFIG_LOCATION, 'r') as kubeconf_file:
    kubeconf = yaml.load(kubeconf_file, Loader=yaml.FullLoader)
    kubeconf['clusters'] = [add_proxy(cluster, aws_account_id, cluster_name) for cluster in kubeconf['clusters']]
  with open(KUBE_CONFIG_LOCATION, 'w') as kubeconf_file:
    kubeconf_file.write(yaml.dump(kubeconf))


def update_kubeconfig(cluster_name):
  os.system(f'aws eks update-kubeconfig --region eu-central-1 --name {cluster_name}')


def main():
  with open('/tmp/switch-aws-env.txt', 'r') as input:
    aws_account_id = input.readline()[:-1]
    cluster = select_cluster()
    update_kubeconfig(cluster)
    add_proxy_setting_to_kubectl(aws_account_id, cluster)


if __name__ == '__main__':
  try:
    main()
  except AssertionError as err:
    print(str(err))