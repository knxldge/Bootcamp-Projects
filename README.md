## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

!(Images/ELK_Network_Stack_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the config file may be used to install only certain pieces of it, such as Filebeat.

																
	Playbook File:												
	==> Web Server Playbook: Playbook_Files/my-playbook.yml									
	==> ELK VM w/ Docker: Playbook_Files/install-elk.yml									
																
	==> Filebeat Installation:Playbook_Files/filebeat-playbook.yml								
	----| 	Will need a config file for this playbook: Playbook_Files/Config_Files/filebeat-config.yml			
	*** Will need to edit the drop in filebeat.yml destination for this file ***					
																
	==> Metricbeat Installation:Playbook_Files/metricbeat-playbook.yml							
	----| 	Will need a config file for this playbook: Playbook_Files/Config_Files/metricbeat-config.yml			
		*** Will need to edit the drop in metricbeat.yml destination for this file ***					
																
																
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting outside threats to the network.
What aspect of security do load balancers protect? What is the advantage of a jump box?

		- Load Balancers Protect the high amount of incoming traffic to your webservers. Load Balancer will distribute traffic evenly between available servers.
			The advantage of the jump box is that its able to access and manage a device/VMware in a separate security zone. within this Project 1 (Ability to access 3x Web Servers + 1x ELK Server)
FINRU
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the availability and system integrity

What does Filebeat watch for?
		Collects Data about the file system changes and the time of change 

What does Metricbeat record?
		Collects Machine Metrics such as uptime (measurement of a system of how healthy the VMware is)

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name                  | Function  | IP Address                               | Operating System                           	    |
|-----------------------|-----------|------------------------------------------|----------------------------------------------------|
| ELK-server            | Database  | Priv IP: 10.2.0.4 Pub IP: 20.70.0.98     | Linux Version: ubuntu 18.04	(ELK Container)     |
| Jumpe-Box-Provisioner | Gateway   | Priv IP: 10.0.0.7 Pub UP: 52.189.227.234 | Linux Version: ubuntu 18.04 	(Ansible Container) |
| Web-1                 | Webserver | Priv IP: 10.0.0.8                        | Linux Version: ubuntu 18.04 	(DVWA Containers)   |
| Web-2                 | Webserver | Priv IP: 10.0.0.9                        | Linux Version: ubuntu 18.04  	(DVWA Containers)   |
| Web-3                 | Webserver | Priv IP: 10.0.0.10                       | Linux Version: ubuntu 18.04 	(DVWA Containers)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the "Jumpe-Box-Provisioner" machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:

Whiteisted IP Address's
 -------------------------------------------------------------------------------------------------------------------
| Name                  | Function  | IP Address               | Operating System                           	    |
|-----------------------|-----------|--------------------------|----------------------------------------------------|
| Primary Workstation   | Gateway   | Pub IP: 101.180.87.233   | Windows Version: Windows 10 Pro (19043.1348)       |

Machines within the network can only be accessed by Jumpe-Box-Provisioner within Anisble Container.
Which machine did you allow to access your ELK VM? What was its IP address?

Machine to Access the ELK VM:
 -------------------------------------------------------------------------------------------------------------------
| Name                  | Function  | IP Address               | Operating System                           	    |
|-----------------------|-----------|--------------------------|----------------------------------------------------|
| Jumpe-Box-Provisioner | Gateway   | Pub IP: 52.189.227.234   | Linux Version: ubuntu 18.04 (Ansible Container)    |


A summary of the access policies in place can be found in the table below.

| Name                  | Publicly Accessible | Allowed IP Addresses 		|
|-----------------------|---------------------|---------------------------------|
| Jumpe-Box-Provisioner | No                  | 101.180.87.233       		|
| ELK-Server            | No                  | 10.0.0.7, 101.180.87.233	|
| Web-1                 | No                  | 10.0.0.7             		|
| Web-2                 | No                  | 10.0.0.7             		|
| Web-3                 | No                  | 10.0.0.7             		|

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
What is the main advantage of automating configuration with Ansible?
		Advantages:
			==> Ability to configure multiple web servers within the network
			==> Efficient - No servers, daemons or database required for Ansible to work.

The playbook implements the following tasks:
In 3-5 bullets, explain the steps of the ELK installation play. E.g., install Docker; download image; etc._

			==> Install Docker
				- Installs a light weight virtual box called "Containers"

			==> Install Python3-pip
				- Installs a Programming Software used to Install and Managed Software 

			==> Install Docker Module
				- Python Client fo Docker - Required by Ansible to control the state of Docker Containers

			==> Increase Virtual Memory
				- Max Virtual memory of the Virtual Box

			==> Use More Memory
				- Configures VM to use more memory *** ELK Container will not run without this setting ***

			==> Download and Launch Docker ELK Container
				- Download Docker Elk Image and Launch ELK w/ Published Ports to run

			==> Enable Docker on Boot
				- Enable Docker on start up

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
!(/Images/docker_ps)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
List the IP addresses of the machines you are monitoring_

| Name                  | Function  | IP Address                               | Operating System                           	    |
|-----------------------|-----------|------------------------------------------|----------------------------------------------------|
| Web-1                 | Webserver | Priv IP: 10.0.0.8                        | Linux Version: ubuntu 18.04 	(DVWA Containers)   |
| Web-2                 | Webserver | Priv IP: 10.0.0.9                        | Linux Version: ubuntu 18.04  	(DVWA Containers)   |
| Web-3                 | Webserver | Priv IP: 10.0.0.10                       | Linux Version: ubuntu 18.04 	(DVWA Containers)   |

We have installed the following Beats on these machines:
Metricbeat & Filebeat
		
These Beats allow us to collect the following information from each machine:
In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._
			==> Filebeat: 

				- Filebeat helps generate and organize log files to send to Logstash and Elasticsearch. logs information about the file system, including which files have changed and when.

			==> Metricbeat: 

				- Collects Machine Metrics such as uptime (measurement of a system of how healthy the VMware is)
		
### Using the Playbook & Installation Process
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:

Installation: ELK Container
- Copy the ** install-elk.yml ** file to /etc/ansible/install-elk.yml.

- Update the host file to include group 'elk' with:  <IP ADDRESS> ansible_python_interpreter=/usr/bin/python3

- Run the playbook **ansible-playbook install-elk.yml **, and navigate to ** Your ELK Server - http://***Pub IP Address***/app/kibana#** to check that the installation worked as expected.

Installation: Filebeat
- Copy the ** filebeat-playbook.yml **  file to etc/ansible/filebeat-playbook.yml.

- Update the host file to include group 'webservers' with: <IP ADDRESS> ansible_python_interpreter=/usr/bin/python3

- Create a directory ** /etc/ansible/files ** and  copy the config file ** filebeat-config.yml ** to /etc/ansible/files/filebeat-config.yml

- Run the playbook **ansible-playbook filebeat-playbook.yml **, and navigate to ** Your Web Server ** to check that the installation worked as expected.

- Addition: Navigate to the Kibana weblink: http://<IP ADDRESS>/app/kibana#/home/tutorial/systemLogs - Check Data for confirmation
!(/Images/filebeats_screenshot)

Installation: Metricbeat
- Copy the ** metricbeat-playbook.yml ** file to /etc/ansible/metricbeat-playbook.yml.

- Update the host file to include group 'webservers' with: <IP ADDRESS> ansible_python_interpreter=/usr/bin/python3

- Create a directory ** /etc/ansible/files ** and copy the config file ** metricbeat-config.yml ** to /etc/ansible/files/metricbeat-config.yml

- Run the playbook **ansible-playbook metricbeat-playbook.yml **, and navigate to ** Your Web Server ** to check that the installation worked as expected.

- Addition: Navigate to the Kibana weblink: http://<IP ADDRESS>/app/kibana#/home/tutorial/dockerMetrics - Check Data for confirmation
!(/Images/metricbreats_screenshot)

### Installation Commands Tips
Ansible Command:

Jump-Box:
Command:
Start Anisble Container:
	$ sudo docker start <Ansible: Container - Name> 

Attach Anisble Container:
	$ sudo docker attach <Anisble: Container - Name>

**** NOTE: To find the container name: $ sudo docker container list -a ****

Ansible Docker:
Move to the Ansible Directory:
	$ cd /etc/ansible
NOTE: The files should be within the directory as instructed above

	$ anisble-playbook < YML.File >


### Test The System
Once the ELK System is up and running such as all files have been implemented for each webservers and ELK Servers. Once all confirmed, this should link with your kibana site.

We can now test the system!

### SSH Barrage
**** Please Note: The Script can be located via: Scripts/DDoS-Script.sh ****

The following test, We will need to navigate to 'Logs' Page:
!(/Images/Kibana_site)

The script is using a 'Nested Loop' where it will continue to ssh to the VM Box over and over again.

Run in Terminal './DDoS-Script.sh'
**** Please Note: You will need to make the file executable via 'sudo chmod x+ DDoS-Script.sh' ****

#### Example of DDoS Attack
Notice the logs have been presented with multiple enteries of an attacker attempting to SSH into your VM Box
!(/Images/DDoS_Attack)

### WGET-DoS Attack
**** Please Note: The Script can be located via: Scripts/wget-Script.sh ****
**** Please Note: If necessary to obtain 'wget' function via 'sudo apt install wget'

The following test, We will need to navigate to 'metrics' Page:
!(/Images/Kibana_site)

The script is using a 'Nested Loop' feature for wget of where it will continue to obtain files from a specific webserver over and over again.

Run in Terminal './wget-Script.sh'
**** Please Note: You will need to make the file executable via 'sudo chmod x+ wget-Script.sh' ****

#### Example of WGET Attack
Notice the CPU Usage is obtaining high amounts of traffic to its server due to consistantly offering their files.
!(/Images/Web-1_CPU_Usage_ Stressed Test)

### Stress Test
The use of a stress function determines how your VMware or server is coping within a stressful environment.

- To do this: SSH into one of your web servers, eg. Web-1, Web-2, Web-3

- Install Stress via: 'sudo apt install stress'

- Run the Stress Command: 'sudo stress --cpu 1 -timeout 120'
*** This will begin stressing your server for 2 minutes ***

## Example of a Stress Test
!(/Images/Web-3_CPU_Usage_Stressed_Test)
