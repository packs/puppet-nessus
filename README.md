puppet-nessus
============

Configuration for Nessus Vulnerability Scanner from Tenable.


Puppet Nessus Module
=================

Module for configuring Nessus.

Tested on RedHat Enterprise Linux 5.x and 6.x with Puppet 2.7.
Patches for other operating systems or additional features are welcome.


Installation
------------

Clone this repo to a git directory under your Puppet modules directory:

    git clone https://github.com/packs/puppet-nessus.git nessus

Usage
-----

The `nessus::server` class installs the Nessus application:

    include nessus::server

Place the SSL private certificate and private key, as separate files in Base64-encoded X.509 format, in 
the `nessus/files/ssl`. If your environment uses a local CA, or certificate chains, place the missing
certificates as a bundle in `nessus/files/custom_CA.inc` and uncommnet the relevant lines from the 
manifest.
