# Jenkins-Server-EC2-Deploy

Here is configuration for creating AWS EC2 instance and deploying Jeenkins server in Docker container

You'll need intalled terraform and ansible to use this repo, and ec2 cli configured with your access and secret keys 

Also you have to ensure, that you have ssh keys in your user folder named id_rsa and id_rsa.pub. Or you can change it's names in ansible.cfg and main.tf

There are two bash scripts in root folder, first allow you deploy Jenkins server. Just run it on your machine and wait for process to end

You can find your server ip and Jenkins Admin password in the end of ansible output

If you no longer need this server, just run second script, and it will be destroyed
