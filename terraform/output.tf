output "publicIp" {
    value = "${aws_instance.ec2.public_ip}"
}

output "curl" {
    value = "curl http://${aws_instance.ec2.public_ip}"
}

output "Login-with-Key" {
    value = "ssh -i ${aws_key_pair.generated_key.key_name}.pem ubuntu@${aws_instance.ec2.public_ip}"
}

output "keypair" {
  value = "${tls_private_key.dev_key.private_key_pem}"
  sensitive = true
}

