set -e

for pageName in dstats NetCDF-D cblas dstats PydMagic clFFT-D libcerf OpenMPI parallel_algorithm; do
    wget -O ${pageName}.md https://raw.githubusercontent.com/DlangScience/${pageName}/master/README.md
done

