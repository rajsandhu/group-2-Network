resource "aws_route_table" "group2_elk_rt_public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"   
    gateway_id = aws_internet_gateway.group2_elk_igw.id
  }
  tags = {
    Name = "group2_elk_rt_public"
  }

}

resource "aws_route_table" "group2_elk_rt_private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"   
    gateway_id = aws_nat_gateway.group2_elk_natgw.id
  }
  tags = {
    Name = "group2_elk_rt_private"
  }
}

resource "aws_route_table_association" "group2_rt_public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.group2_elk_rt_public.id
}

resource "aws_route_table_association" "group2_rt_private_assoc_beats" {
  subnet_id      = aws_subnet.subnet_g_beats.id 
  route_table_id = aws_route_table.group2_elk_rt_private.id
}

resource "aws_route_table_association" "group2_rt_private_assoc_e" {
  subnet_id      =    aws_subnet.subnet_g_ls_e.id
  route_table_id = aws_route_table.group2_elk_rt_private.id
}
