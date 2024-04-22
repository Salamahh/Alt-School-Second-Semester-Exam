# Alt-School-Second-Semester-Exam
# Automated LAMP Stack Installation Using Ansible and Vagrant
'Master' and 'Slave' are two Ubuntu-based servers whose provisioning is automated with Vagrant and Ansible in this project. It sets up a cron job to monitor the server's uptime every 12 am and deploys a LAMP (Linux, Apache, MySQL, PHP) stack on the Master. It also uses Ansible to remotely deploy the same application on the Slave node.

## Conditions
Vagrant VirtualBox (or any other vendor that Vagrant supports)
Ansible
Configuring the environment
Run vagrant until the virtual machines (VMs) specified in the Vagrantfile are provisioned.
Use vagrant ssh Master to SSH into the Master node.
To deploy the LAMP stack, run the./Sallybash.sh bash script.
Execute the playbook for Ansible:
then run ansible-playbook -i host-inventory sally.yml --check
then run ansible-playbook -i host-inventory sally.yml 

# Required Structure of the Repository
Vagrantfile: Specifies how virtual machines should be provisioned.
playbook.yaml: Ansible playbook to copy and run the bash script on the slave node. deploy.sh: Bash script to deploy the LAMP stack.
docs/: Has instructions and screen grabs evidence of the accessibility of the app
README.md this particular file.
