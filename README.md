# AWS CDK Docker Container.

[![Docker pull](https://img.shields.io/docker/pulls/tobiastrozowski/aws-cdk-cli.svg)](https://hub.docker.com/r/tobiastrozowski/aws-cdk-cli/) [![Docker pull](https://img.shields.io/docker/stars/tobiastrozowski/aws-cdk-cli.svg)](https://hub.docker.com/r/tobiastrozowski/aws-cdk-cli/) [![Github issues](https://img.shields.io/github/issues-raw/tobias-trozowski/docker-aws-cdk-cli.svg)](https://github.com/tobias-trozowski/docker-aws-cdk-cli/issues) [![License](https://img.shields.io/github/license/tobias-trozowski/docker-aws-cdk-cli)](https://github.com/tobias-trozowski/docker-aws-cdk-cli/blob/master/LICENSE.md)

Containerized [Docker](https://www.docker.com) container to avoid installing Node.js and [AWS CDK CLI](https://docs.aws.amazon.com/cdk/latest/guide/cli.html) on your local machine.

## Usage

### Shell
Run `cdk` through the container:
```sh
docker run --rm tobiastrozowski/aws-cdk-cli --version
```

Run as shell and mount AWS credentials from host:
```sh
docker run --rm --entrypoint ash -v ~/.aws:/root/.aws -it tobiastrozowski/aws-cdk-cli:2.105.0
```

Create yourself a shell alias:
```sh
sudo bash -c "printf \"#\!/bin/sh
docker run --rm -v ~/.aws:/root/.aws -v \$(pwd):/app -it tobiastrozowski/aws-cdk-cli \\\$@
\" > /usr/local/bin/cdk"
sudo chmod +x /usr/local/bin/cdk
```
### Docker Compose
```yaml
cdk:
    image: tobiastrozowski/aws-cdk-cli
    working_dir: /app
    volumes:
    - ~/.aws:/root/.aws
    - .:/app:rw
```

And run `docker-compose run cdk --version`
