
Open Stack

## Advantages

Save VMware licensing fees by switching virtual machines running on VMware to OpenStack.

Hypervisors supported by Open Stack:

• KVM (Kernel-based Virtual machine)
• LXC: Linux Containers - Linux-based VMs
• QEMU: Quick EMUlator used for development purposes
• UML: User Mode Linux used for development purposes
• VMware vSphere: VMware-based Linux and Windows via vCenter server connection.
• Hyper-V: Server virtualization with Microsoft’s Hyper-V

## Components

• <strong>Horizon</strong> the only GUI in OpenStack. 
   It's the first component administrators see and get an idea of the current operations in the cloud.

• <strong> Nova</strong> is the chief computing engine to handle multiple virtual machines and computing tasks.
   To manage floating IP addresses in OpenStack:

   nova floating-ip-*

   sudo nova-manage user create user-name

   Nova (Compute) Cloud comprises following components:
• API server
• Message Queue (Rabbit-MQ Server)
• Compute Workers (Nova-Compute)
• Network controller (Nova-Network)
• Volume Worker
• Scheduler

• <strong>Swift</strong> - reliable and robust storage system for files and objects helping developers to refer to a unique identifier and Openstack decides where to store the info.

• <strong>Cinder</strong> - similar to traditional computer storage system, it is a block storage system in OpenStack for accessing files at faster speed.

• <strong>Neutron</strong> - ensures efficient connectivity between components during deployment.

• <strong>Keystone</strong> - a central identity list of all OpenStack cloud users and provides various mapping techniques to access methods against Keystone.

   keystone role-list

• <strong>Glance</strong> - image service provider where images are the virtual copies of hard disks. 
   Allows using the images as templates during deployment of new instances.

• <strong>Ceilometer</strong> - component providing billing services and other telemetry services to cloud users. 
   Maintains an account of component system usage by each user.

• <strong>Heat (Orchestration Engine)<strong> - 
   Allows developers to orchestrate/illustrate and store the cloud application requirements and 
   resources needed in a file, thereby maintaining the cloud infrastructure.

## Resources

https://intellipaat.com/interview-question/openstack-interview-questions/

