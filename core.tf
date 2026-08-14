
resource "oci_core_vcn" "export_IAD-DOP-LAB04-1-VCN-01" {

  cidr_blocks = [
    "10.0.0.0/16"
  ]

  compartment_id = var.compartment_ocid

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/98815185-lab.user23"
    "Oracle-Tags.CreatedOn" = "2025-06-24T05:14:49.889Z"
  }

  display_name = "IAD-DOP-LAB04-1-VCN-02"

  dns_label = "iadoplab041vcn0"

  freeform_tags = {
    "VCN" = "VCN-2025-06-24T05:14:36"
  }
}



resource "oci_core_subnet" "export_private-subnet-IAD-DOP-LAB04-1-VCN-01" {

  cidr_block     = "10.0.1.0/24"
  compartment_id = var.compartment_ocid

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/98815185-lab.user23"
    "Oracle-Tags.CreatedOn" = "2025-06-24T05:14:51.026Z"
  }

  # dhcp_options_id REMOVED

  display_name = "private-subnet-IAD-DOP-LAB04-1-VCN-02"

  dns_label = "sub06240514481"

  freeform_tags = {
    "VCN" = "VCN-2025-06-24T05:14:36"
  }

  vcn_id = oci_core_vcn.export_IAD-DOP-LAB04-1-VCN-01.id
}




resource "oci_core_subnet" "export_public-subnet-IAD-DOP-LAB04-1-VCN-01" {

  cidr_block     = "10.0.0.0/24"
  compartment_id = var.compartment_ocid

  defined_tags = {
    "Oracle-Tags.CreatedBy" = "default/98815185-lab.user23"
    "Oracle-Tags.CreatedOn" = "2025-06-24T05:14:51.016Z"
  }

  # dhcp_options_id REMOVED

  display_name = "public-subnet-IAD-DOP-LAB04-1-VCN-02"

  dns_label = "sub06240514480"

  freeform_tags = {
    "VCN" = "VCN-2025-06-24T05:14:36"
  }

  vcn_id = oci_core_vcn.export_IAD-DOP-LAB04-1-VCN-01.id
}




resource "oci_core_nat_gateway" "export_NAT-Gateway-IAD-DOP-LAB04-1-VCN-1" {

  block_traffic  = false
  compartment_id = var.compartment_ocid

  display_name = "NAT Gateway-IAD-DOP-LAB04-1-VCN-1"

  freeform_tags = {
    "VCN" = "VCN-2025-06-24T05:14:36"
  }

  # public_ip_id REMOVED

  vcn_id = oci_core_vcn.export_IAD-DOP-LAB04-1-VCN-01.id
}




resource "oci_core_instance" "export_IAD-DOP-LAB04-1-VM-01_1" {

 

  availability_domain = var.availability_domain_ad2

  

  compartment_id = var.compartment_ocid



  display_name = "IAD-DOP-LAB04-1-VM-02"



  fault_domain = var.fault_domain

 

  shape = "VM.Standard.A1.Flex"



  source_details {
    source_id   = var.image_id
    source_type = "image"
  }



  create_vnic_details {

    subnet_id = oci_core_subnet.export_private-subnet-IAD-DOP-LAB04-1-VCN-01.id

    assign_public_ip = true
  }

  

  shape_config {

    memory_in_gbs = 2
    ocpus         = 1

    
  }


  
}