module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "security" {
  source = "./modules/security-group"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id = module.vpc.public_subnet_id
  app_sg    = module.security.app_sg_id
  user_data = file("user-data.sh")
}

module "rds" {
  source = "./modules/rds"

  private_subnet_ids = module.vpc.private_subnet_ids
  db_sg              = module.security.db_sg_id
}