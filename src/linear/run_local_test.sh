#!/bin/bash
export LD_LIBRARY_PATH=$LD_LABRARY_PATH:$HADOOP_HOME/lib/native/

conf=guide/demo_lc.conf
model="./model.bin"
cat<<<"
train_data = \"../data/lc.train2\"
#val_data = \"../data/lc.train2\"
lr_eta=10
lr_beta=20
lambda_l1 = 0.0001
lambda_l2 = 10
model_out = \"$model\"
max_data_pass = 1
minibatch=2
"> $conf
source /etc/profile
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HADOOP_HOME/lib/native
export DMLC_JOB_CLUSTER=local
../../dmlc-core/tracker/dmlc-submit --cluster=local --jobname=train_linear_lc --worker-cores=1 --worker-memory=3g --server-cores=1 --server-memory=3g --num-workers=1 --num-servers=1 build/linear.dmlc $conf
build/dump.dmlc model_in=${model}_part-0 dump_out="dump.txt" need_inverse=1
