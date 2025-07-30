# Cloudfront OAC to S3
This repository contain the steps on establishing the connection between the Cloudfront and S3 Bucket

## Target
- [x] Create a S3 Bucket ( via Github Action ) to store state file configuration using Terraform
- [x] Establish connection from Github to AWS using OIDC
- [ ] Link terraform to the S3 created ( for storing state file ) in above steps
- [ ] Create a Github Action [ Integrate atlantis, if possible ]
- [ ] Create S3 Bucket ( for storing image ) using Github CLI
- [ ] Upload Image to S3 Bucket
- [ ] Create Cloudfront distribution using Terraform
- [ ] Enable OAC for Cloudfront
- [ ] Update Cloudfront ditribution in S3 Bucket Policy
