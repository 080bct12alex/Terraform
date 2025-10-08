# Terraform Cloud 

- Terraform Cloud is a managed service provided by HashiCorp that offers features to simplify and automate Terraform workflows. 

- Enables CI/CD for Terraform.
- Key features include 
  - remote state management, allowing Terraform state to be stored and managed securely in the cloud, similar to using an S3 bucket. 

  - It integrates with Version Control Systems (VCS) like GitHub, enabling automated runs directly from code changes in your repository. 
  - Automated runs trigger **Terraform plans** and applies automatically when changes are pushed to the connected VCS, streamlining the deployment process. 


**Getting Started with Terraform Cloud**
- To use Terraform Cloud, access its official website: app.terraform.io. 
- You can sign in using an existing HashiCorp Cloud Platform (HCP) account, often linked via GitHub, or create a free account. 
- Upon logging in for the first time, you need to create an organization, which acts as a container for your workspaces. 
- Within an organization, you create workspaces, which define how Terraform runs. 
- There are options like Version Control Workflow (automated runs based on VCS changes) and CLI-driven workflow (triggered via Terraform CLI). 

---
**Setting Up a Version Control Workflow**
- To set up a VCS-driven workflow, connect Terraform Cloud to your chosen VCS (e.g., GitHub, GitLab, Bitbucket). 
- Create a new repository in your VCS (e.g., tf-cloud-s3) and clone it locally.
- Add your Terraform configuration files (e.g., main.tf to create an S3 bucket) to the local repository and push them to your VCS. 
- Pushing changes to the VCS automatically triggers a run in Terraform Cloud. 



**Managing AWS Credentials**
- If a run fails due to missing credentials, you need to provide AWS Access Key ID and AWS Secret Access Key to Terraform Cloud. 

- Generate a new access key in your AWS IAM dashboard for a designated user (e.g., TF-cloud-User). 
- In Terraform Cloud, navigate to your workspace's Variables section. 
- Add the AWS Access Key ID and Secret Access Key as environment variables, marking them as sensitive to prevent display. 
  - You can also create variable sets to reuse credentials across multiple workspaces. 

**Automated Runs and State Management**
After credentials are set up, pushing further changes to your VCS will trigger successful automated runs. 

- Terraform Cloud performs a plan and then waits for manual confirmation to apply the changes. 
- The dashboard provides a clear presentation of the planned changes (e.g., +1 added, -1 removed). s s
- Once confirmed, Terraform Cloud executes the apply, creating or modifying resources. 

- A significant advantage is state versioning, which tracks changes to the Terraform state over time, allowing comparison of different versions and preventing state overwrites. 

**Using Variables and Destroying Resources**
- Terraform Cloud supports the use of Terraform variables and environment variables within your configurations. You can define variable values directly in the workspace's variable settings. s 


To destroy resources, 
- navigate to the workspace Settings, then Destruction & Delete. 
- Manually queue a destroy plan by entering the workspace name. 
- The destroy plan will run, requiring manual confirmation before resources are deleted. 


Optionally, you can enable auto-apply to skip the manual confirmation step, depending on your requirements.



