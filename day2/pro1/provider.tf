provider "aws" {
  alias =  "DEV"
  region = "ap-south-1"
}


provider "aws" {
  alias =  "QA"
  region = "ap-south-2"
}