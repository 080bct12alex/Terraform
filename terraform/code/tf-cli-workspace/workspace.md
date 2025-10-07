- In Terraform, a workspace is an isolated environment where you can manage a separate instance of your infrastructure using the same configuration.

      Think of workspaces as separate state files — each workspace has its own terraform.tfstate.
      This lets you use the same code to manage different environments like dev, staging, and prod.

🧩 Basic Terraform Workspace Commands

| Command                             | Description                          |
| ----------------------------------- | ------------------------------------ |
| `terraform workspace list`          | Shows all available workspaces       |
| `terraform workspace show`          | Displays the current workspace name  |
| `terraform workspace new <name>`    | Creates a new workspace              |
| `terraform workspace select <name>` | Switches to an existing workspace    |
| `terraform workspace delete <name>` | Deletes a workspace                  |
| `terraform workspace help`          | Displays workspace-related help info |

⚙️ Example Usage
```yml
# List available workspaces
terraform workspace list

# Create a new workspace for staging
terraform workspace new staging

# Switch to the staging workspace
terraform workspace select staging

# Show current workspace
terraform workspace show

# Apply changes in current workspace
terraform apply
```

**🧠 How Workspaces Affect State**

- Each workspace stores its own Terraform state:
```js
terraform.tfstate.d/
├── default/
│   └── terraform.tfstate
├── dev/
│   └── terraform.tfstate
├── staging/
│   └── terraform.tfstate
```

- So resources created in dev won’t affect those in prod.

**💡 Common Use Case**

- Use workspaces to separate environments:

```bash
resource "aws_s3_bucket" "example" {
  bucket = "myapp-${terraform.workspace}"
}
```

- If your current workspace is dev, this creates a bucket named:

      myapp-dev