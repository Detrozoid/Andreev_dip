###Рользовательский переменные yandex cloud
variable "ya" {
  type = list(object({
    token = string
    cloud_id = string
    folder_id = string
    zone_def = string
    zone_alt = string
  }))
  default = [
    {
      token = "личные данные"
      cloud_id = "личные данные"
      folder_id = "личные данные"
      zone_def = "ru-central1-a"
      zone_alt = "ru-central1-b"
    }
  ]
}
###Рользовательский переменные Пароли сервисов
variable "password" {
  type = list(object({
    elastic_pass = string
    filebeat_user = string
    filebeat_user_role = string
    filebeat_user_pass = string
    kibana_system_pass = string
    grafana_password = string
    linux_user  = string
  }))
  default = [
    {
      elastic_pass = "личные данные"
      filebeat_user = "личные данные"
      filebeat_user_role = "личные данные"
      filebeat_user_pass = "личные данные"
      kibana_system_pass = "личные данные"
      grafana_password = "личные данные"
      linux_user = "личные данные"
      public_key = "личные данные"
    }
  ]
}
### расписание для sbapshots
variable "snapshot_schedule" {
   type = string  
   default = "30 15 */1 * *"
}

###Данные пользователя на ВМ (переменные тут нельзя использовать - │ Variables may not be used here.)
variable "user_data" {
   type = string  
   default = <<EOF
#cloud-config

users:
  - name: "личные данные"
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
     "личные данные"
EOF 
}
########## Алиасы IP
locals {
    ip_web-1      = yandex_compute_instance.web-1.network_interface.0.ip_address
    ip_web-2      = yandex_compute_instance.web-2.network_interface.0.ip_address
    ip_monitor    = yandex_compute_instance.monitor.network_interface.0.ip_address
    ip_grafana    = yandex_compute_instance.grafana.network_interface.0.ip_address
    ip_elastic    = yandex_compute_instance.elastic.network_interface.0.ip_address
    ip_kibana     = yandex_compute_instance.kibana.network_interface.0.ip_address
    ip_bastion    = yandex_compute_instance.bastion.network_interface.0.ip_address
    exip_grafana  = yandex_compute_instance.grafana.network_interface.0.nat_ip_address
    exip_kibana   = yandex_compute_instance.kibana.network_interface.0.nat_ip_address
    exip_bastion  = yandex_compute_instance.bastion.network_interface.0.nat_ip_address
    exip_lb       = yandex_alb_load_balancer.diploma-balancer.listener[0].endpoint[0].address[0].external_ipv4_address[0].address
  }


