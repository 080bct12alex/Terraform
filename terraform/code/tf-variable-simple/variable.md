In Terraform, a **variable** is a named value that allows you to parameterize your configurations — making them reusable, flexible, and easier to manage.

---
**Basics 👇**
-
**🧱 1. Declaring a Variable**

- using the variable block:

```
variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}
```

    description – explains what the variable is for.


    type – restricts input type (string, number, bool, list, map, etc.).

    default – optional; provides a fallback value.

**⚙️ 2. Using a Variable**

- reference a variable with the var keyword:

```
provider "aws" {
  region = var.region
}
```


**💬 3. Assigning Values**

There are multiple ways to set variable values:

Option 1: terraform.tfvars file

    region = "ap-south-1"

Option 2: Command line
```
terraform apply -var="region=ap-south-1"
```
Option 3: Environment variable (.env)
  ```
  export TF_VAR_region="ap-south-1"
```



**🧠  Example Project Structure**
```
main.tf
variables.tf
terraform.tfvars
```

- variables.tf

```js
variable "project_name" {
  description = "Name of the project"
  type        = string
}
```

- terraform.tfvars

```
project_name = "MyApp"
```

- main.tf
```
output "project" {
  value = var.project_name
}
```


---

💡 You Can Also:

- Use different .tfvars files for environments:

```
dev.tfvars
prod.tfvars
```

Then apply like this:
```bash
terraform apply -var-file="dev.tfvars"
```

✅ In short:

| File               | Purpose                                 |
| ------------------ | --------------------------------------- |
| `variables.tf`     | Declares what variables exist           |
| `terraform.tfvars` | Gives actual values for those variables |
| `main.tf`          | Uses them with `var.<name>`             |
