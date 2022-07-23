variable "region" {
    type    = string
    default = "ap-southeast-1"
}

variable "subnet_cidrs" {
    default = []
    description = "These are subnet cidr ranges"
}

variable "subnet_azs" {
    default = []
    description = "Availability Zones for the subnets"
}

variable "subnet_names" {
    default = []
    description = "Names of subnets"
}   

variable "image_id" {
    default = []
    description = "id of image"
}   
