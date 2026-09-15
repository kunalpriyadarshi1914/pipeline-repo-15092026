rgs = {
    rg1={
        name="kp-rg"
        location="centralindia"
    }
}
pip1 = {
    pip2={
        name="kp-pip"
        resource_group_name="kp-rg"
        location="centralindia"
        
    }
}
vnets = {
    vnet1={
        name="shiva-vnet"
        resource_group_name="kp-rg"
        location="centralindia"
    }
}
subnets = {
    subnet1={
        name="shiva-subnet"
        resource_group_name="kp-rg"
        virtual_network_name="shiva-vnet"

    }
}
nics = {
    nic5={
        name="shiva-nic"
        location="centralindia"
        resource_group_name="kp-rg"
    }
}
vms = {
    vm5={
        name="shiva-vm"
        resource_group_name="kp-rg"
        location="centralindia"
        admin_username="Shiva_devops1914"
        admin_password="komalkunal@1914"
    }
}