# todo-flask-deployment
This is the deployment of the following repository https://github.com/lilithbtw/todo-flask-web it is deployed using AWS CloudFormation


## Notice
claude.yaml is the file that claude generated and i used as a template

## Requierements
You must install the following dependencies:
- AWS-CLI
- curl or any web browser

## Deployment

1. Clone the repo
```bash
git clone https://github.com/Lilithbtw/todo-flask-deployment.git
cd todo-flask-deployment
```

2. Configure you aws-cli
```bash
aws configure
```

3. Create the stack and wait for it to load
```bash
make deploy ARGS
```

4. Get the IP of the EC2 Instance after it load everything correctly
```bash
make get-ip
```

5. Open a browser or curl the website on port 5000 (It might take a while so don't worry if it doesn't curl)
```bash
open "http://IPv4:5000"
```
```bash
curl "http://IPv4:5000"
```