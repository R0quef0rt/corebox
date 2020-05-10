module "extensive_kitchen_terraform" {
  source      = "../../../"
  public_key  = "../../../assets/key_pair/id_rsa.pub"
  private_key = "../../../assets/key_pair/id_rsa"
  env         = "qa"
  project_key = "${var.project_key}"
}
