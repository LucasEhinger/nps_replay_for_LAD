#!/bin/bash
#For now, save all root & output files in volatile

ifarm_flg=0
cdaq_flg=0

if echo $HOSTNAME | grep -q "ifarm"; then
  ifarm_flg=1
elif echo $HOSTNAME | grep -q "cdaq"; then
  cdaq_flg=1
fi

set_hcana_link() {
  if [[ -z $HCANALYZER ]]; then
    echo ""
    echo "Environment variable: $HCANALYZER does NOT exist. "
    echo "Please make sure to do: source setup.sh(csh) in hcana first. "
    echo ""
  else
    echo ""
    echo "Creating hcana symbolic link now  . . ."
    ln -sf $HCANALYZER"/hcana"
    ln -sf $HCANALYZER"/libHallC.so"
    ln -sf $HCANALYZER"/libHallC.so.0.90.0"
    echo ""
  fi
}

fsys="volatile"

if [[ ifarm_flg -eq 1 ]]; then

  set_hcana_link

  if [[ $fsys == "volatile" ]]; then
    echo ""
    echo 'Setting up symbolic links to volatile filesystem on ifarm . . .'
    base_dir_voli="/volatile/hallc/c-lad/"

    echo "Creating dir $base_dir_voli$USER . . ."
    mkdir $base_dir_voli$USER

    unlink ROOTfiles
    echo "Creating dir and symlink to $base_dir_voli$USER/ROOTfiles . . ."
    mkdir $base_dir_voli$USER"/ROOTfiles"
    ln -sf $base_dir_voli$USER"/ROOTfiles"

    unlink REPORT_OUTPUT
    echo "Creating dir and symlink to $base_dir_voli$USER/REPORT_OUTPUT . . ."
    mkdir -p $base_dir_voli$USER"/REPORT_OUTPUT/NPS/eel108"
    ln -sf $base_dir_voli$USER"/REPORT_OUTPUT"

    # unlink cache
    # echo "Creating symlink to /cache/hallc/c-cafe-2022/raw/"
    # ln -sf $cache_raw_dir_cafe cache_cafe

    # /cache/hallc/c-nps/raw/

    echo ""
  fi
fi
