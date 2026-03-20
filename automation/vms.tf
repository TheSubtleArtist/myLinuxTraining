resource "virtualbox_vm" "lab_vms" {
    count = length(var.vm_names)

    name=var.vm_names[count.index]
    cpus = count.index == 0 ? 2 : 2
    memory = count.index == 0 ? "4096 mib" : "3072 mib"

    network_adapter {
        type = "nat"
    }

    network_adapter {
        type = "hostonly"
        host_interface = "VirtualBox Host-Only Ethernet Adapter"
    }
}