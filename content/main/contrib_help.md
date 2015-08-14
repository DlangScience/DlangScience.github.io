# Getting started with DlangScience

Here is a pre-alpha draft of a bit of "getting started" documentation...

## Tips for newcomers

* if you are new to the D programming language see http://dlang.org/getstarted.html
* DlangScience depends heavily on [dub](http://code.dlang.org/getting_started) to manage package dependencies and versioning
* for a quickstart tutorial, see [Getting Started in D](http://d.readthedocs.org/en/latest/index.html)
* for a simple example using `dub` and a DlangScience module, see [here](https://github.com/DlangScience/cblas/tree/master/examples/gemmTest)

## Contributing to DlangScience

All the packages which make up DlangScience are hosted in their own github projects at ```https://github.com/DlangScience/<packageName>```. For the time being, development is proceeding quite independently in the projects. For example, issues are tracked separately within their respective Github sites and each project can be forked and cloned separately. 

### Guidelines for package owners

* instructions needed ...
* DUB usage instructions/pointers needed(?)

### Guidelines for other contributors

The basic process is:

1. get a github account and install git on your computer
2. fork the project in github
3. clone your github fork to your own computer
4. create a feature branch and make/commit changes within the branch
5. push the branch to your github fork
6. create a pull request within Github

The documentation for contributing to Numpy [here](http://docs.scipy.org/doc/numpy-dev/dev/index.html) provides excellent material for getting started with Git. The section on [Development workflow] (http://docs.scipy.org/doc/numpy-dev/dev/gitwash/development_workflow.html) is relevent for any package of DlangScience (following instructions for contributors, not core developers).

The [Rebasing](http://wiki.dlang.org/Pull_Requests#Rebasing) section of the Dlang wiki page on "pull requests" provides somewhat more succinct instructions that are also relevant here. (Note, however, the use "git pull" which is discouraged for newcomers in the NumPy instructions.)
