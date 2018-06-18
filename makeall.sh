export MAKEDMLC="make USE_HDFS=1 USE_GLOG=1 -j8"  
cd dmlc-core; $MAKEDMLC; cd -  
cd ps-lite; $MAKEDMLC; cd -  
cd src/linear; $MAKEDMLC  
