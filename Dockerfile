FROM codercom/enterprise-base:ubuntu

ENV TERRAFORM_VERSION=1.1.9

# Run as root
USER root

# Install go
RUN curl -L "https://dl.google.com/go/go1.17.1.linux-amd64.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

# Set back to coder user
USER coder

# Install Terraform
RUN sudo wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install pre-commit
RUN sudo pip install pre-commit

COPY [ "configure", "/coder/configure" ]
