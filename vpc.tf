resource "aws_vpc" "main" {
  cidr_block = "192.168.0.0/16"
  tags = {
      Name = "group2_vpc"
  }
}
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "eu-central-1"
    map_public_ip_on_launch = true
    tags = {
        Name = "group2_elk_public_subnet"
            }
}

resource "aws_subnet" "subnet_g_beats" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.11.0/24"
    availability_zone = "eu-central-1"
    tags = {
        Name = "Beats Subnet Group"
            }
}
resource "aws_subnet" "subnet_g_ls_e" {
    vpc_id = aws_vpc.main.id
    cidr_block = "192.168.10.0/24"
    availability_zone = "eu-central-1"
    tags = {
        Name = "LS_E Subnet Group"
            }
}
resource "aws_internet_gateway" "group2_elk_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "group2_elk_igw"
  }
}

resource "aws_nat_gateway" "group2_elk_natgw" {
  subnet_id = aws_subnet.public.id

  tags = {
    Name = "group2_elk_natgw"
  }
    depends_on = [aws_internet_gateway.group2_elk_igw]
}

#git push --set-upstream origin vpc
