# xr-skeleton-data

By default -- `ncs-netsim` provides no skelton data to work with when you instantiate an XR-based netsim instance.
While we understand that the importance of `ncs-netsim` is not in the data that is provided upon device creation, at times, arbitrary data can give a valuable point to look at in the structured model as well as during config contextualization.

Because of this -- a sample XML file is provided that can be placed in the `$NCS_HOME` directory under the `cisco-iosxr` ncs-netsim directory.

Simply move the file to

`$NCS_HOME/packages/neds/cisco-iosxr/netsim/`

prior to invoking `ncs-netsim` or any implementation thereof from a `Makefile`.  Keep in mind that if the full NED packages are copied through `ncs-setup` -- you'll need to add this file to the root directory prior to invoking the setup as well (by default, simlinks are used during a local installation).
