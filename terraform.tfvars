rgs = {
    rg1={
        name="kp2-rg"
        location="centralindia"
    }
}
pip1 = {
    pip2={
        name="kp-pip1"
        resource_group_name="kp2-rg"
        location="centralindia"
        
    }
}
vnets = {
    vnet1={
        name="shiva-vnet1"
        resource_group_name="kp2-rg"
        location="centralindia"
    }
}
subnets = {
    subnet1={
        name="shiva-subnet1"
        resource_group_name="kp2-rg"
        virtual_network_name="shiva-vnet1"

    }
}
nics = {
    nic5={
        name="shiva-nic1"
        location="centralindia"
        resource_group_name="kp2-rg"
    }
}
vms = {
    vm5={
        name="shiva-vm1"
        resource_group_name="kp2-rg"
        location="centralindia"
        admin_username="Shiva_devops1914"
        admin_password="komalkunal@1914"
    }
}
