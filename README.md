# AWS CDK Docker Container.

[![Docker pull](https://img.shields.io/docker/pulls/tobiastrozowski/aws-cdk-cli.svg)](https://hub.docker.com/r/tobiastrozowski/aws-cdk-cli/) [![Docker pull](https://img.shields.io/docker/stars/tobiastrozowski/aws-cdk-cli.svg)](https://hub.docker.com/r/tobiastrozowski/aws-cdk-cli/) [![Github issues](https://img.shields.io/github/issues-raw/tobias-trozowski/docker-aws-cdk-cli.svg)](https://github.com/tobias-trozowski/docker-aws-cdk-cli/issues) [![License](https://img.shields.io/github/license/tobias-trozowski/docker-aws-cdk-cli)](https://github.com/tobias-trozowski/docker-aws-cdk-cli/blob/master/LICENSE.md)

[Docker](https://www.docker.com) container to and run [AWS CDK CLI](https://docs.aws.amazon.com/cdk/latest/guide/cli.html).

## Installation / Usage

1. Install the tobiastrozowski/aws-cdk-cli container:

    ``` sh
	$ docker pull tobiastrozowski/aws-cdk-cli
	```

2. Run `cdk` through the container:

    ``` sh
	$ docker run -v $(pwd):/app --rm tobiastrozowski/aws-cdk-cli run
    ```
   or in shorthand add
    ``` sh
	$ sudo sh -c "printf \"#!/bin/sh
    export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
    docker run -v $(pwd):/app --rm tobiastrozowski/aws-cdk-cli \\\$@
    \" > /usr/local/bin/cdk"
	$ sudo chmod +x /usr/local/bin/cdk
    ```
   and then from host machine just
    ``` sh
	$ cdk --version
    ```
