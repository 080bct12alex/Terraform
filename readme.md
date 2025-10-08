# Terraform

Terraform is an open-source IaC (Infrastructure as Code) tool.

    Infrastructure as Code (IaC) means you can create and manage cloud infrastructure using code and configuration files instead of manual steps.

Terraform supports multiple cloud providers like AWS, GCP, k8s and Azure, providing a single solution to manage multiple clouds.

---
 Traditional vs Terraform Approach
---
**Traditional way:**
```
Log in to cloud console → create resources manually → fill forms → repeat for every resource.
```
- Manual, repetitive, error-prone.

**Terraform way:**

- Write a config file describing what you want.

- Example:
```
Specify cloud provider (AWS, GCP, Azure).

Specify region/location for resources.

Specify resource type (VM, database, etc.).
```
- Terraform handles the underlying creation steps automatically.

