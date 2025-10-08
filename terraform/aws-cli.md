# AWS CLI (Command Line Interface) 

- a powerful tool that allows you to interact with AWS services and manage your AWS resources directly from the terminal or command prompt. 
- Using the AWS CLI, you can run commands to create, modify, and delete AWS services without having to log into the AWS Management Console.

**Key Concepts:**

- Configuration: You'll need to configure your AWS CLI with your access key, secret key, and the default region.

- Commands: Each AWS service has its own set of commands (e.g., aws s3, aws ec2, etc.).

- Profiles: Multiple sets of credentials can be managed with named profiles.

---
**Installation:**
---
 *Install AWS CLI:*

- macOS: 

```bash
brew install awscli
```
   
- Windows:
  
      Download the installer from the AWS CLI official site

- Linux: 
   
      Use your package manager (e.g., sudo apt install awscli).


**Verify installation:**

```yml
aws --version
```


**Configuration:**

You need to configure the AWS CLI with your AWS credentials.

```
aws configure
```

You'll be prompted to enter:

```
AWS Access Key ID

AWS Secret Access Key

Default region name (e.g., us-east-1)

Default output format (e.g., json or text)

```

**Common AWS CLI Commands:**


*EC2 (Elastic Compute Cloud):*

- List all instances:

```
aws ec2 describe-instances
```

- Start an EC2 instance:
```
aws ec2 start-instances --instance-ids i-1234567890abcdef0
```

*IAM (Identity and Access Management):*

- List IAM users:

```
aws iam list-users
```


*Lambda:*

- Invoke a Lambda function:
```
aws lambda invoke --function-name MyLambdaFunction output.txt
```

---
**Using AWS CLI with Profiles:**

You can use different credentials for different profiles. For example:
```
aws configure --profile dev

```

This command will prompt you for the following information:

```
AWS Access Key ID: Your AWS access key ID.

AWS Secret Access Key: Your AWS secret access key.

Default region name: The default region (e.g., us-west-2, us-east-1).

Default output format: The format for command output (e.g., json, text, table).

```

To use a specific profile for a command:

```
aws s3 ls --profile dev
```


*Help and Documentation:*

For detailed information about a command, you can use:

```
aws <service> help
```

For example:
```
aws s3 help
```



To view a list of all profiles configured in your AWS CLI
```
aws configure list-profiles

```

If you have multiple profiles set up (e.g., for different AWS accounts or regions), you can switch between them by simply specifying the --profile flag in each command.

For example, if you have another profile called prod, you can use it like this:

```
aws ec2 describe-instances --profile prod
```

---
To configure the AWS CLI using environment variables (which you can store in a .env file)

This method is often used for automation or to keep credentials out of your configuration files.


*1. Create a .env File*

First, create a .env file in your project or home directory (or wherever you prefer). This file will contain environment variables that the AWS CLI will use.


For example, create a .env file like this:

AWS_ACCESS_KEY_ID: Your AWS access key.

AWS_SECRET_ACCESS_KEY: Your AWS secret access key.

AWS_DEFAULT_REGION: Your preferred AWS region (e.g., us-east-1).

AWS_OUTPUT: Optional, can be json, text, or table for the format of output.

*2. Load Environment Variables*

You can load the environment variables into every  shell session by sourcing the .env file. 

```
source .env
```

- This will load the environment variables into your current shell session, and the AWS CLI will automatically pick up the credentials and region configuration from these variables.

*3. Verify the Configuration*
```
aws s3 ls
```


> Every new shell session needs to source the .env file or load it in some way


 **Automate Loading .env**

- If you're working with an automation tool like Docker or CI/CD pipelines (e.g., GitLab CI, GitHub Actions, Jenkins), you can set these environment variables in the pipeline configuration as well.

- For example, in a Dockerfile or docker-compose.yml, you can set these variables using the ENV directive:

```
Dockerfile Example:
ENV AWS_ACCESS_KEY_ID=your-access-key-id
ENV AWS_SECRET_ACCESS_KEY=your-secret-access-key
ENV AWS_DEFAULT_REGION=us-east-1
```