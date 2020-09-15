resource "tls_private_key" "installkey" {
  algorithm   = "RSA"
  rsa_bits = 4096
}

data "tls_public_key" "installkey" {
  private_key_pem = tls_private_key.installkey.private_key_pem
}

resource "aws_key_pair" "installkey" {
  key_name   = var.clustername
  public_key = data.tls_public_key.installkey.public_key_openssh
}

