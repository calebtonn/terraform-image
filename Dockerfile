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

# Install Terraform
RUN sudo wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install pre-commit
RUN pip3 install pre-commit

# Copy cofiguration script
COPY [ "configure", "/coder/configure" ]

# Set back to coder user
USER coder