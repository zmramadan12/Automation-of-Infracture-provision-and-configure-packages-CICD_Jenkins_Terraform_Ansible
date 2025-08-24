# Automation-of-Infracture-provision-and-configure-packages-CICD_Jenkins_Terraform_Ansible

🚀 EC2 Automation with CI/CD

This repository demonstrates how to automate the provisioning of an AWS EC2 instance, configure required packages, and deploy a static HTML website using a CI/CD pipeline.

🔧 Tools Used

Jenkins → CI/CD pipeline

Terraform → EC2 provisioning

Ansible → Configure required packages on EC2

⚙️ Execution Steps 1️⃣ Setup Tools on Server

Use a local server or cloud VM to install Jenkins, Terraform, and Ansible.

Clone this repository and run the provided JenkinsTerraformAnsbilesetup.sh script to install everything:

chmod 700 JenkinsTerraformAnsbilesetup.sh ./JenkinsTerraformAnsbilesetup.sh

If successful, you will see:

Jenkins, Ansible, and Terraform Installed successfully

2️⃣ AWS Console (Manual Setup)

Create an Access Key (IAM → Security Credentials) → used by Terraform for authentication.

Create an EC2 Key Pair → required by Terraform to create EC2 while selecting Key name & Ansible for SSH into the instance

Create a Security Group:

Port 22 → your local system IP (for SSH)

Port 80 → 0.0.0.0/0 (for website access)

3️⃣ Jenkins Setup

Access Jenkins at:

http://:8080

Unlock Jenkins using the initial admin password shown on your server.

Install recommended plugins.

Add AWS credentials under:

<img width="1901" height="441" alt="image" src="https://github.com/user-attachments/assets/c695d60a-fd8c-4853-92b3-6e95ff377170" />


Manage Jenkins → Credentials

Use Secret Text for AWS keys and Secret File for .pem key.

image
✅ Required plugins: Terraform, Ansible, Pipeline

image
Restart Jenkins:

<img width="1919" height="1021" alt="image" src="https://github.com/user-attachments/assets/854b9c15-3e99-496b-a06f-4ea4252876eb" />


http://:8080/restart

4️⃣ Automate EC2 Provisioning with CI/CD

In Jenkins, create a New Job → Pipeline.

Select Pipeline script from SCM to fetch code from this repository.

Run the pipeline → Terraform provisions EC2, and Ansible configures it.

image
After a successful build, copy the Public IP of the EC2 instance.

<img width="1919" height="1021" alt="Screenshot 2025-08-23 185946" src="https://github.com/user-attachments/assets/f1589ba7-cb29-4d33-a672-c467a7f95908" />


take the public ip of newly ec2 and open it on browser to see your static website .

Open the IP in your browser → Static HTML website should be visible 🎉
