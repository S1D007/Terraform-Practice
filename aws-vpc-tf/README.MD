# VPC Creation on AWS Using Terraform

---

## Table of Contents
- [Introduction](#introduction)
- [Key Concepts](#key-concepts)
- [Why Use a VPC?](#why-use-a-vpc)
- [Terraform Implementation](#terraform-implementation)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Resources Created](#resources-created)
- [Conclusion](#conclusion)

---

## Introduction
This repository contains a Terraform script that automates the creation of a Virtual Private Cloud (VPC) on Amazon Web Services (AWS). The VPC is equipped with two subnets: one public and one private, each with distinct security and routing configurations.

## Key Concepts
### What is a VPC?
A Virtual Private Cloud (VPC) is a virtual network dedicated to an AWS account. It offers complete control over the networking environment, including IP address selection, subnet creation, and configuration of route tables and gateways. VPCs enable secure and seamless access to AWS resources, supporting both IPv4 and IPv6.

### Why Use a VPC?
VPCs are essential for maintaining a secure and scalable infrastructure on AWS. They provide isolation, security, and control over resources, enabling the creation of a secure network that can be connected to the internet, data centers, and other VPCs.

## Why Use a VPC?
VPCs are essential for maintaining a secure and scalable infrastructure on AWS. They provide isolation, security, and control over resources, enabling the creation of a secure network that can be connected to the internet, data centers, and other VPCs.

## Terraform Implementation
The Terraform script in this repository automates the following:

1. Creates a VPC with user-defined IP address ranges.
2. Sets up two subnets: one public and one private.
3. Configures route tables for each subnet to control inbound and outbound traffic.
4. Attaches an internet gateway to the public subnet for internet access.
5. Links a NAT gateway to the private subnet for secure outbound traffic.
6. Configures security groups for each subnet to control inbound and outbound traffic.

## Prerequisites
- An AWS account with the necessary permissions.
- Terraform installed on your local machine.

## Usage
1. Clone this repository to your local machine.
2. Configure your AWS credentials and region in the Terraform script.
3. Run `terraform init` to initialize the working directory.
4. Run `terraform apply` to create the VPC and associated resources.

## Resources Created
The Terraform script creates the following AWS resources:
- VPC with user-defined IP address range
- Two subnets (public and private)
- Internet gateway for the public subnet
- NAT gateway for the private subnet
- Route tables for both subnets
- Security groups for both subnets


## Conclusion
This Terraform script streamlines the process of creating a secure and scalable VPC on AWS. By leveraging the automation provided, users can easily establish a robust networking environment with complete control over security and resource accessibility. For further details, refer to the inline comments and documentation within the Terraform script.


