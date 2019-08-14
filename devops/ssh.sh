pwd
ls
chmod 400 id_rsa
# reset to avoid pull merge issue
ssh -o StrictHostKeyChecking=no -i id_rsa opc@x.x.x.x 'cd /home/opc/apps && bash -s < reset.sh && bash -s < update.sh && bash -s < deploy.sh'
