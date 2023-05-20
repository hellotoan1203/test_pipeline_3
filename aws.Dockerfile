FROM amazonlinux:2

# Install dependencies
RUN yum update -y && \
    yum install -y python3-pip groff less && \
    pip3 install --upgrade pip

# Install AWS CLI
RUN pip3 install awscli

# Verify installation
RUN aws --version