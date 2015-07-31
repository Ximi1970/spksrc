How to use the spk toolchain-gccxx package
==========================================

Toolchain-gccxx is a package which creates a new toolchain for a synology architecture.
(replace the xx with 47, 48, 49, 51 or 52)

Currently only these architecture are enabled:

avoton, bromolow, cedarview, evansport, x64, x86 and 88f6281


Status of the toolchains::

	architecture    ( toolchains:    	binutils    gcc    glibc )  binaries    helloworld
			47 48 49 51 52
	avoton	        x			   ok       ok       ok        ok       (cannot test)
	bromolow        x                          ok       ok       ok        ok       (cannot test)
	cedarview       x       	           ok       ok       ok        ok       ok
	evansport       x                          ok       ok       ok        ok       (cannot test)
	x64             x                          ok       ok       ok        ok       (cannot test)
	x86             x                          ok       ok       ok        ok       (cannot test)
	88f6281         x                          ok       ok       ok        ok       ok



Generating the toolchain
------------------------

Let's start with cloning the repository::

    git clone https://github.com/Ximi1970/spksrc.git
    cd spksrc
    make setup
    
Now we can build the package::

    cd spk/toolchain-gccxx
    make arch-cederview

To make use of parallel making, you could add the option::

	MAKE_OPT="-j4"

to your local.mk setup file.


What is generated and what can we do now?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* You now have a new toolchain in the spksrc/toolchains directory called "syno-cedarview_gccxx-5.x".
* You can use this new toolchain to compile a package by using::

    cd spksrc/spk/helloworld
    make arch-cedarview_gccxx

* Packages build with the new toolchain will get the extension "<package_name>_cederview_gccxx_<version>.spk".
* There is a "toolchain-gccxx_cedarview_x.x.x" package in the spksrc/packages directory. You will need
  to install this package on your synology if you want to run the packages compiled with the new toolchain.

  
Removing the toolchain
----------------------

You can remove a toolchain by running::

    cd spksrc/spk/toolchain-gccxx
    make clean-cedarview

If you want to remove all toolchains::

    cd spksrc/spk/toolchain-gccxx
    make clean-all-arch

