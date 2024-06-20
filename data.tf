data "google_secret_manager_secret_version" "gh_app_keyfile" {
  secret  = "github_app_keyfile"
  project = var.project_name
}
data "cloudinit_config" "config" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "atlantis-chown-disk.service"
    content_type = "text/cloud-config"
    content = yamlencode({
      write_files = [
        {
          path        = "/etc/systemd/system/atlantis-chown-disk.service"
          permissions = "0644"
          owner       = "root"
          content     = <<EOF
          [Unit]
          Description=Change ownership of the mount path to the Atlantis uid
          Wants=konlet-startup.service
          After=konlet-startup.service
          [Service]
          ExecStart=/bin/chown 100 /mnt/disks/gce-containers-mounts/gce-persistent-disks/atlantis-disk-0
          Restart=on-failure
          RestartSec=30
          StandardOutput=journal+console
          [Install]
          WantedBy=multi-user.target
          EOF
        }
      ]
    })
  }
  part {
    filename     = "runcmda"
    content_type = "text/cloud-config"
    merge_type   = "list(append)+dict(no_replace, recurse_list)+str()"
    content = yamlencode({
      runcmd = [
        "systemctl daemon-reload",
        "systemctl start --no-block atlantis-chown-disk.service"
      ]
    })
  }
}
