set -e

for pageName in content/main $(ls content/repos/); do
    printf "****************\nbuilding: $pageName\n****************\n"
    
    if [ $pageName != content/main ]
    then
        rm -rf ${pageName}
        mkdir ${pageName}
    
        pushd content/repos/${pageName}
        if [ -f gen_docs ]
        then
            ./gen_docs
        else
            dub build --build=DSddox
        fi
        popd
        
        if [ -f content/repos/${pageName}/site/readme_as_index ]
        then
            cat content/repos/${pageName}/README.md | tr -d '\r' > ${pageName}/index.md
        fi
        cp -r content/repos/${pageName}/site/* ${pageName}/
        rsync -ru api_format/ $pageName/api/

        mdFiles=$(find ${pageName} -name \*.md)
    else
        cp -r content/main/* .
        mdFiles=$(find content/main -name \*.md | sed "s|^content/main/||")
    fi

    for page in $mdFiles; do
        if [ "$(head -n1 $page | tr -d '\n')" = --- ]
        then
            sed -n '/^---/,/^---/p' $page > header
            sed '/^---/,/^---/d' $page > body
        else
            cp $page body
            printf -- "---\nlayout: default\n---\n" > header
        fi

        page_html=${page%.*}.html
        python3 md_to_html.py body > processed
        cat header processed > $page_html

        rm $page body header processed
    done
done
