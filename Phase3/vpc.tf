resource "aws_vpc" "nextech_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "workload_subnet" {
  vpc_id     = aws_vpc.nextech_vpc.id
  cidr_block = "10.0.1.0/24"
  # Ties to elevation risk: Isolates AWS from VPN
}
