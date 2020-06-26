resource "aws_vpc_peering_connection" "ost_logging_vpc" {
  peer_owner_id                   = var.ost_aws_account_id
  peer_vpc_id                     = var.ost_vpc_id
  vpc_id                          = var.vpc_id
}

resource "aws_route" "ost_logging_vpc" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.ost_vpc_cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.ost_logging_vpc
  depends_on                = ["aws_vpc_peering_connection.ost_logging_vpc"]
}