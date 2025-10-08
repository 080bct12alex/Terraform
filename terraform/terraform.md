# Terraform: Infrastructure as Code

Terraform is an open-source Infrastructure as Code (IaC) tool that allows users to ***create and manage cloud-based infrastructure using simple code and configuration files***. 

It supports multiple cloud platforms and providers, including AWS , K8S ,GCP, Azure , offering a unified comprehensive solution for cloud infrastructure management. 

![Terraform](/terraform/images/What-is-Terraform.png)

---

Terraform Configuration 
---
**Manual vs. IaC Workflow** 

Traditionally, creating a cloud resource like an AWS virtual machine ( EC2 instance) involves manual steps (navigate to the console and manually launch an instance by filling out various details).

With IaC tools like Terraform, the same task can be accomplished / automate this process with a configuration file a configuration file, significantly reducing manual effort. 


| Feature       | Manual Console Workflow                | IaC Tool (Terraform) Workflow         |
|---------------|---------------------------------------|--------------------------------------|
| Method        | GUI clicks, manual input, dashboard   | Simple code and configuration files  |
| Effort        | Requires significant manual work      | Automated, command-based             |
| Consistency   | Prone to human error, less consistent| High consistency, repeatable resources|
| Replicability | Difficult to reproduce exact setups   | Easy to replicate entire environments|

---


**Terraform Configuration Files**

Terraform configuration files use the .tf  or .tf.json extension

The language used in .tf is HashiCorp Config Language (HCL), which is a declarative language designed for defining infrastructure. 
    
    In a declarative language,  specify the desired end state of  infrastructure (e.g., an AWS instance with a specific ami and instance_type), and Terraform automatically handles the necessary steps to achieve that state. 
    (mention desire result not steps)

The configuration file specifies the cloud provider, the location for resource creation, and the type of resource.
 
---

**Terraform Workflow and Commands**
-
The basic working steps of Terraform involve preparing the configuration, initializing Terraform, planning changes, applying them, and destroying resources when no longer needed. 

- ***Essential Terraform commands***

```yml
 terraform init
 terraform plan 
 terraform apply 
 terraform destroy
```
![Terraform Workflow](/terraform/images/terraform%20workflow.png)

---
**Steps**

After setting up Terraform and credentials, the process begins with initialize the working directory.
 
```yml
 terraform init 
 ```
  

Next,  to preview the changes Terraform will make to the infrastructure.

```yml
terraform plan 
```

Then applies these changes, 

```yml
terraform apply 
```

creating the specified resources, often requiring user approval. 

For modifications, changes are made in the config file, and 
```yml
terraform apply
```


 is run again to update the existing resources (e.g., changing a tag on an instance). 

Once resources are no longer needed, to delete them,

```yml
terraform destroy 
```
 also requiring user approval.


    All these steps can be verified on the respective cloud provider's console. 



![Terraform Workflow](/terraform/images/Terraform-Workflow.png)
---
Benefits of Using IaC with Terraform
---

**Consistency**: 
- Resources are created identically every time, ensuring uniformity even across numerous deployments. 

**Automation:**

- Operations are command-based, allowing for scripting and automation of infrastructure provisioning and management. 

**Cost Savings:**
-  Automation enables scheduled resource uptime and destruction (e.g., only running resources for 5 hours a day), optimizing costs. 

**Repeatability:**
- Entire environments (e.g., for testing) i.e configurations used during testing can be easily replicated in production, ensuring consistency from development to deployment. 

---
Advanced Terraform Concepts
-
**State Management**:
- Terraform maintains a **.tfstate file** that stores the actual state of the managed infrastructure to track resources and their configurations. 
- Any modifications made to resources, such as tag changes, update the state file which reflects the current status of those resources.
- The state file is local by default but can be configured for remote storage for collaborative environments. 

**Dynamic Processing:** 

- Terraform enables dynamic configuration using features like functions, variables, and loops, simplifying the management and creation of resources, such as setting up accounts for multiple users effortlessly. 

**Terraform Import**
In Terraform, the ```terraform import``` command is used to bring existing infrastructure resources (created manually or by other tools) under Terraform management — without recreating them.


*🏗️ Example  — Import an AWS EC2 instance*

Suppose  Terraform configuration (main.tf) defines:

```js
resource "aws_instance" "my_ec2" {
  
}
```

- If you already have an EC2 instance running (say instance ID i-12345678), import it like this:

```bash
terraform import aws_instance.my_ec2 i-12345678
```

✅ Terraform will:

- Read the current state of that EC2 instance.

- Write it into terraform.tfstate.

- Not modify or recreate it — unless you later change the config.



🧠 Important Notes

- You must have a matching resource block in your .tf file before running the import.

- The import only updates the state file, not the configuration itself.

  After import, run:
   ```
   terraform plan
  ```


**Terraform Modules**: 
- main way of  package and reuse configuration in terraform.
- collection of .tf files kept together in directory
- These are pre-defined templates or container of a configuration that can be reused across different projects or within the same project.
- ***can host our own module in registry***


**Workspaces:** 
- Terraform Modules facilitate code reuse across different resources, allowing for using the same configuration file with different workspaces (e.g., dev, test, prod) to manage separate environments. 

**Terraform Cloud**
- Modules facilitate code reuse across different resources, allowing for easy configuration in various environments such as workspace, development, testing, and production.
 - *Terraform Cloud* enhances this process further by offering a managed service that simplifies infrastructure management.
- Terraform Cloud is a managed service by HashiCorp that simplifies Terraform workflows by providing features like remote state management, team collaboration, and a centralized platform for managing infrastructure. 



