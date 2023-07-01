terraform {
  backend "s3" {
    bucket = "webconnect-eks"
    region = "ap-northeast-2"
    key = "eks/terraform.tfstate"
  }
}