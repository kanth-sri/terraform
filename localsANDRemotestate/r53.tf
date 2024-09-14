resource "aws_route53_record" "expense" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  #backend.srikanthadepu.online
  #for frontend we need only srikanthadepu.online --> with public ip assigned
  name    = var.instance_names[count.index] == "frontend" ? "${local.domain}" : "${var.instance_names[count.index]}.${local.domain}"
  type    = "A"
  ttl     = 1
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}