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

- [Docs for in-built github variables] (https://docs.github.com/en/actions/reference/workflows-and-actions/variables)
- [Docs for in-built github variables specific to Github Actions] (https://docs.github.com/en/actions/reference/workflows-and-actions/contexts#github-context)

```
${{ github.GITHUB_REPOSITORY }}
```

## How to pass env variables in stage and at root level, in Github Actions?

- If env variable is at root level

```
env:
  AWS_REGION: "us-east-1"

- name: Create S3 bucket for remote backend configuration of Terraform
  run: |
    echo "Selected AWS Region is ${{ env.AWS_REGION }}"
```


- If env variables is at job level

```
env:
  AWS_REGION: "us-east-1"

- name: Create S3 bucket for remote backend configuration of Terraform
  env:
    AWS_BUCKET_NAME: ${{ env.AWS_REGION }}-terraform-backend
  run: |
    echo "Bucket name is $AWS_BUCKET_NAME"
```

## How to create a remote backend file, for storing state of terraform?

- This assumes we have a bucket created called mybucket. The Terraform state is written to the key path/to/my/key.

```
terraform {
  backend "s3" {
    bucket = var.remote_bucket
    key    = "ifaakash-aws-infra.tfstate"
    region = var.aws_region
  }
}
```

## Can we pass bucket name to backend configuration using variables.tf?

- Terraform reads the backend configuration before it processes variables, so it cannot resolve variable references at that stage. This limitation is by design to ensure the backend can be initialized predictably and securely, before the rest of the configuration is loaded.
