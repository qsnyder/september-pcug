# september-pcug

The purpose of this document is to provide code examples for the September 2019 Phoenix Cisco Users Group meeting focused on network automation using Cisco Network Service Orchestrator (NSO).
While a full explanation of these packages is beyond the scope of this readme, simple walkthroughs will be provided to play with the examples.  

* [Getting NSO](#getting-nso)
* [Repo Contents](#repo-contents)
   * [Makefile](#makefile)
   * [arbitrary-yang](#arbitrary-yang)
   * [xr-skeleton-data](#xr-skeleton-data)
   * [ntp-server service](#ntp-server-service)
   * [subif-and-routing](#subif-and-routing)
* [Using the examples](#using-the-examples)
   * [Install NSO](#install-nso)
   * [Compile packages](#compile-packages)
   * [Invoke ncs-netsim](#invoke-ncs-netsim)
   * [Starting NSO](#starting-nso)
   * [Using the packages](#using-the-packages)
      * [A Note About Template Modification](#a-note-about-template-modification)
   * [Cleaning up](#cleaning-up)

# Getting NSO

Download free from DevNet [here](https://developer.cisco.com/docs/nso/#!getting-nso)

# Repo Contents

## Makefile

A makefile has been created for the convenience of running these packages within NSO.  A full discussion of makefiles is outside the scope of this README but simple inspection of the file will help in understanding what it is designed to do.  
At its core -- running `make <target>` from something described as a `make` target, it will invoke the shell command given.  Using `makefiles` is an easy way to automate the setup and teardown of NSO architecture.  Once you get used to these constructs, it will be painful to be without them.

## arbitrary-yang

The `arbitrary-yang` folder contains examples of non-network focused data models and exploring their constructs using `pyang` (included with NSO).  This is simply used as an illustrative purpose to show the correlation between YANG, YIN, XML, and others.
The [README](https://github.com/qsnyder/september-pcug/tree/master/arbitrary-yang) will provide more details in interacting with the models and `pyang` output.

## xr-skeleton-data

This is a sample XML skeleton of data exported from Cisco VIRL to be placed in the `cisco-iosxr` NED folder such that a set of sample config can be inspected with NSO.
Installation and usage instructions can be found in the [README](https://github.com/qsnyder/september-pcug/tree/master/xr-skeleton-data).

## ntp-server service

Simple service to illustrate the purpose of building models and templates to be deployed against devices and/or device-groups.  Level of effort much exceeds standard NSO templates from CLI, but used to show the process.

## subif-and-routing

A simple service dealing with subinterfaces and routing.  Essentially, this is an example of a customer facing service that can instantiate a subinterface on multiple device types (IOS, IOS-XR) using a provided IP address, and subif tag and automatically create the appropriate routing protocol entry.  The idea is for this service to be available over a web API that can be invoked by customers or front-line provisioning teams -- meaning that NSO would never need to be directly interacted with.

# Using the examples

## Install NSO

Installation requires either Mac or Linux PC with Java (of some version) and Apache Ant.
Instructions are found [here](https://www.cisco.com/c/en/us/support/docs/cloud-systems-management/network-services-orchestrator/200528-Installion-of-NCS-NSO-Natively-on-a-MAC.html) for MacOS.  Apache Ant for Linux will need to be installed using your distributions included app manager or manually using Apache's [website](https://ant.apache.org/manual/install.html).

## Compile packages

Ensure that the models inside of each package are compiled prior to running NSO.  Additionally, any time the models are changed, they will need to be compiled.  
`make compile-ntp`
`make compile-subif`

## Invoke ncs-netsim

The makefile includes (2) simulations; initially targeted at the discussion content for the PCUG.  When inspecting the `makefile` -- it can be observed that the netsims are
- `netsim-mv`
  - netsim involving a variety of different NEDs, including Cisco IOS, Cisco NX-OS, Cisco IOS-XR, and Juniper JUNOS
- `netsim-t`
  - netsim creating a network of (3) Cisco IOS-based devices.  This netsim is used for illustration of simple templating inside of NSO.  However, this netsim can be used for any other arbitrary package

In addition to creating each of the netsims, it is possible to invoke the `makefile` to enter the device's CLI.  The syntax can be derived from the `makefile` but is usually of type `make <prefix><number>_cli`

Typically, only a single netsim instance can be invoked within a project directory.  In order to move between the "template" and the "multi-vendor" netsims, invoke `make netsim-clean` prior to starting the desired sim.

## Starting NSO

Much like every other aspect of the project, NSO/NCS can be started and run from the `makefile`.  For the first run, the folder structure will need to be setup. This can be done by running `make nso`, which will create setup all required files/folders, tell NSO to use the `./netsim` folder, and make symlinks to all NEDs that will be used within the project.  After `ncs-setup` has completed, two `make` commands are available, depending on desired CLI of NSO.
- `make cli-c` | Cisco command style
- `make cli-j` | Juniper command style

## Using the packages

Packages have been compiled with a fairly coherent set of command "help" instructions (what would be seen with a `?` from the CLI in a Cisco device).  To use a compiled package, simply enter `config` mode within NSO and invoke the package name.  Walk through the requirements for the package and commit.

### A Note About Template Modification

As stated above, any change to the package model (YANG) will need to be compiled.  However, it may be beneficial to the user to modify the template structure located within each package.  This does not require a full recompile, but if any changes are made to the underlying template, the packages will need to be reloaded inside of NSO using the `packages reload` command from the NSO prompt.

## Cleaning up

A method to clean up the project directory is included in the `makefile`.  Simply invoke `make nso-clean`.  This will stop both ncs-netsim and ncs and remove all NSO-related files in the directory.  Helpful if you feel that something has gotten cruft-y in the directory.
