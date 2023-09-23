#!/bin/bash
if [ ! -d ~/.aws ]; then mkdir ~/.aws; fi;
if [ -f ~/.aws/config ]; then rm ~/.aws/config; fi;
cat << EOF >> ~/.aws/config
[default]
region = ${Region}
output = json
EOF
if [ -f ~/.aws/credentials ]; then rm ~/.aws/credentials; fi;
cat << EOF >> ~/.aws/credentials
${Credential}
EOF
exit;
