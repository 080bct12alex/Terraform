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