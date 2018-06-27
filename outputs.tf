output "master_name" {
  value = "master.${var.env}.${var.service_name}.${data.terraform_remote_state.environment.domain_name}"
}

output "minion_template" {
  value = "${data.template_file.minion-template.rendered}"
}
