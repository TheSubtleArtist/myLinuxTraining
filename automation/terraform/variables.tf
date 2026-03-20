variable "vm_names" {
    type = list(string)
    default = [
        "controller",
        "server1",
        "server2"
    ]
}