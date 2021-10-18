# TERRATEST-YOUR-TERRAFORM
## Introduction
TerraTest is a Go library that provides patterns and helper functions that allows you to write automated tests for infrastructure code. Combined with Docker and LocaStack it provides a powerful tool to write and verfy infrastructure locally. 

Localstack is an easy-to-use test/mocking framework for developing Cloud applications. It spins up a testing environment on your local machine that provides the same functionality and APIs as the real AWS cloud environment. You can run your Lambda functions, store data to DynamoDB tables, feed events through Kinesis streams, put your application behind an API Gateway, and much more. And all this happens on your local machine, without ever talking to the cloud.

In short:  
- It enables a highly efficient feedback loop as it allows you to deploy your applications locally in Docker
- It provides huge cost savings for development teams as no cloud infrastructure is needed
- It improves software quality as it allows you to test prior to merging and deploying code.  
<br />

This repository uses Terraform, Docker and LocalStack to 'spin up' a local S3 bucket and demonstrate the use of Terratest to validate the successful creation and existence of this S3 bucket and attached policies and versioning configurations.
  
<br />
  
## Dependencies
**Install the following tools/applications**  
Docker: https://docs.docker.com/engine/install/  
Docker-compose: https://docs.docker.com/compose/install  
Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started  
Visual Studio Code: https://code.visualstudio.com/Download  
Go: https://golang.org/doc/install  
<br />
  
**VSCode plugins**  
Go: https://marketplace.visualstudio.com/items?itemName=golang.Go  
HashiCorp Terraform: https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform  
<br />
  
## Install
In order to install and run this terraform/terratest example, please install the following packages:  
> `pip install localstack`  
> `cd terratest/`  
> `go mod init test`  
> `go get github.com/gruntwork-io/terratest/modules/aws`  
> `go get github.com/stretchr/testify/assert@v1.4.0`  
> `cd ..`  
> `go mod tidy`  
> `terraform init`
  
<br />  
  
Then run the following commands:  
> Start Docker Daemon  
> Spin up localstack: `docker-compose up`  
> `cd .\terratest\`  
> Run the Terratest: `go test`
