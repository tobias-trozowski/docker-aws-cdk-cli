FROM node:12-alpine
ARG AWS_CDK_VERSION

RUN npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]

ENTRYPOINT ["cdk"]
