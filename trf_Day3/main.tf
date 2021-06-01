provider "aws" {
  region  = "us-east-2"
}

module "aws"{
 source= "./aws"
#iam_instance_profile = iam.aws_iam_instance_profile.test_profile_1.name

}

module "bucket"{
source= "./bucket"
}

module "iam"{
source= "./iam"
}


module "vpc"{
source= "./vpc"
}
