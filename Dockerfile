FROM codercom/enterprise-base:ubuntu

ENV TERRAFORM_VERSION=1.1.9

# Install Terraform
RUN sudo wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin

# Install pre-commit
RUN pip install pre-commit

# Install Go
RUN curl -L "https://go.dev/dl/go1.18.1.src.tar.gz" | tar -C /usr/local -xzvf -

# Setup go env vars
ENV GOROOT /usr/local/go
ENV PATH $PATH:$GOROOT/bin

ENV GOPATH /home/coder/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:$GOBIN

COPY [ "configure", "/coder/configure" ]
