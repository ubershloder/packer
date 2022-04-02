source "vagrant" "ubuntu" {
  communicator = "ssh"
  source_path  = "ubuntu/jammy64"
  provider     = "virtualbox"
  add_force    = true
  box_name = "httpdBox"
}

build {
  sources = [
    "source.vagrant.ubuntu"
  ]

  provisioner "ansible" {
    playbook_file = "./playbook.yml"
  }
  provisioner "shell" {
    inline = [
      "sudo apt update",
      "sudo apt upgrade -y",
      "sudo systemctl status apache2"
    ]

  }
}