set -e

for pageName in dstats NetCDF-D cblas dstats PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    mkdir -p ${pageName}
    wget -O ${pageName}/index.md https://raw.githubusercontent.com/DlangScience/${pageName}/master/README.md
    echo -e '---\nlayout: default\n---\n' | cat - ${pageName}/index.md > ${pageName}/_tmp
    mv ${pageName}/_tmp ${pageName}/index.md
done

