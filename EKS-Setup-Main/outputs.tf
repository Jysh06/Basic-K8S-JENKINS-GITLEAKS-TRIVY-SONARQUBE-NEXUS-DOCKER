output "vm_info" {
  value = {
    for idx, instance in aws_instance.ec2_instance :
    instance.tags.Name => instance.public_ip
  }
}