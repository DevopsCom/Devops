#Custom Managed Policy
data "template_file" "businesslogic_policy" {
  template  = "${file("${path.module}/templates/businesslogic-policy.json.tpl")}"
}
