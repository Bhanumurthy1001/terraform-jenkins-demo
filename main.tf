module "vm" {
  source        = "./modules/vm"
  instance_type = var.instance_type
}

module "db" {
  source  = "./modules/db"
  db_name = var.db_name
  db_user = var.db_user
  db_pass = var.db_pass
}
