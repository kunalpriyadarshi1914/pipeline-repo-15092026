
resource "azurerm_resource_group" "rgprac" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}



resource "azurerm_public_ip" "pipprac" {
  depends_on = [ azurerm_resource_group.rgprac ]
  for_each = var.pip1
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
}


resource "azurerm_virtual_network" "vnet1" {
  depends_on = [ azurerm_resource_group.rgprac ]
  for_each = var.vnets
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = ["10.0.0.0/16"]
}


resource "azurerm_subnet" "subnet1" {
  for_each = var.subnets
  depends_on = [ azurerm_virtual_network.vnet1 ]
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "nic1" {
  for_each = var.nics
  depends_on = [ azurerm_subnet.subnet1 ]
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1["subnet1"].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pipprac["pip2"].id
  }
}


resource "azurerm_linux_virtual_machine" "vm1" {
  depends_on = [ azurerm_network_interface.nic1 ]
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_D4_v5"
  admin_username      = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic1["nic5"].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
