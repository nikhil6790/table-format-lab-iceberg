/******************************************
Creation of a VPC & Subnet
******************************************/
module "create_vpc_and_subnet" {
  source       = "terraform-google-modules/network/google"
  project_id   = local.project_id
  network_name = local.vpc_nm
  routing_mode = "REGIONAL"

  subnets = [
    {
      subnet_name           = "${local.subnet_nm}"
      subnet_ip             = "${local.subnet_cidr}"
      subnet_region         = "${local.location}"
      subnet_range          = local.subnet_cidr
      subnet_private_access = true
    }
  ]
}

/******************************************
Creation of firewall rules
*******************************************/
resource "google_compute_firewall" "create_subnet_firewall_rule" {
  project       = local.project_id
  name          = "allow-intra-snet-ingress-to-any"
  network       = local.vpc_nm
  direction     = "INGRESS"
  source_ranges = [local.subnet_cidr]
  allow {
    protocol = "all"
  }
  description = "Creates firewall rule to allow ingress from within Spark subnet on all ports, all protocols"
  depends_on = [
    module.create_vpc_and_subnet
  ]
}

/******************************************
Creation of reserved IP (Vertex AI Workbench)
*******************************************/

resource "google_compute_global_address" "create_reserved_ip" {
  provider      = google-beta
  name          = "private-service-access-ip"
  purpose       = "VPC_PEERING"
  network       = "projects/${local.project_id}/global/networks/${local.vpc_nm}"
  address_type  = "INTERNAL"
  prefix_length = local.psa_ip_length

  depends_on = [
    module.create_vpc_and_subnet
  ]
}

resource "google_service_networking_connection" "peer_with_service_networking" {
  network                 = "projects/${local.project_id}/global/networks/${local.vpc_nm}"
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.create_reserved_ip.name]

  depends_on = [
    module.create_vpc_and_subnet,
    google_compute_global_address.create_reserved_ip
  ]
}


/*******************************************
Introducing sleep to minimize errors from
dependencies having not completed
********************************************/

resource "time_sleep" "sleep_after_network_resources_creation" {
  create_duration = "60s"
  depends_on = [
    google_service_networking_connection.peer_with_service_networking

  ]
}