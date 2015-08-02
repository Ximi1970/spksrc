How to use the spk toolchain-gccxx package
==========================================


The toolchain-gccxx package creates a new toolchain for a synology architecture.


Status of the toolchains for DSM 4.3::

	architecture    ( toolchains:    	kernel  binutils  gcc  glibc )  binaries
			47 48 49 51 52
	
	bromolow	
	cedarview	
	evansport	
	x86		
	88f6281 (sf)	
	armada370 (hf)	
	armadaxp (hf)	
	ppc853x (hf)	
	qoriq (hf)	


Status of the toolchains for DSM 5.1::

	architecture    ( toolchains:    	kernel  binutils  gcc  glibc )  binaries
			47 48 49 51 52
	
	avoton		            X             ok      ok      ok    ok         ok
	bromolow	            X             ok      ok      ok    ok         ok
	cedarview	            X             ok      ok      ok    ok         ok
	evansport	            X             ok      ok      ok    ok         ok
	x64		            X             ok      ok      ok    ok         ok
	x86		            X             ok      ok      ok    ok         ok
	88f6281 (sf)	            X             ok      ok      ok    ok         ok
	armada370 (hf)	            X             ok      ok      ok    ok         ok
	armada375 (hf)	            X             ok      ok      ok    ok         ok
	armadaxp (hf)	            X             ok      ok      ok    ok         ok
	alpine (hf)	            X             ok      ok      ok    ok         ok
	comcerto2k (hf)	            X             ok      ok      ok    ok         ok
	ppc853x (hf)	                          
	qoriq (hf)	                          


Status of the toolchains for DSM 5.2::

	architecture    ( toolchains:    	kernel  binutils  gcc  glibc )  binaries  helloworld
			47 48 49 51 52
	
	avoton		            X             ok      ok      ok    ok         ok     (cannot test)
	bromolow	            X             ok      ok      ok    ok         ok     (cannot test)
	cedarview	            x             ok      ok      ok    ok         ok     ok
	evansport	            x             ok      ok      ok    ok         ok     (cannot test)
	x64		            X             ok      ok      ok    ok         ok     (cannot test)
	x86		            X             ok      ok      ok    ok         ok     (cannot test)
	88f6281 (sf)	            X             ok      ok      ok    ok         ok     ok
	armada370 (hf)	            X             ok      ok      ok    ok         ok     (cannot test)
	armada375 (hf)	            X             ok      ok      ok    ok         ok     (cannot test)
	armadaxp (hf)	            X             ok      ok      ok    ok         ok     (cannot test)
	alpine (hf)	            X             ok      ok      ok    ok         ok     (cannot test)
	comcerto2k (hf)	            X             ok      ok      ok    ok         ok     (cannot test)
	ppc853x (hf)	            -             --      --      --    --         --     (cannot test)
	qoriq (hf)	            -             --      --      --    --         --     (cannot test)

(sf)	Softfloat
(hf)	Hardfloat


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

