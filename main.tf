provider "google" {
  credentials = "${file("arquivo.json")}"
  project = "${var.project_id}"
  region = "${var.regiao}"
}

resource "google_compute_instance" "webserver" {
  name = "${var.nome_maquina}"
  machine_type = "${var.tipo_maquina}"
  zone = "${var.zona}"

  boot_disk {
    initialize_params {
        image = "${var.imagem_maquina}"
    }
  }  
 # Instala o servidor web Apache
  metadata_startup_script = "sudo apt-get update; sudo apt-get install apache2 -y; echo Testando > /var/www/html/index.html"

  # Habilita rede para a VM bem como um IP público
  network_interface {
    network = "default"
    access_config {

    }
  }
}