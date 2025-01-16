terraform {
    backend "s3" {
        bucket         	= "tfstate-od3tuznbuq"
        key             = "acme-k8s-prod/terraform.tfstate"
        region          = "us-east-1"
        encrypt         = true
        dynamodb_table  = "app-state"
    }
}