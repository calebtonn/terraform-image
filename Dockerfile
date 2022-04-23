FROM codercom/enterprise-base:ubuntu

ENV TERRAFORM_VERSION=1.1.9

# Install Go

RUN sudo apt install golang-go

# Install Terraform
RUN sudo wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install pre-commit
RUN pip install pre-commit

COPY [ "configure", "/coder/configure" ]
