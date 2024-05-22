#!/bin/tcsh

    # for root 
    # source /apps/root/PRO/setroot_CUE.csh

    # for hcana                                                                                                                                                                                    
               
    # setenv HCANA /home/cdaq/nps-2023/hcana
    setenv HCANA /work/hallc/c-lad/${USER}/software/hcana/bin/
    echo " Setting hcana from: "
    echo $HCANA
    echo " Edit this file if you want to use different hcana"
    # setenv LD_LIBRARY_PATH "$LD_LIBRARY_PATH":$HCANA
    # setenv PATH "$PATH":$HCANA/bin:$HCANA

    # for hallc_replay
    setenv DB_DIR DBASE
