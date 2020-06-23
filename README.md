# Prison Technology Transformation Programme AWS Infrastructure

## Introduction

The current environments are:
- Development
- Pre-production
- Production

The Terraform in this repository serves 2 purposes:
- Bootstrapping of Development, Pre-production and Production environments on AWS.
- Creating the infrastructure for various services/solutions such as Logging and DNS / DHCP.

This Terraform can be run in 2 different contexts:
Your own machine for bootstrapping AWS, or by releasing features through CodePipeline in the shared Services Account.

Please see [setup instructions](./documentation/setup.md).

## Testing
There is a testing suite called Terratest that tests modules in this codebase
To run this codebase you will need to [install golang](https://formulae.brew.sh/formula/go)

To run the unit test run
- `cd test`
- `go test -v -timeout 30m`
 
 