# AWS EC2 Manual Instance Creation

- The selected AWS region determines where your virtual machine (VM) or server will be created. 
 

**Launching an EC2 Instance**
- On the EC2 page, click on "Launch Instance" to start the creation process. 

- First, provide a name for your server, such as "My Web Server". 

- Next, select the Operating System (OS) for your instance; options include Amazon Linux 2, Windows, and Red Hat, with default choices often suitable for initial setup. 

*Key Pair and Network Configuration*
- Create a key pair for secure login, giving it a descriptive name like "My Web Server H01". 

   - This key pair file will be downloaded to your local system and is essential for remote access to your server. 

- In the network settings, create a security group. 
Configure the security group to allow SSH traffic from anywhere so you can remotely access the instance. 
   - If the instance will function as a web server, you must also allow HTTP traffic from the internet. 

- For storage, the default settings are typically sufficient and can be accepted. 




*Finalizing the Launch*
- After configuring all settings, review the summary on the right side of the page. 
- Finally, click "Launch Instance", and your instance will be up and running shortly. s



