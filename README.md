# DlangScience.github.io
DlangScience's website

## How to update the site

### Requirements
* git
* python 3.x
* [requests](https://pypi.python.org/pypi/requests)

### Instructions
* have an up-to-date clone of ```https://github.com/DlangScience/DlangScience.github.io``` including submodules (either clone with ```--recursive``` or run ```git submodule update --init```.
* ```git submodule update --remote``` to pull in the latest changes from the other DlangScience repos
* ```./get_pages.sh``` to convert the mardown files to html, generate documentation and copy the results to the relevant directories
* commit and either push to master or make a pull request.

To preview the site after running ```get_pages.sh``` to check everything worked you need ruby and bundler (```gem install bundler```). Run ```bundle install``` once in the root folder of this repo, then ```bundle exec jekyll serve``` to serve on ```localhost:4000```.

## How it works:
The site uses Jekyll to generate a static site. This is done on github's servers.

All DlangScience repos (other than this one) are git submodules in the ```content/repos``` directory, each tracking the relevant master branch.

The pages for each individual repo should be held in the ```site``` subdirectory of that repo. Do not edit these pages from here, edit them in the relevant repository for that project.

Pages should be in github flavoured markdown. They are rendered by accessing the github markdown API (see ```md_to_html.py```) and copied to the relevant subdirectory, e.g. ```content/repos/dstats/site/index.md``` would be rendered to ```dstats/index.html```

you may have to manually add new pages.

If you want a repo to use its README.md as its index page, add an empty file ```site/readme_as_index``` in that repo.

DDOC in source files is rendered to html by calling ```gen_docs``` in each repository. ```gen_docs``` should generate the documentation and place it in ```site/api```.

The scripts are currently quite hacky and will likely need changing in the future.
