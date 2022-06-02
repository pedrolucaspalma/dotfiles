#!/bin/bash

# This script is used to install AWS SAM CLI

# Download the AWS SAM CLI zip file to a directory of your choice.

# Verify the integrity and authenticity of the downloaded installer files by generating a hash value using the following command:
sha256sum aws-sam-cli-linux-x86_64.zip

# The output should look like the following example:
#  <64-character SHA256 hash value> aws-sam-cli-linux-x86_64.zip

# Unzip the installation files into the sam-installation/ subdirectory.
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation

# Install the AWS SAM CLI.
sudo ./sam-installation/install

# Verify the installation.
sam --version