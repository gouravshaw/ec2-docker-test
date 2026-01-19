# EC2 Docker Hosting Test App

A simple, beautiful web app to test your AWS EC2 Docker hosting setup.

## Quick Start on EC2

### 1. Copy files to EC2

From your local machine, copy the project files to your EC2 instance:

```bash
scp -i your-key.pem -r /path/to/Test_Project ubuntu@<your-ec2-public-ip>:~/
```

Or clone/copy directly on the EC2 instance.

### 2. Build the Docker image

SSH into your EC2 instance and run:

```bash
cd ~/Test_Project
docker build -t ec2-test-app .
```

### 3. Run the container

```bash
docker run -d -p 80:80 --name ec2-test ec2-test-app
```

### 4. Access your app

Open your browser and go to:
```
http://<your-ec2-public-ip>
```

## EC2 Security Group Configuration

Make sure your EC2 security group allows inbound traffic on port 80:

| Type | Protocol | Port Range | Source |
|------|----------|------------|--------|
| HTTP | TCP      | 80         | 0.0.0.0/0 |

## Useful Docker Commands

```bash
# View running containers
docker ps

# View logs
docker logs ec2-test

# Stop the container
docker stop ec2-test

# Remove the container
docker rm ec2-test

# Remove the image
docker rmi ec2-test-app
```

## Troubleshooting

- **Can't access the page?** Check your EC2 security group allows port 80
- **Docker permission denied?** Run `sudo usermod -aG docker $USER` and re-login
- **Port already in use?** Use a different port: `docker run -d -p 8080:80 ec2-test-app`
