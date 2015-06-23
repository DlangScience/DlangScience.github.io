# DlangScience.github.io
DlangScience's website

## How it works:
The site uses Jekyll to generate a static site. This is done on github's servers.

All DlangScience repos (other than this one) are git submodules in the ```repos``` directory, each tracking the relevant master branch.

The pages for each individual repo should be held in the ```site``` subdirectory of that repo. Do not edit these pages from here, edit them in the relevant repository for that project.

Pages should be in github flavoured markdown. They are rendered by accessing the github markdown API (see ```md_to_html.py```) and copied to the relevant subdirectory, e.g. ```repos/dstats/site/index.md``` would be rendered to ```dstats/index.html```

to update the site to reflect changes in the submodule repos, run the following from the root folder of this repository:
```sh
git submodule update --remote
./get_pages.sh
git commit -m'update_site'
git push
```

you may have to manually add new pages.

If you want a repo to use its README.md as its index page, add an empty file ```site/readme_as_index``` in that repo.

DDOC in source files is rendered to html by calling ```gen_docs``` in each repository. ```gen_docs``` should generate the documentation and place it in ```site/api```.

The scripts are currently quite hacky and will likely need changing in the future.
