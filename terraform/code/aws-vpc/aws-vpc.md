# Virtual Private Cloud (VPC) 
- A Virtual Private Cloud (VPC) is a private, isolated network created within the AWS cloud. 

>  The concept of a private network within a cloud platform is general, though names may differ across providers (e.g., Azure's Virtual Network). 

- VPCs are essential for securing, isolating, and controlling a network environment, offering greater customization and management capabilities compared to shared networks. 

- Once a VPC is created, it becomes isolated from AWS's default shared network infrastructure. 

 **AWS Global Infrastructure: Regions and Availability Zones**

*Regions:*
- AWS operates globally, with its services deployed in various Regions worldwide. 

- A Region represents a geographical area, city or place, where AWS data centers are located (e.g., Mumbai). 

- Users select a Region based on factors such as the target audience's location to optimize performance and compliance. 


*Availability Zones (AZs)*
- Within each Region, there are multiple Availability Zones (AZs), which are distinct, isolated data centers. 

- AZs are designed to prevent single points of failure, ensuring high availability and fault tolerance for deployed applications. 
Each AZ consists of physical servers where resources are actually deployed. 
---
# Building  VPC
---
**CIDR Blocks and IP Addressing**

- When creating a VPC, a Classless Inter-Domain Routing (CIDR) block of IP addresses is assigned, defining the private IP address range for the network. 
  
  - A CIDR block is formatted as IP_address/prefix_length (e.g., 10.0.0.0/16). 
The initial numbers represent 8-bit segments, forming a total of 32 bits for IPv4. 
   
    - The /prefix_length (e.g., /16) determines the number of available IP addresses within the VPC; for instance, /16 provides over 65,000 IPs, while /28 provides 16 IPs. 
    
    - The valid CIDR range for VPC creation is typically between /16 and /28. 

---
**Subnets:** 

> *Segmentation and Resource Placement*
- A subnet is a smaller, segmented portion of the larger VPC network. 
- The total IP addresses within a VPC are divided among its subnets (e.g., a VPC with 100 IPs can be split into two subnets of 50 IPs each). 
- Crucially, AWS resources, such as EC2 instances, are deployed within subnets, not directly into the VPC. 
- Each subnet is associated with a specific Availability Zone within its Region.

- A single AZ can host multiple subnets, or subnets can be distributed across different AZs for increased resilience. 
- Public subnets are designed for resources that require internet access (e.g., front-end web servers). 
- Private subnets are used for resources that should remain isolated from the internet (e.g., databases), enhancing security. 

Here is a flowchart illustrating the basic VPC structure and how resources gain internet access:
VPC Structure & Internet Access Flow

![VPC Structure & Internet Access Flow](/terraform/code/aws-vpc/VPC%20Structure%20&%20Internet%20Access%20Flow.png)






---


**Routing Tables:**

> Directing Network Traffic

- A routing table contains a set of rules, called routes, that determine how network traffic is directed within the VPC. 
- Each subnet is associated with a routing table, which dictates where data flowing from that subnet should be forwarded. 

- For example, a routing table might direct traffic from a public subnet to an Internet Gateway or from a private subnet to a VPC Endpoint. 
> AWS provides a default VPC with a main routing table that typically routes all traffic to an Internet Gateway, making resources public by default. 

---
*VPC Connectivity and Security*
---

**Internet Gateway (IGW):** 

> Public Internet Access

- An Internet Gateway (IGW) is a horizontally scaled, redundant, and highly available VPC component that enables communication between instances in your VPC and the internet. 

- An IGW is attached to the VPC and serves as the entry and exit point for internet-bound traffic. 

- To allow instances in a subnet to access the internet, the subnet's routing table must contain a route to the IGW.

---
**Security Groups:**
> Instance-Level Firewall
- Security Groups act as virtual firewalls that control inbound and outbound traffic for individual instances.

- They are instance-specific, meaning different instances within the same subnet can have unique security groups, or instances can share a common security group. 

- Security groups primarily **define allow** rules for traffic; anything not explicitly allowed is implicitly denied. 

- Rules are configured for both inbound and outbound traffic (e.g., allowing HTTP on port 80). 

---
**Network Access Control Lists (NACLs):**
> Subnet-Level Firewall

- Network Access Control Lists (NACLs) function as firewalls at the subnet level, controlling traffic flowing in and out of one or more subnets. 

- Unlike security groups, NACLs can **explicitly allow or deny** specific traffic.  

- Any instance within a subnet associated with a NACL is subject to its rules. 

- NACLs have both inbound and outbound rules, with explicit allow and deny actions. 




---
**NAT Gateway:**
> Private Outbound Internet Access

- A NAT (Network Address Translation) Gateway enables instances in a private subnet to initiate outbound connections to the internet or other AWS services. 

- Crucially, it prevents external internet sources from initiating inbound connections to those private instances, maintaining their isolation. 

- This allows private resources (e.g., databases) to download updates or make necessary outbound requests without being publicly exposed. 

- The private subnet's routing table directs outbound internet traffic to the NAT Gateway, which then uses an Internet Gateway to reach the internet. 

---
**VPC Peering:**

> Inter-VPC Communication
- VPC Peering establishes a private connection between two VPCs, allowing them to communicate as if they were part of the same network. 

- This capability extends across different AWS Regions, enabling private traffic routing between VPCs in various geographical locations. 


---
**VPC Endpoints:**

> Private AWS Service Connectivity

- VPC Endpoints enable private connections from a VPC to supported AWS services (e.g., Amazon S3) without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect. 

- This enhances security by keeping traffic between the VPC and AWS services within the AWS network. 

---
**Bastion Host:**

>  Secure Access to Private Instances

- A Bastion Host (also known as a jump server) is a public instance deployed in a public subnet that provides secure, controlled access to instances located in private subnets. 

- Users first connect to the public Bastion Host and then, from there, can securely access the privately located instances. 
---
**Advanced VPC Features**
---
**Elastic IP Addresses:** 
> Static Public IPs

- An Elastic IP (EIP) address provides a static, public IPv4 address designed for dynamic cloud computing environments. 

- Unlike standard public IPs, which change when an instance is stopped and restarted, an EIP remains constant. 

-This persistence is vital for applications or services that require a fixed public IP address for connectivity. 

---
**VPC Flow Logs:** 
>Network Traffic Monitoring
- VPC Flow Logs capture detailed information about the IP traffic that flows through a VPC. 

- They record metadata about incoming and outgoing network activities, serving as a logging service for network diagnostics and security monitoring. 

---
**Direct Connect:**
>  Dedicated On-Premises to AWS Connection
- AWS Direct Connect establishes a dedicated, private network connection from an on-premises data center directly to AWS. 

- This service is crucial for organizations requiring secure, high-bandwidth, or low-latency connectivity to their AWS resources, bypassing the public internet. 

**AWS Client VPN:** 
> Secure Remote Access
- AWS Client VPN is a managed service that provides secure, remote access to AWS resources and on-premises networks using a VPN connection. 

- It allows users to securely connect from any location to their AWS-hosted applications and data. s



