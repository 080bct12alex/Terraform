# Terraform workflow for creating, updating, and destroying an AWS EC2 instance:

- create → verify → modify → destroy

**Step 1: Terraform Config File (main.tf)**

```yml
# hcl

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Provider source
      version = ">= 5.0.0"         # Version constraint
    }
  }
}

# Specify the AWS provider
provider "aws" {
  region = "us-east-1"
}

# Create an EC2 instance
resource "aws_instance" "my_server" {
  ami           = "ami-0c94855ba95c71c99"  #  Ubuntu AMI
  instance_type = "t3.micro"

  tags = {
    Name = "MyServer"
  }
}
```

OR

Terraform Config File (main.tf.json)
```json
{
  "terraform": {
    "required_providers": {
      "aws": {
        "source": "hashicorp/aws",
        "version": ">= 5.0.0"
      }
    }
  },
  "provider": {
    "aws": {
      "region": "us-east-1"
    }
  },
  "resource": {
    "aws_instance": {
      "my_server": {
        "ami": "ami-0c94855ba95c71c99",
        "instance_type": "t3.micro",
        "tags": {
          "Name": "MyWebServer"
        }
      }
    }
  }
}
```
- HCL short and readable 

**Step 2: Initialize Terraform**

```bash
terraform init
```


- Initializes the working directory.

- Downloads provider plugins.

**Step 3: Plan Terraform Changes**

```bash
terraform plan
```

- Shows what resources will be created or modified.

- Good to verify before applying.

**Step 4: Apply Terraform**

```bash
terraform apply
```

- Prompts for approval → type yes.

- EC2 instance will be created.

- Verify in AWS console → EC2 instance should be running.

**Step 5: Modify Config** 

- Editing main.tf to update the tag:

```yml
tags = {
  Name = "MyUpdatedServer"
}
```

Then run:

```bash
terraform apply
```

- Terraform will update the existing instance tag automatically.

**Step 6: Destroy Resources After Testing**

```bash
terraform destroy
```

- Prompts for approval → type yes.

- Removes the EC2 instance from  AWS account.


---

**NOTE:**
---
Terraform knows which AWS account to use through AWS credentials.

    You need to provide your credentials so Terraform can authenticate with AWS. 

**Using AWS CLI Credentials (Recommended)**
- Install AWS CLI and configure it:

```yml
aws configure
```

- You will be prompted for:
```js
AWS Access Key ID → from IAM

AWS Secret Access Key → from IAM

Default region → e.g., us-east-1

Output format → json (optional)
```

- This creates a credentials file at:
```yml
Linux/Mac: ~/.aws/credentials

Windows: C:\Users\<username>\.aws\credentials
```
Terraform will automatically pick up these credentials.

---
**Using Environment Variables**

- Set these variables in your terminal before running Terraform:


```js
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_DEFAULT_REGION="us-east-1"
```

On Windows (PowerShell):

```js
$env:AWS_ACCESS_KEY_ID="your-access-key-id"
$env:AWS_SECRET_ACCESS_KEY="your-secret-access-key"
$env:AWS_DEFAULT_REGION="us-east-1"
```

Terraform will use them automatically.

---
**Hardcoding in the Provider (Not Recommended for Production)**

- You can also specify credentials directly in your main.tf (less secure):

```json
provider "aws" {
  region     = "us-east-1"
  access_key = "YOUR_ACCESS_KEY"
  secret_key = "YOUR_SECRET_KEY"
}
```
