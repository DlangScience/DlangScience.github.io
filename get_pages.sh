set -e

for pageName in dstats NetCDF-D cblas dstats PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    wget -O ${pageName}.md https://raw.githubusercontent.com/DlangScience/${pageName}/master/README.md
    echo -e '---\nlayout: default\n---\n' | cat - ${pageName}.md > ${pageName}_tmp
    mv ${pageName}_tmp ${pageName}.md
done

