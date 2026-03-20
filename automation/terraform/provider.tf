terraform {
    required_version = "~> 1.6"

    required_provider {
        virtualbox = {
            source = "terra-farm/virtualbox"
            version = "0.2.2"
        }
    }
}

provider "virtualbox" {}