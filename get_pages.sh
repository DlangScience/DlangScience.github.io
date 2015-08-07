set -e

for pageName in . dstats NetCDF-D cblas PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    echo -e "****************\nbuilding: $pageName\n****************"
    if [ $pageName != . ]
    then
        if [ ! -d repos/${pageName}/site ]
        then
            echo No site directory found for repo $pageName
            continue
        fi
        rm -rf ${pageName}
        mkdir ${pageName}
        
        pushd repos/${pageName}
        ./gen_docs
        popd
        
        if [ -f repos/${pageName}/site/readme_as_index ]
        then
            cat repos/${pageName}/README.md | tr -d '\r' > ${pageName}/index.md
        fi
        cp -r repos/${pageName}/site/* ${pageName}/
    fi
    for page in $(find ${pageName} -name \*.md); do
        page_html=${page%.*}.html
        python3 md_to_html.py $page > $page_html
        if [$pageName != .]
        then
            rm $page
        fi
        if [ "$(head -n1 $page_html | tr -d '\n')" != '---' ]
        then
            sed '1i\
---\
layout: default\
---\
' $page_html > _tmp_
            mv _tmp_ $page_html
        fi
    done
    break
done
