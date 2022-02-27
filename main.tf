module "terraform-assesment" {
  source        = "./modules/assesment"
  environment   = var.environment
  region        = var.region
  ami_name      = var.ami_name
  instance_type = var.instance_type
  public_key    = var.public_key
  vpc_id = var.vpc_id
}