#Thruk

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with thruk](#setup)
    * [What thruk affects](#what-thruk-affects)
    * [Beginning with thruk](#beginning-with-thruk)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Login](#login)


##Overview

*The thruk module provides the installation procedure for thruk including the thruk.conf file as template.
*If you have EPEL already activated, the yumrepo['mod_epel'] is not necessary.
*yumrepo['mod_epel'] you can find [here](manifests/mod_fcgid.pp)

##Module Description

The thruk module provides a thruk package which can connect different backends at one place.


##Setup

###What thruk affects

* thruk package.
* thruk configuration file.
* thruk service.

###Beginning with thruk

Include '::thruk' is enough to get you up and running if the parameters point to
proper values. If you wish to pass in parameters like which servers to use then you
can use:

```puppet
class { '::thruk':
  peer_path => '/path/to/backend',
}
```

##Usage

All interaction with the thruk module can be done through the main thruk class.
This means you can simply toggle the options in the thruk main class to get the full
functionality.

###I just want thruk, what's the minimum I need?

```puppet
include '::thruk'
```

##Reference

###Classes

* thruk: Main class, includes all the rest.
* thruk::package: Handles the packages.
* thruk::config: Handles the configuration file.
* thruk::service: Handles the thruk service.
* thruk::mod_fcgid: Handles dependency of thruk package.

###Parameters

The following parameters are available in the thruk module

####`peer_name`

Set the backend name.

####`peer_type`

Set the backend type (ex.livestatus).

####`peer_path`

Set the backend path (ex. /path/to/backend  or ex. 1.1.1.1:6557).

####`core_conf`

Set core_conf path for backend.

####`obj_check_cmd`

Set obj_check_cmd path for backend.

####`obj_reload_cmd `

Set obj_reload_cmd path gor backend 

####`other option`

Provisionally that's all parameters which is available.

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* RedHat Enterprise Linux 6.x.

Testing on other platforms has been light and cannot be guaranteed.

##Login

* http://localhost/thruk/
* ex. http://191.168.11.11/thruk/

* login :thrukadmin
* passwrd :thrukadmin