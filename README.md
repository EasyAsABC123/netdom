NETDOM Cookbook
========================
Utilizes the netdom command to add and remove computers from a domain

Requirements
------------
* Windows Server 2008 or higher
* Chef 11 or higher
* Ruby 1.9 (preferably from the Chef full-stack installer)
* WMI installed on the windows PC

Platform
------------------
* Windows Server 2012
* Windows Server 2012R2
* Windows Server 2008 (untested)
* Windows Server 2008r2 (untested)

Resource/Provider
=================

join
--------
Allows a computer to be added to a domain

### Actions

- :add: - add a computer to domain (default action)


### Attribute Parameters

- domain: name attribute, the name of the domain to join.
- ou: Fully qualified OU path.
- domain_admin: username for the domain admin.
- domain_admin_password: password for the domain admin

Note: It is recommended to store domain_admin and domain_admin_password in chef-vault

### Examples
```
# Adds the current computer to a domain
netdom_join 'domainname.com' do
  ou 'CN=Computer1,OU=Department 101,OU=Business Unit #1,DC=us,DC=xyz,DC=com'
  domain_admin 'admin_account'
  domain_admin_password 'secret_password'
end
```

remove
--------
Allows a computer to be removed from a domain

### Actions

- :remove: - remove computer from domain (default action)


### Attribute Parameters

- domain: name attribute, the name of the domain to remove from.
- ou: Fully qualified OU path.
- domain_admin: username for the domain admin.
- domain_admin_password: password for the domain admin

Note: It is recommended to store domain_admin and domain_admin_password in chef-vault

### Examples
```
# Adds the current computer to a domain
netdom_remove 'domainname.com' do
  ou 'CN=Computer1,OU=Department 101,OU=Business Unit #1,DC=us,DC=xyz,DC=com'
  domain_admin 'admin_account'
  domain_admin_password 'secret_password'
end
```

Note: Will only remove from domain if computer is on the domain specified.

License & Authors
-------------------
- Author:: Justin Schuhmann (<jmschu02@gmail.com>)
