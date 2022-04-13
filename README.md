## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![](diagrams/ELK-Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the _____ file may be used to install only certain pieces of it, such as Filebeat.

  -install-elk.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available/reliable, in addition to restricting access to the network.
- Load balancers protects the system from DDOS attacks by rerouting traffic from one server
 to another if the server becomes unavailable for one reason or  which eliminates single points of failure. A jump box can serve as a
bridge between other networks which offers an additional layer of security which could be very advantageous. 
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system metrics.
- Filebeat monitors log files
- Metricbeat monitors the metrics and other statistics and sends them to various outputs such as Elasticsearch or Logstash.

The configuration details of each machine may be found below.
_Note: Use the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables) to add/remove values from the table_.

| Name     | Function | IP Address | Operating System |
|----------|----------|------------|------------------|
| Jump Box | Gateway  | 10.0.0.4   | Linux            |
| Web-1    |webservers| 10.0.0.7   | Linux            |
| Web-2    |webservers| 10.0.0 6   | Linux            |
| Web-3    |webservers| 10.0.0.8   | Linux            |
| ELK-1    |elkserver | 10.1.0.4   | Linux            |       
### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box-Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- My IPv4

Machines within the network can only be accessed by ssh/Port 22.
- Jump-Box-Provioner: Private IP:10.0.0.4

A summary of the access policies in place can be found in the table below.

| Name                 | Publicly Accessible | Allowed IP Addresses          |
|----------------------|---------------------|-------------------------------|
| Jump-Box-Provisioner | Yes                 |My IPv4                        |
| Web-1                | No                  |10.0.0.4                       |
| Web-2                | No                  |10.0.0.4                       |
| Web-3                | No                  |10.0.0.4                       |
| ELK-1                | Yes                 |My IPv4(P.5601), 10.0.0.4(p.22)|
### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Convenience is a major advantage of using ansible to automate configuration. There would be no need to got through the tedious process of creating
them manually.
The playbook implements the following tasks:
- Install docker.io, python3.pip and docker module
- Increase Virtual memory
- Use more memory
- Download and Launch a docker elk container
- Enable docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![](diagrams/docker ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1 10.0.0.7
- Web-2 10.0.0.6
- Web-3 10.0.0.8
We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects various log files such as server logs and forwards them to various outputs like Elasticsearch
or Logstash.
- Metricbeat collects system metrics such as apache and forwards them to to various outputs like Elasticsearch or
Logstash.
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml and metricbeat-playbook.yml file to /etc/ansible/roles
- Update the /etc/ansible/hosts file to include
- [webservers]
- 10.0.0.7 ansible_python_interpreter=/usr/bin/python3
- 10.0.0.6 ansible_python_interpreter=/usr/bin/python3
- 10.0.0.8 ansible_python_interpreter=/usr/bin/python3
- [elk]
- 10.1.0.4 ansible_python_interpreter=/usr/bin/python3_
- Run the playbook, and navigate to http://20.97.176.107:5601/app/kibana to check that the installation worked as expected.
Answer the following questions to fill in the blanks:
- Which file is the playbook? Where do you copy it? install-elk.yml; /etc/ansible
- Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?
/etc/ansible/hosts
- Which URL do you navigate to in order to check that the ELK server is running?
 http://20.97.176.107:5601/app/kibana
As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
ansible-playbook /etc/ansible/install-elk.yml
