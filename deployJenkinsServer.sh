# Create ec2 instance
cd terraform
terraform apply -auto-approve

# Save public ip to ansible inventory file
terraform output | grep -oP '(\d{1,3}.){3}\d{1,3}' > ../ansible/inventory

# Wait for sshd to launch
sleep 7

# Run ansible playbooks
cd ../ansible
ansible-playbook -i inventory playbooks/installDocker.yml
ansible-playbook -i inventory playbooks/build.yml
