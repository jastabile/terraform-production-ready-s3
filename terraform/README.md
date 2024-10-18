# Introduction

This repository contains a Terraform example to create a production-ready S3 bucket: secure, performant, reliable, and observable enough for on-going operational use, following snyc recommendations.

## Requirements

- Terraform
- awscli

## Usage

1. Initialize the Terraform configuration:
    ```sh
    terraform init
    ```

2. Apply the Terraform configuration to create the S3 bucket:
    ```sh
    terraform apply
    ```

3. Confirm the apply step by typing `yes` when prompted.


## MFA delete
Important: only the bucket owner (root account) can enable MFA delete.
To apply MFA delete the best way is to do it using the `awscli` because you have to type the OTP.

- BUCKET_NAME: name of the bucket
- OTP_CODE: the OTP code from the MFA device

```
aws s3api put-bucket-versioning --bucket <BUCKET_NAME> --versioning-configuration Status=Enabled,MFADelete=Enabled --mfa "SERIAL <OTP_CODE>"
```

## Clean
Apply the Terraform configuration to clean and destroy the S3 bucket:
    ```sh
    terraform destroy -auto-aprove
    ```
