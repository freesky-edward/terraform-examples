#####  Please replace all the angle brackets with your values.


#Instance part.
variable "flavor_name" {
    default = "s2.medium.1"
    description = "Define the flavor name that will be used to create instance"
}

variable "image_name" {
    default = "Standard_Ubuntu_16.04_latest"
    description = "The image of instance that you are going to created"
}

variable "instance_name" {
    default = "example_instance"
    description = "The name of the instance"
}

#network part
variable "network_cidr" {
    default = "172.16.10.0/24"
    description = "The network ip range of the network"
}

#general part
variable "az" {
    default = "eu-de-01"
    description = "The availability zone name where the resource will be created" 
}

variable "region" {
    default = "eu-de"
    description = "The region name where the resource will be created"
}

variable "tanantid" {
    default = "<YOUR_TENANT_ID>"
    description = "The project/tenant id which will be used to create elb" 
}

#security group part
variable "sg_name" {
    default = "example_sg"
    description = "The name of security name"
}

#message notification part
variable "smn_email" {
    default = "<THE_EMAIL_ADDRESS>"
    description = "The email address where will receive the message when one topic occur"
}

#load balancer part
variable "lb_protocol" {
    default = "HTTP"
    description = "Which kind of protocol the loadbalancer will take, e.g. HTTP, TCP, HTTPS"
}

variable "lb_port" {
    default = "8085"
    description = "The port which be taken to access to the loadbalancer."
}

variable "lb_method" {
    default = "ROUND_ROBIN"
    description = "The method that loadbalaner will use to. it can be ROUND_ROBIN, LEAST_CONNECTIONS, or SOURCE_IP"
}


#db part
variable "postgre_port" {
    default = "8635"
    description = "The port which can be access to the db instance."
}

variable "db_psw" {
    default = "<YOUR_DB_PASSWORD>"
    description = "The default password of the db instance."
}
