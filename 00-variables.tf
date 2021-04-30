// ----------- GLOBAL -----------
variable "region"{
    type = string
    default = "eu-west-1"
}

variable "environment"{
    type = string
    default = "dev"
}

// ----------- VPC -----------
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}

variable "subnet_availability_zone"{
    type = string
    default = "eu-west-1a"
}

variable "subnet_cidr_block"{
    type = string
    default = "10.0.0.0/24"
}

// ----------- KEY PAIR -----------
variable "instance_key_pair_name" {
    type = string
    default = "my-ssh-key"
}

// ----------- LOCALS -----------
locals{
    tags = {
        "wavestone:deployment"  = "terraform",
        "wavestone:region"      = var.region,
        "wavestone:env"         = var.environment
        "wavestone:project"     = "first-project"
    }
}