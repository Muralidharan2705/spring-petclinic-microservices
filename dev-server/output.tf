output "instance_ip" {
  description = "Public IP of the development server"
  value       = "${aws_instance.dev_server.public_ip}"
}
