resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Three -tiers-vpc"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

}

# Public Subnets

resource "aws_subnet" "pubsubaz1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet1"
    env  = "dev"
  }
}


resource "aws_subnet" "pubsubaz2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet2"
    env  = "dev"
  }
}

resource "aws_subnet" "pubsubaz3" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet3"
    env  = "dev"
  }
}

# Private subnets app

resource "aws_subnet" "priv-app-subnetaz1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-subnet1"
    env  = "dev"
  }
}

resource "aws_subnet" "priv-app-subnetaz2" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-subnet2"
    env  = "dev"
  }
}

resource "aws_subnet" "priv-app-subnetaz3" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-app-subnet3"
    env  = "dev"
  }
}

# Private subnets database

resource "aws_subnet" "priv-db-subnetaz1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-db-subnet1"
    env  = "dev"
  }
}

resource "aws_subnet" "priv-db-subnetaz2" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.7.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-db-subnet2"
    env  = "dev"
  }
}

resource "aws_subnet" "priv-db-subnetaz3" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = "10.0.8.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-db-subnet3"
    env  = "dev"
  }
}

# Main Route table

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}




# Public Route table

resource "aws_route_table" "rtpubsubaz1" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "rtpubsubaz2" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table" "rtpubsubaz3" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}





# Route Table Association


resource "aws_route_table_association" "rtapubaz1" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.pubsubaz1.id

}


resource "aws_route_table_association" "rtapubaz2" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.pubsubaz2.id

}


resource "aws_route_table_association" "rtapubaz3" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.pubsubaz3.id

}

#  Main Route Table associaciation with the 6 private subnets


resource "aws_route_table_association" "rtapriv_app_subaz1" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-app-subnetaz1.id

}

resource "aws_route_table_association" "rtapriv_app_subaz2" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-app-subnetaz2.id

}

resource "aws_route_table_association" "rtapriv_app_subaz3" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-app-subnetaz3.id

}

resource "aws_route_table_association" "rtapriv_db_subaz1" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-db-subnetaz1.id

}

resource "aws_route_table_association" "rtapriv_db_subaz2" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-db-subnetaz2.id

}

resource "aws_route_table_association" "rtapriv_db_subaz3" {
  route_table_id = aws_route_table.RT.id
  subnet_id      = aws_subnet.priv-db-subnetaz3.id

}



