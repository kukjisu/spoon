data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    region = "ap-northeast-2"
    bucket = "spoon-terraform-0421"
    key = "spoon-terraform.tfstate"
  }
}
