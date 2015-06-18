---
layout: default
---

# OpenMPI
D interface to Open MPI

Bindings to OpenMPI.

How to use:
==========
use ```mpi.d``` directly or as a dependency through dub.

This package is just headers, it deliberately doesn't instruct dub to link to anything. This is because there is such variation in what MPI needs to link to across different systems.
You will have to sort out linking yourself, perhaps using ```mpicc --showme:link``` to find out what needs to be linked to and where to find it and putting that in your dub.json* (see "libs" and "lflags" at http://code.dlang.org/package-format)

*you could also add the linker arguments to a local copy of this repository and configure dub, either globally or locally to a project, to use the local copy.

Obviously if you are just importing mpi.d directly or through another build system, you would have to handle the linking in that scheme.

An alternative approach would be generate an object file or static library in D, then link the final executable using ```mpicc```, passing the relevant library flags to link to phobos and any other D libraries you are using. Whatever works easiest for you.

Possible problems
=================
There could well be bits of mpi.h that are missing, this is a fork of an old repository and hasn't been thoroughly checked apart from the contents of the ```examples``` directory. If you find anything isn't where it should be, please tell! The same goes for any simple program that you know should work but mysteriously fails.
