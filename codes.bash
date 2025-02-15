# SSH into your EC2 instance:
chmod 0400 <bastion_host_key.pem>
ssh -i <bastion_host_key.pem> ec2-user@<bastion_host_public_ip>

# Install docker, run MySQL Docker container and connect to your RDS Host.

# Install Docker using yum
sudo yum update -y
sudo yum install -y docker

# Start Docker service
sudo service docker start

# Enable Docker to start on boot
sudo systemctl enable docker

# Add ec2-user to Docker group
sudo usermod -aG docker ec2-user

#Run docker container and connect to RDS host
sudo docker run --name mysql-client -it --rm mysql mysql -h <your-db-instance-endpoint> -u <your-db-user-name> -p


# You can view all the databases available on your DB instance (this is where we will store the tables we’ll create using the SQL electron)
SHOW DATABASES;
USE <preferred DB>;
EXIT;


# Set Up the SSH Tunnel (Manually via Command Line):
# On your local machine, create an SSH tunnel from your machine to the Bastion Host using the following command:

ssh -i /path/to/bastion-key.pem -L 3306:rds-endpoint.amazonaws.com:3306 ec2-user@bastion-public-ip