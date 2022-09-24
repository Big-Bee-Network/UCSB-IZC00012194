#!/bin/bash
#
# ./make.sh [UCSB catalog number] 
#
# Make an animated gif bee movie using UCSB Naming Convention
# and archive their dependencies in a Preston archive.
#

CATALOG_NUMBER=${1:-UCSB-IZC00012194}

# track collection and extract images
preston track https://library.big-bee.net/portal/content/dwca/UCSB-IZC_DwC-A.zip\
  | preston dwc-stream\
  | grep "${CATALOG_NUMBER}"\
  | grep _3d_\
  | jq --raw-output '.["http://rs.tdwg.org/ac/terms/accessURI"]'\
  | xargs -L25 preston track

mkdir -p tmp

preston alias --log tsv\
  | grep "${CATALOG_NUMBER}"\
  | grep jpg\
  | cut -f1,3\
  | sort\
  | uniq\
  | cut -f2\
  | nl -n rz\
  | parallel --col-sep '\t' 'preston cat {2} > tmp/{1}.jpg'

BEE_GIF="${CATALOG_NUMBER}.gif"

# compile the images into a 
ffmpeg -i tmp/%06d.jpg -vf scale=320:240 "${BEE_GIF}"

cp "${BEE_GIF}" bee.gif

# append the movie to the Preston archive
preston track "file://$PWD/${BEE_GIF}"




