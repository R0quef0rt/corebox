module "extensive_kitchen_terraform" {
  os_family = "${var.os_family}"

  # The generated key pair will be used to configure SSH authentication
  public_key  = "${"${path.root}/../../assets/key_pair/id_rsa.pub"}"
  private_key = "${"${path.root}/../../assets/key_pair/id_rsa"}"

  # The source of the module is the root directory of the Terraform project
  source                   = "../../../"
#   subnet_availability_zone = "${var.subnet_availability_zone}"
}