# september-pcug

The purpose of this document is to provide code examples for the September 2019 Phoenix Cisco Users Group meeting focused on network automation using Cisco Network Service Orchestrator (NSO).
While a full explanation of these packages is beyond the scope of this readme, simple walkthroughs will be provided to play with the examples.  

# Getting NSO

Download free from DevNet [here](https://developer.cisco.com/docs/nso/#!getting-nso)

# Repo Contents

## Makefile

A makefile has been created for the convenience of running these packages within NSO.  A full discussion of makefiles is outside the scope of this README but simple inspection of the file will help in understanding what it is designed to do.  
At its core -- running `make <target>` from something described as a `make` target, it will invoke the shell command given.  Using `makefiles` is an easy way to automate the setup and teardown of NSO architecture.  Once you get used to these constructs, it will be painful to be without them.

## arbitrary-yang

The `arbitrary-yang` folder contains examples of non-network focused data models and exploring their constructs using `pyang` (included with NSO).  This is simply used as an illustrative purpose to show the correlation between YANG, YIN, XML, and others.

## ntp-server service

Simple service to illustrate the purpose of building models and templates to be deployed against devices and/or device-groups.  Level of effort much exceeds standard NSO templates from CLI, but used to show the process.

## subif-and-interface

Really a bad name for the service, as it deals with subinterfaces and routing.  Essentially, this is an example of a customer facing service that can instantiate a subinterface on multiple device types (IOS, IOS-XR) using a provided IP address, mask, and subif tag and automatically create the appropriate routing protocol entry.  The idea is for this service to be available over a web API that can be invoked by customers or front-line provisioning teams -- meaning that NSO would never need to be directly interacted with.

## xr-skeleton-data

This is a sample XML skeleton of data exported from Cisco VIRL to be placed in the `cisco-iosxr` NED folder such that a set of sample config can be inspected with NSO.

# Using the examples

## Install NSO

Installation requires either Mac or Linux PC with Java (of some version) and Apache Ant.
Instructions are found [here](https://www.cisco.com/c/en/us/support/docs/cloud-systems-management/network-services-orchestrator/200528-Installion-of-NCS-NSO-Natively-on-a-MAC.html) for MacOS.  Apache Ant for Linux will need to be installed using your distributions included app manager or manually using Apache's [website](https://ant.apache.org/manual/install.html)

##
