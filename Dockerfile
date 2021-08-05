FROM nexus-nonprod-gss.uscis.dhs.gov:8124/centos7-base
ENV HTTPS_PROXY="http://preproxy.uscis.dhs.gov:80"
ENV HTTP_PROXY="http://preproxy.uscis.dhs.gov:80"
ENV NO_PROXY="169.254.169.254,s3.amazonaws.com,localhost,127.0.0.1,.consul,vault.uscis.dhs.gov"
ENV no_proxy="169.254.169.254,s3.amazonaws.com,localhost,127.0.0.1,.consul,vault.uscis.dhs.gov"
ENV AWS_DEFAULT_REGION="us-east-1"
RUN yum update -y && yum upgrade -y && yum -y install gcc git wget aws-cli && yum clean all
COPY --from=hashicorp/terraform:0.14.3 /bin/terraform /bin/


# download and install go and terraform so we can run terratest to
# validate our terraform 
RUN wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz 
RUN tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# ensure go/terrraform was installed correctly
RUN go version
RUN terraform version

#RUN go get github.com/gruntwork-io/terratest/modules/terraform

COPY terratest /terratest
COPY terraform /terraform
WORKDIR /terratest

RUN go mod init test
# fix for "missing dot in first path element" error for imports from vendor
ENV GO111MODULE="on"
RUN go mod tidy -e

ENV AWS_SECRET_ACCESS_KEY=""
ENV AWS_ACCESS_KEY_ID=""



CMD ["/app/run.sh"] 
