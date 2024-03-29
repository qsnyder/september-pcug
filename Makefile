clean: netsim-clean nso-clean

# netsim targets
netsim-mv:
	ncs-netsim create-device cisco-ios ios0
	ncs-netsim add-device cisco-nx nx0
	ncs-netsim add-device cisco-iosxr xr0
	ncs-netsim start

netsim-t:
	ncs-netsim create-network cisco-ios 3 ios
	ncs-netsim start

netsim-clean:
	ncs-netsim stop
	rm -rf netsim

ios0_cli:
	ncs-netsim cli-c ios0

ios1_cli:
	ncs-netsim cli-c ios1

ios2_cli:
	ncs-netsim cli-c ios2

nx0_cli:
	ncs-netsim cli-c nx0

xr0_cli:
	ncs-netsim cli-c xr0

# NSO targets
nso:
	ncs-setup --dest . --ned-package cisco-ios --ned-package cisco-nx --ned-package juniper-junos --ned-package cisco-iosxr --netsim-dir netsim
	ncs

nso-clean:
	-@echo "Stopping NSO"
	-@ncs --stop
	-@rm -Rf README.ncs agentStore state.yml logs/ ncs-cdb/ ncs-java-vm.log ncs-python-vm.log ncs.conf state/ storedstate target/

ntp-clean:
	make -C packages/ntp-server/src clean

compile-ntp:
	make  -C packages/ntp-server/src

subif-clean:
	make -C packages/subif-and-routing/src clean

compile-subif:
	make -C packages/subif-and-routing/src

reload:
	echo "packages reload" | ncs_cli -u admin -C

packages: packages-clean compile reload

# Handy CLI targets
.PHONY: cli cli-c cli-j

cli: cli-c

cli-c:
	ncs_cli -u admin -C

cli-j:
	ncs_cli -u admin
