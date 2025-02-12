import os
import re
import InquirerPy
import InquirerPy.inquirer

IGNORED_PROFILES = ['bmwsso']
KEY_VALUE_SEPARATOR = ' = '
AWS_PROFILE_CONFIG_FILE = f'{os.environ["HOME"]}/.shell.config/terraform.sh'


def get_profile_header(line: str):
  return re.search('^\[profile (.+)\]$', line)


def read_blob(creds) -> dict:
  blob = {}
  last_pos = creds.tell()
  line = creds.readline()
  match = get_profile_header(line)
  while line and match is None:
    if len(line.split(KEY_VALUE_SEPARATOR)) == 2:
      key, value = line.split(KEY_VALUE_SEPARATOR)
      blob[key] = value[:-1]
    last_pos = creds.tell()
    line = creds.readline()
    match = get_profile_header(line)
  creds.seek(last_pos)
  return blob


def read_aws_profiles(file_path: str) -> dict:
  blobs = {}
  with open(file_path, 'r') as creds:
    line = creds.readline()
    while line:
      match = get_profile_header(line)
      if match is not None:
        header = match.group(1)
        blob = read_blob(creds)
        if header not in IGNORED_PROFILES:
          blobs[header] = blob
      line = creds.readline()
  return blobs


def get_aws_account_id(profile_data: dict) -> str:
  return re.search('([0-9]+)', profile_data['sso_account_id']).group(1)


def get_lite_profiles(profiles: dict) -> dict:
  return {
    profile: get_aws_account_id(profile_data) for profile, profile_data in profiles.items()
  }


def switch_aws_profile():
  full_profiles = read_aws_profiles(f'{os.environ["HOME"]}/.aws/config')
  profiles = get_lite_profiles(full_profiles)
  answer = InquirerPy.inquirer.select(
    message='Select your environment',
    choices=[
      *profiles.keys(),
      'Exit'
    ],
    vi_mode=True
  ).execute()
  os.system(f"sed -i 's/AWS_PROFILE=.*/AWS_PROFILE={answer}'/ {AWS_PROFILE_CONFIG_FILE}")
  return answer, profiles

if __name__ == '__main__':
  answer, profiles = switch_aws_profile()
  with open('/tmp/switch-aws-env.txt', 'w') as o:
    o.writelines([
      f'{profiles[answer]}\n'
    ])
