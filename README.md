# turbo-disco
Boot camp projects. 
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![image](https://github.com/danderson589/turbo-disco/blob/50587e7e097290396de9c9e7fdb43f51157e8409/Diagrams/Project%201%20Diagram.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

[/etc/ansible/roles/install-elk.yml](https://github.com/danderson589/Project1/blob/59f18cd8cfa793f26c34ce6f3b882f0319aa7556/Ansible/install-elk.yml)
This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.

The aspect of security that load balancers protect is availability. The advantage of using a jump box is that there is much less risk, because it is a secure computer that can be used as a point of origin for other servers or environments. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.

Filebeat monitors the log files that you specify and collets log events, it then forwards it to Elasticsearch or logstash. 

Metricbeat helps you monitor your servers by collecting different metrics from your system and what is running on the server. 

The configuration details of each machine may be found below.

| Name     | Function      | IP Address | Operating system |
|----------|---------------|------------|------------------|
| Jump Box | Gateway       | 10.0.0.4   | Linux            |
| Web 1    | DVWA          | 10.0.0.5   | Linux            |
| Web 2    | DVWA          | 10.0.0.6   | Linux            |
| Web 3    | DVWA          | 10.0.0.8   | Linux            |
| Elk      | ELK Container | 10.1.0.4   | Linux            |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
my personal IP

Machines within the network can only be accessed by Jump Box.
The machine that I allowed to acess my ELK VM was the Jump Box the IP address is 10.0.0.4
A summary of the access policies in place can be found in the table below.

| Name     	| Publicly Accessible 	| Allowed IP Addresses |
|----------	|---------------------	|----------------------|
| Jump Box 	| Yes                  	| my personal IP       |
| Web 1    	| No                  	| 10.0.0.4             |
| Web 2    	| No                  	| 10.0.0.4             |
| Web 3    	| No                  	| 10.0.0.4             |
| Elk      	| No                  	| 10.0.0.4             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it helps IAC or Infrastructure as Code. It is also because it limits access to the server because you are having to go through the Jumb Box. It also makes it so that if you have to make 

The playbook implements the following tasks:
- First you install dockder.io using the apt module. When putting in the task make sure you “update_cache” name “docker.io” and write the “state” as present. While still using the apt module you will also install pip3. For this you will need to “force_apt_get” name “python3-pip” and once again state as “present.” 
- For the next section you will be using the pip module.  We will be installing docker python module in this step. You will need the Name “docker” and the state as “present.”
-For the next step you will be using the sysctl module.  In this step we will be seting up the machine to use more memory.  In the Name section you will put “vm.max_map_count” then in the value section “262144” then state “present”.  Then the last part of this task is reload “yes.”
-In this section you download and launch a docker elk container.  This will be done in the docker_container module.  In this step you will download the sebp/elk:761 image.  You will also put in the published_ports in this step the ports are 5601, 9200, 5044.  

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.
[Images/part4.png ](https://github.com/danderson589/turbo-disco/blob/49ae89bea7861623712a525108ebc2c5bbfa94fd/Images/part4.png)
 
### Target Machines & Beats

This ELK server is configured to monitor the following machines:
 (10.0.0.5), (10.0.0.6), (10.0.0.8).

We have installed the following Beats on these machines:
The two beats that are on the machines are filebeat and metricbeat. 
[filebeat-metricbeat-playbook.yml](https://github.com/danderson589/turbo-disco/blob/904abb76be0c7a4686ff9c458cbadb043972bc8b/Ansible/filebeat-metricbeat-playbook.yml)

These Beats allow us to collect the following information from each machine:
Filebeats collects and files log events. It then forwards them to Elasticsearch for indexing.  
Metricbeats collects different metrics on the machines that are running. It shows different graphs and charts to show activity on the network.

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy [filebeat-config.yml](https://github.com/danderson589/turbo-disco/blob/94cdf3094459f17568820ac9c400ceaa92deb48e/Ansible/filebeat-config.yml) file to /etc/ansible/files.
- Update the filebeat-config.yml file to include the correct IP addresses for the ELK VM. 
- Run the playbook, and navigate to kibana and navigate to add log data, and then to system logs and click DEB once finished scroll to the bottom of the page and click check data.  You can then navigate to verify incoming data by clicking the link to check that the installation worked as expected.

- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
You will need to update the the spacific configuration files to tell Ansible which machine or machines to run the playbook on.  You specify which machine is installing the playbook by in the updateing the host to say webservers in the playbook.  In the ELK playbook you would put the host as elk. 

The URL that you navigate to in order to check that the ELK server is running is http://<yourelkvmpublicIP> http://20.124.15.177:5601/app/kibana.

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
  
 
The command you will need to run the playbook is
Ansible-playbook [name of playbook]

The command to download the config files
Curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/filebeat-config.yml

The Command to get into the config files to up date them is.
Nano /etc/ansible/files/filebeat-config.yml
Nano /etc/ansible/files/metricbeat-config.yml .[metricbeat-config.yml].(https://github.com/danderson589/turbo-disco/blob/cbb10827c06e86e251d4c0bfc883a471f95dbeb8/Ansible/metricbeat-config.yml)
