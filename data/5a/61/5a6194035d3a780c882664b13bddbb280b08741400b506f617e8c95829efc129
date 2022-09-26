#!/bin/bash
#
# ./make.sh [DWC-A URL] [UCSB catalog number] 
#
# Make an animated gif bee movie using UCSB Naming Convention
# and archive their dependencies in a Preston archive.
#

set -xe

DWC_URL=${1:-https://library.big-bee.net/portal/content/dwca/UCSB-IZC_DwC-A.zip}
CATALOG_NUMBER=${2:-UCSB-IZC00012194}

function track-collection-extract-images {
  preston track "${DWC_URL}"\
  | preston dwc-stream\
  | grep "${CATALOG_NUMBER}"\
  | grep _3d_\
  | jq --raw-output '.["http://rs.tdwg.org/ac/terms/accessURI"]'\
  | xargs -L25 preston track
}

function build-animated-gif {
  mkdir -p tmp

  preston alias --log tsv\
  | grep "${CATALOG_NUMBER}"\
  | grep jpg\
  | cut -f1,3\
  | sort\
  | uniq\
  | cut -f2\
  | tee tmp/image-hashes.txt\
  | nl -n rz\
  | parallel --col-sep '\t' 'preston cat {2} > tmp/{1}.jpg'

  BEE_GIF="${CATALOG_NUMBER}.gif"

  # compile the images into an animated gif 
  ffmpeg -y -i tmp/%06d.jpg -vf scale=320:240 "${BEE_GIF}"

  cp "${BEE_GIF}" bee.gif

  # append the movie to the Preston archive
  BEE_GIF_HASH=$(preston track "file://$PWD/${BEE_GIF}" | grep hasVersion | grep -o -P "hash://sha256/[a-f0-9]{64}")

  # record the content of this script
  SCRIPT_HASH=$(preston track "file://$PWD/$0" | grep hasVersion | grep -o -P "hash://sha256/[a-f0-9]{64}")

  echo "<$BEE_GIF_HASH> <http://www.w3.org/ns/prov#wasGeneratedBy> <$SCRIPT_HASH> ."\
  | preston process 


  cat tmp/image-hashes.txt\
  | xargs -I{} echo "<$BEE_GIF_HASH> <http://www.w3.org/ns/prov#wasDerivedFrom> <{}> ."\
  | preston process 
}

function associate-derived-model {
  MODEL_FILES="UCSB-IZC00012194.mtl UCSB-IZC00012194.obj UCSB-IZC00012194.jpg"
  MODEL_FILE_URLS=$(echo ${MODEL_FILES} | sed "s+UCSB+file://${PWD}/UCSB+g") 
  MODEL_FILE_HASHES=$(echo ${MODEL_FILE_URLS} | xargs preston track | grep hasVersion | grep -Po "hash://sha256/[a-f0-9]{64}")
  for contentId in $MODEL_FILE_HASHES
  do
    cat tmp/image-hashes.txt\
    | xargs -I{} echo "<${contentId}> <http://www.w3.org/ns/prov#wasDerivedFrom> <{}> ."\
    | preston process
  done
}

function generate-label {
  preston label > label.png
}

track-collection-extract-images
build-animated-gif
associate-derived-model
generate-label
