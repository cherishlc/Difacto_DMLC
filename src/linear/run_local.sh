#!/bin/bash

source /etc/profile
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native
#export DMLC_JOB_CLUSTER=yarn
../../dmlc-core/tracker/dmlc-submit --cluster=local --jobname=train_linear_lc --worker-cores=1 --worker-memory=3g --server-cores=1 --server-memory=3g --num-workers=1 --num-servers=1  build/linear.dmlc guide/demo.conf
build/dump.dmlc model_in="agaricus_model_part-0" dump_out="dump.txt" need_inverse=1
