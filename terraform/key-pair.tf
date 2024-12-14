resource "tls_private_key" "example" {
  algorithm   = "RSA"
  rsa_bits = "2048"
}

resource "aws_secretsmanager_secret" "privateaws5" {
  name = "private_keyaws5.pem"
  recovery_window_in_days = 0
}


resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = "${aws_secretsmanager_secret.privateaws5.id}"
  secret_string = "${tls_private_key.example.private_key_pem}"
}

  resource "local_file" "private_key_file" {
      content     = "${tls_private_key.example.private_key_pem}"
      filename = "private_key.pem"
  }



resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key1"
  public_key = "${tls_private_key.example.public_key_openssh}"
}