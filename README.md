# DevOps Readme

## How to establish OIDC connection from Github to AWS

To create a connection between AWS and Github Action, we need an OIDC connection. This connected the particular github repository with the AWS.

### What is OIDC
OIDC means OpenID connect. This is a connection, established between a web identity ( Github ) and the cloud ( AWS ). It allows secure authentication and authorization between the two platforms.

### How to create OIDC in AWS?
To create an OIDC in AWS:

1. Goto IAM in AWS
2. Select Identity provider and create an Identity provider, with below details

```
providerName: github
providerType: SAML
metadataDocument: https://token.actions.githubusercontent.com/

audience: sts.amazonaws.com

subject: < github-repository>-<branch>
```

3. Once the Identity provider is created, we will need to create an IAM role, with required permission ( whatever you want to perform via Github )
4. The last step will be to attach the IAM role created in `Step 3` to the Identity provider created in `Step 2`
5. In the end, you will need to assume the IAM role created in `Step 3` to perform the required actions in AWS.
