set -e

for pageName in dstats NetCDF-D cblas dstats PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    if [ ! -d repos/${pageName}/site ]
    then
        echo No site directory found for repo $pageName
        continue
    fi
    rm -r ${pageName}
    mkdir ${pageName}
    if [ -f repos/${pageName}/site/readme_as_index ]
    then
        echo -e '---\nlayout: default\n---\n' | cat - repos/${pageName}/README.md | tr -d '\r' > ${pageName}/index.md
    fi
    cp -r repos/${pageName}/site/* ${pageName}/
done

