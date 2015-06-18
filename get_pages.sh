set -e

for pageName in dstats NetCDF-D cblas dstats PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    if [ -f repos/${pageName}/site/readme_as_index] then
        echo -e '---\nlayout: default\n---\n' | cat - repos/${pageName}/README.md > ${pageName}/index.md
    fi
    cp repos/${pageName}/site ${pageName}
done

