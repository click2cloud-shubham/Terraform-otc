provider "opentelekomcloud" {
  access_key  = "xxxxxxxxxxxxxxxxxx"
  secret_key  = "xxxxxxxxxxxxxxxxxx"
  domain_name =  "OTC00000000001000000209"
  tenant_name =  "eu-de_click2cloud"
  auth_url    = "https://iam.eu-de.otc.t-systems.com/v3"

  }


resource "opentelekomcloud_ecs_instance_v1" "basic" {
  name     = "shubham_server"
image_id ="b627a72e-c550-4cee-b145-3575f9d7f628" 
  flavor   = "s2.medium.1"
  vpc_id   = "${opentelekomcloud_vpc_v1.vpc.id}"             

  nics {
    network_id = "${opentelekomcloud_networking_network_v2.network_1.id}"
  }

  availability_zone = "eu-de-01"
  security_groups   = ["default"]
}

resource "opentelekomcloud_vpc_v1" "vpc" {
  name = "vpc1"
  cidr ="10.0.0.0/12"
}
resource "opentelekomcloud_networking_network_v2" "network_1" {
  name           = "shubham_network"
  admin_state_up = "true"
}

resource "opentelekomcloud_networking_subnet_v2" "subnet_1" {
  network_id = "${opentelekomcloud_networking_network_v2.network_1.id}"
  cidr       = "10.0.0.0/12"
}
