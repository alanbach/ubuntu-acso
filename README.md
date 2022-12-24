## Overview

This is a patch originally introduced in [LKML][lkml], which enable overrides for
missing ACS capabilities. These capabilities are only available on some hight-end
peocessors which might not be accessible to everyone.

## Security Disclaimer

Although some distributions do include this patch with their kernels, it is highly 
recommended to avoid using this in prodution due to potentially critical security
drawbacks including [VM escape][vmescape].

## Usage

* Build a kernel using this patchset using the attached build.bash script.
* Add pcie_acs_override=downstream OR pcie_acs_override=downstream,multifunction 
boot parameters.
* You also need intel_iommu=on OR amd_iommu=on boot parameters depending on your 
CPU.
* Run read-iommu-groups.bash to validate IOMMU device group placement.

<!-- LINKS -->

[lkml]: https://lkml.org/lkml/2013/5/30/513
[vmescape]: https://www.reddit.com/r/VFIO/comments/bvif8d/comment/eppfcf1/
