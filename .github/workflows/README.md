# Github Action ready-to-go Actions

## Validating Github OIDC ( OpenID Connect ) connection to AWS
```
 - name: Validate credetials
   run: |
     aws sts get-caller-identity
```

## Using variable in Github

```
env:
  AWS_REGION: "us-east-1"

- name: Create S3 bucket for remote backend configuration of Terraform
  run: |
    aws s3 mb s3://${{ github.GITHUB_REPOSITORY }}-terraform-backend --region $AWS_REGION
```
## Using Github in-built variables

[Docs for in-built github variables] (https://docs.github.com/en/actions/reference/workflows-and-actions/variables)

```
${{ github.GITHUB_REPOSITORY }}
```
