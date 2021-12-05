terraform {
  backend "s3" {
    bucket = "fanzly"
// key specify the path of state maintai
    key = "state/key"
    region = "us-east-2a"
  }
}
provider "aws" {
  region = "us-east-2a"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = "devops-intern"
}