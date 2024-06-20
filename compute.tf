## Configure container

module "gce-container" {
  # https://github.com/terraform-google-modules/terraform-google-container-vm
  source  = "terraform-google-modules/container-vm/google"
  version = "3.1.1"

  container = {
    image = var.image # Atlantis Custom image 
    env   = local.env_variables

    securityContext = {
      privileged : var.privileged_mode
    }
    tty : var.activate_tty
    volumeMounts = [
      {
        mountPath = "/home/atlantis"
        name      = "atlantis-disk-0"
        readOnly  = false
      },
      {
        mountPath = "/key.pem"
        name      = "config"
        readOnly  = true
      },
    ]
  }

  volumes = [
    {
      name = "atlantis-disk-0"

      gcePersistentDisk = {
        pdName = "atlantis-disk-0"
        fsType = "ext4"
      }
    },
    {
      name = "config"
      hostPath = {
        path = "/var/gh_key.pem"
      }
    }
  ]

  restart_policy = "Always"
}
module "atlantis-vm" {
  source          = "github.com/terraform-google-modules/cloud-foundation-fabric//modules/compute-vm?ref=v13.0.0"
  project_id      = var.project_name
  zone            = var.zone
  name            = "atlantis"
  instance_type   = "e2-small"
  service_account = module.project-factory.service_account_email
  service_account_scopes = ["cloud-platform","storage-rw"]
  
  network_interfaces = [{
    network    = data.google_compute_network.vpc_network.self_link
    subnetwork = local.subnetwork_self_link
    nat        = false
    addresses = {
      internal = ""#reserve your IP 
      external = null
    }
  }]

  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    user-data                    = data.cloudinit_config.config.rendered
    enable-oslogin            = "true"
    startup-script =  <<-EOF
    #!/bin/bash
    # Inject secret into a file
    echo "${data.google_secret_manager_secret_version.gh_app_keyfile.secret_data}" > /var/gh_key.pem
    # Additional startup commands here
  EOF
  }

  boot_disk = {
    image = module.gce-container.source_image
    type  = "pd-ssd"
    size  = 10
  }
  attached_disks = [{
    name        = "atlantis-disk-0"
    size        = 50
    source_type = null
    source      = null
    auto_delete = false
    options = {
      mode         = "READ_WRITE"
      replica_zone = null
      type         = "pd-standard"
    }
  }]
  depends_on = [data.google_secret_manager_secret_version.gh_app_keyfile,
    module.gce-container
  ]
}


