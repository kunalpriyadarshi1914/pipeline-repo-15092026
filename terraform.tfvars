rgs = {
    rg1={
        name="kp11-rg"
        location="centralindia"
    }
}
pip1 = {
    pip2={
        name="kp-pip11"
        resource_group_name="kp11-rg"
        location="centralindia"
        
    }
}
vnets = {
    vnet1={
        name="shiva-vnet11"
        resource_group_name="kp11-rg"
        location="centralindia"
    }
}
subnets = {
    subnet1={
        name="shiva-subnet11"
        resource_group_name="kp11-rg"
        virtual_network_name="shiva-vnet11"

    }
}
nics = {
    nic5={
        name="shiva-nic11"
        location="centralindia"
        resource_group_name="kp11-rg"
    }
}
vms = {
    vm5={
        name="shiva-vm11"
        resource_group_name="kp11-rg"
        location="centralindia"
        admin_username="Shiva_devops1914"
        admin_password="komalkunal@1914"
    }
}
