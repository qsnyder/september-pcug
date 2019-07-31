# september-pcug

The purpose of this document is to provide code examples for the September 2019 Phoenix Cisco Users Group meeting focused on network automation using Cisco Network Service Orchestrator (NSO).
While a full explanation of these packages is beyond the scope of this readme, simple walkthroughs will be provided to play with the examples.  

# Getting NSO

Download free from DevNet [here](https://developer.cisco.com/docs/nso/#!getting-nso)

# Using the examples

## Install NSO

Installation requires either Mac or Linux PC with Java (of some version) and Apache Ant.
Instructions are found [here](https://www.cisco.com/c/en/us/support/docs/cloud-systems-management/network-services-orchestrator/200528-Installion-of-NCS-NSO-Natively-on-a-MAC.html) for MacOS.  Apache Ant for Linux will need to be installed using your distributions included app manager or manually using Apache's [website](https://ant.apache.org/manual/install.html)

## Makefile

A makefile has been created for the convenience of running these packages within NSO.  A full discussion of makefiles is outside the scope of this README but simple inspection of the file will help in understanding what it is designed to do.  
At its core -- running `make <target>` from something described as a `make` target, it will invoke the shell command given.  Using `makefiles` is an easy way to automate the setup and teardown of NSO architecture.