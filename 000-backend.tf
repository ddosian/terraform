terraform {
  backend "s3" {
    bucket = "ddostfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"

    endpoints = {
      s3 = "https://s3.us-west-004.backblazeb2.com"
    }

    skip_requesting_account_id  = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = true
  }
}