pwd
ls
chmod 400 id_rsa
# reset to avoid pull merge issue
ssh -o StrictHostKeyChecking=no -i id_rsa opc@x.x.x.x 'cd /home/opc/apps && git reset --hard && git pull && bash -s < deploy.sh'
