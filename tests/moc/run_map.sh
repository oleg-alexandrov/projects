#!/bin/bash

. isis_setup.sh

dir=map
rm -rfv $dir
stereo M0100115.map.cub E0201461.map.cub $dir/$dir -s stereo.default --corr-search -300 -300 -200 -200
point2dem -r mars $dir/$dir-PC.tif
show_dems.pl $dir/$dir-DEM.tif
~/bin/cmp_images.sh x "$dir"_gold/$dir-PC.tif $dir/$dir-PC.tif
~/bin/cmp_images.sh x "$dir"_gold/$dir-L.tif $dir/$dir-L.tif
~/bin/cmp_images.sh x "$dir"_gold/$dir-R.tif $dir/$dir-R.tif
~/bin/cmp_images.sh x "$dir"_gold/$dir-lMask.tif $dir/$dir-lMask.tif
~/bin/cmp_images.sh x "$dir"_gold/$dir-rMask.tif $dir/$dir-rMask.tif
