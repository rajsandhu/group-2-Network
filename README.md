# group-2-Network

For the ELK stack, we need to set ups a VPC within which EC2 servers will host each application-ElasticSearch, Logstash, and Kibana

For the public and private subnets to communicate with each other and allow the EC2 servers access to the internet, there must be several resources made-- an internet gateway, NAT gateway, and a route table for each subnet.

Subnets: public, private
Internet Gateway for the VPC
NAT Gateway inside the Public subnet
Route tables and associations
Public subnet routed through the Internet Gateway
Private subnet routed through the NAT Gateway
Region: eu-central-1 - Single AZ
VPC cidr: 192.168.0.0/16
Public subnet cidir: 192.168.1.0/24
Private subnet cidir: 192.168.10.0/24
Private subnet for Beats: 192.168.11.0/24

Name of the VPC: group2_vpc
Name of the public subnet: group2_elk_public_subnet
Name of the private subnet for Logstash and Elasticsearch: LS_E Subnet Group
Name of the private subnet for Beats: Beats Subnet Group


- Implemented Github Actions
- Created the VPC Network
