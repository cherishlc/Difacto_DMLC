BIN_PATH=`readlink -f $0`
BIN_PATH=`dirname $BIN_PATH`

nosysglog=0
if [ $nosysglog -eq 1 ]; then
  # suppose glog is in ../glog
  export GLOG_HOME=`realpath $BIN_PATH/../glog`  
  echo $GLOG_HOME

  # g++ header file path 
  export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:$GLOG_HOME/src 
  export EXTRA_INCLUDES=$GLOG_HOME/src  
  # g++ libfile path  
  export LIBRARY_PATH=$LIBRARY_PATH:$GLOG_HOME/.libs  
  # .so file path  
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GLOG_HOME/.libs 
fi

 
export MAKEDMLC="make USE_HDFS=1 USE_GLOG=1 -j8"  
cd dmlc-core; $MAKEDMLC; cd -  
cd ps-lite; $MAKEDMLC; cd -  
cd src/linear; $MAKEDMLC  
