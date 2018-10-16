module "extensive_kitchen_terraform" {
  os_family = "${var.os_family}"

  # The generated key pair will be used to configure SSH authentication
#   key_pair_public_key = "${file("${path.module}/../../assets/key_pair.pub")}"

  # The source of the module is the root directory of the Terraform project
  source                   = "../../../"
#   subnet_availability_zone = "${var.subnet_availability_zone}"
}