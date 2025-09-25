# ----------------------------
# Makefile for CloudFormation
# ----------------------------

STACK_NAME ?= ubuntu-flask-server
FILE_LOC ?= template.yaml
KEY_PAIR ?= my-ubuntu-key
INSTANCE_NAME ?= MyUbuntuFlaskServer
VPC_ID ?= vpc-0ebcddd98956ef267

.PHONY: deploy clean

deploy:
	@echo "Creating CloudFormation stack: ${STACK_NAME}..."
	aws cloudformation create-stack \
		--stack-name ${STACK_NAME} \
		--template-body file://${FILE_LOC} \
		--parameters \
			ParameterKey=KeyPairName,ParameterValue=${KEY_PAIR} \
			ParameterKey=InstanceName,ParameterValue=${INSTANCE_NAME} \
			ParameterKey=VpcId,ParameterValue=${VPC_ID}
	@echo "Stack creation requested. You can monitor it with:"
	@echo "aws cloudformation describe-stacks --stack-name ${STACK_NAME}"

clean:
	@echo "Deleting CloudFormation stack: ${STACK_NAME}..."
	aws cloudformation delete-stack --stack-name ${STACK_NAME}
	@echo "Stack deletion requested. You can monitor it with:"
	@echo "aws cloudformation describe-stacks --stack-name ${STACK_NAME}"
