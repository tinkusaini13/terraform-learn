locals {
  staging_env = "staging"
  az = "ap-south-1a"
}
#create VPC
resource "aws_vpc" "staging-vpc" {
cidr_block = "10.0.0.0/16"
enable_dns_support = "true" #gives you an internal domain name
enable_dns_hostnames = "true" #gives you an internal host name
instance_tenancy = "default"  
tags = {

        Name = "${local.staging_env}-vpc"
}        
  
}

# create subnet

resource "aws_subnet" "staging-subnet" {
vpc_id = aws_vpc.staging-vpc.id
cidr_block = "10.0.0.0/16"
availability_zone = "${local.az}"
map_public_ip_on_launch = "true"

tags = {
  Name =  "${local.staging_env}-subnet"
}
  
}

# create internet getway
resource "aws_internet_gateway" "staging-igw"{
vpc_id = aws_vpc.staging-vpc.id
tags = {
  Name = "${local.staging_env}-igw"
}
}

### Create Custom Route Table
resource "aws_route_table" "staging_route-tb" {
  vpc_id = aws_vpc.staging-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.staging-igw.id
  }
}

#### associate route table to subnet

resource "aws_route_table_association" "staging-route-tb-associate" {
       subnet_id = "${aws_subnet.staging-subnet.id}"
       route_table_id = "${aws_route_table.staging_route-tb.id}"
  
}

# aws instance 

resource "aws_instance" "create-ec2" {
ami = "ami-0287a05f0ef0e9d9a"
instance_type = "t2.micro"
subnet_id = aws_subnet.staging-subnet.id
availability_zone = "${local.az}"

tags = {
        Name = "${local.staging_env}-create-ec2"
} 
}
