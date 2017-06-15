Cloudmesh Roll
===============
.. contents::

Introduction
-------------
This roll installs Comet cloudmesh client CLI on a virtual cluster frontend that is run 
on the physical Comet cluster.  The CLI provides for maangement of the
comet virtual cluster from the virtual cluster forntend.
Tested on Rocks 6.2

Prerequisites
--------------

#. Python roll roll must be installed on the virtual frontend. It provides python 2.7.9 

#. Prerequisites that will be installed by the cloudmesh roll 

   * Cloudmesh client 4.6.2 ( form github as of Tue Apr 4 2017) https://github.com/cloudmesh/client.git
   * pip 9.0.1
   * virtualenv 15.1.0

Building a roll 
------------------

Checkout roll distribution from git repo :: 

   # git clone https://github.com/pragmagrid/cloudmesh
   # cd cloudmesh/

To build a roll, first execute a script that installs pip and virtualenv as prerequisites for building
the cloudmesh client during the roll build stage: ::

   # ./bootstrap.sh  

Then build the roll ::

   # make roll

The resulting ISO file cloudmesh-VERSION.iso is the roll that can be added to the virtual cluster frontend.

Adding a roll to a live frontend
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Make sure that the python roll is installed. 
::

   # rocks add roll cloudmesh-VERSION.iso
   # rocks enable roll cloudmesh
   # (cd /export/rocks/install; rocks create distro)  
   # yum clean all
   # rocks run roll cloudmesh > add-cloudmesh.sh  
   # bash add-roll.sh 

Where installed roll components are
------------------------------------
The following RPMS install:

#. cloudmesh-module:  /usr/share/Modules/modulefiles/cloudmesh
#. opt-cloudmesh:  /opt/client/
#. opt-cloudmesh-env:  /opt/ENV/
#. opt-pip: /opt/python/lib/python2.7/site-packages/pip
#. opt-virtual-env: /opt/python/lib/python2.7/site-packages/

Using a roll
--------------

Load the module and  initialize the client ::

   # module load cloudmesh
   # cm help

The second commadn will generate the template ``~/.cloudmeshcloudmesh.yaml`` file.
Initiate the configuration from the template ::

  # cm comet init

Examine if correct and represnet your comet environment. 
If no errors, run other cm commands as usual ::

   # cm comet cluster
