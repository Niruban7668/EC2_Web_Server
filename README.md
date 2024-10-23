# EC2_Web_Server

## 1. AWS Instance Creation

I logged in into my aws account and launched two t2.micro EC2 instances with different operating systems one is Amazon Linux(3.81.112.164) and the other one is Ubuntu(54.175.210.108).

## 2. Instance setup 

Created SSH key pair to connect through SSH.  
Created Security groups with inbound rules which allows ICMP, SSH, HTTP and HTTPS traffic.  
Connected from local machine to instances using SSH key.

`ssh -i ~/.ssh/custom_key_name SYSUSER@PUBLIC_IP_ADDRESS_OF_SERVER`

## 3. Web Server configuration 

In Ubuntu instance(54.175.210.108) I created a Shell Script [webserver.sh](./webserver.sh) which automates the process of

1. Installing the web server (NGINX).
2. Creating the "Hello World" web page with OS Information.
3. Configuring the necessary firewall rules to allow HTTP/HTTPS traffic.

## 4. Cross-Instance Web Access

After successful ping of Amazon Linux instance(3.81.112.164) from Ubuntu instance(54.175.210.108) and vice versa.  
Accessed the webpage hosted in Ubuntu instance(54.175.210.108) with Amazon linux instance(3.81.112.164) and also from local machine using the public ip of the instance.  

`curl 54.175.210.108`
