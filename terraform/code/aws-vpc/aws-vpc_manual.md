# AWS VPC Manual Creation 
- navigate to the AWS console and search for VPC (Virtual Private Cloud). 

- Select "Create VPC" and choose the "VPC Only" option to set up a basic VPC. 
- Assign a name to your VPC, such as "My VPC". 
- Define a CIDR (Classless Inter-Domain Routing) block for your VPC, specifying the IP address range (e.g., 
10.0.0.0
/
16
10.0.0.0/16). 
 
   - The CIDR block can range from /16 to /28, with /16 providing approximately 65,000 IP addresses. 

- Select IPv4 only, if IPv6 is not required. 

This action establishes your private virtual cloud environment. 

---
**Subnet Configuration**

- After VPC creation, proceed to create subnets within it by navigating to the "Subnets" section and clicking "Create subnet". 

- When prompted, select your newly created VPC, "My VPC", as the parent VPC for the subnets. 

***Public Subnet Creation:***

- Name the first subnet "Public Subnet". 

- Choose an Availability Zone (e.g., eu-north-1a) to host this subnet. 

- Assign a CIDR block for the public subnet (e.g., 
10.0.1.0
/
24
10.0.1.0/24), which provides 256 IP addresses. 

***Private Subnet Creation:***
- Add a new subnet and name it "Private Subnet". 
- You can choose the same or a different Availability Zone, as all zones within the same VPC can communicate. 

- Assign a CIDR block for the private subnet (e.g., 
10.0.2.0
/
24
10.0.2.0/24), also providing 256 IP addresses. 

Upon completion, your VPC will contain both a public and a private subnet. 

---
**Route Tables and Internet Gateway Setup**

- A default route table, also known as the main route table, is automatically created with your VPC. 

- Initially, both your public and private subnets are implicitly associated with this main route table. 

- The default route in this table typically directs traffic outside your VPC's CIDR range (e.g., 
0.0.0.0
/
0
0.0.0.0/0) towards an Internet Gateway if one is attached. 

- To allow the public subnet to access the internet, an Internet Gateway (IGW) is required. 

- *Create a new Internet Gateway (e.g., "My IGW").* 

- Attach the created IGW to your "My VPC" via the actions menu.

- Next, create a custom route table (e.g., "My Route Table") specifically for your public subnet and associate it with "My VPC". 

**Associate the Public Subnet:**
- Navigate to "My Route Table" and go to "Subnet Associations". 

- Edit the associations to explicitly link the "Public Subnet" with "My Route Table". 

- The private subnet will remain associated with the main route table. 

**Configure Routes for Public Subnet:**
- In "My Route Table", go to "Routes" and edit them. 
- Add a new route where the destination is 
0.0.0.0
/
0
0.0.0.0/0 (all internet traffic) and the target is your "My IGW". 
- This configuration ensures that traffic from the public subnet can reach the internet through the Internet Gateway. 

Here is a flowchart illustrating the VPC setup process:
AWS VPC Setup Flow

![AWS VPC Setup Flow](/terraform/code/aws-vpc/AWS%20VPC%20Setup%20Flow.png)


---
Launching an EC2 Instance in the Custom VPC
---

To verify the VPC setup, launch an EC2 instance. 

- Go to EC2 and click "Launch Instance", naming it (e.g., "My Web Server"). 
- In the network settings, specifically choose your custom "My VPC" instead of the default VPC. 
- Select the "Private Subnet" for the EC2 instance, especially if it's for a database server or a resource that shouldn't be directly exposed to the internet. 

- For a private subnet, disable "Auto-assign Public IP" as it's not needed. 

- Proceed to launch the instance. 

The newly created EC2 instance will now be running within your custom VPC and utilizing the specified private subnet. 



