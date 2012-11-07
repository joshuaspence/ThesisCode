#!/bin/bash

for DATASET in $(du Datasets/*.csv | sort -n | awk '{print $2}'); do
    RAW_DATASET=$(basename $DATASET ".csv")
    echo "Processing ${RAW_DATASET} dataset"

    echo "Cleaning up"
    rm animation.*.gif animation.gif 2>/dev/null

    matlab -nodesktop -nosplash -r "addpath(genpath('.')); commute_distance_anomaly('${DATASET}', 'TopN_Outlier_Pruning_Block_MATLAB_SORTED')"

    echo "Combining GIFs"
    MIN=$(ls -al | sed -n -e 's/.*animation.\([0-9]\+\).gif.*/\1/p' | sort --numeric-sort | head -n 1)
    MAX=$(ls -al | sed -n -e 's/.*animation.\([0-9]\+\).gif.*/\1/p' | sort --numeric-sort | tail -n 1)
    gifsicle --merge --careful --optimize=3 --no-loopcount --conserve-memory $(for i in $(seq $MIN $MAX); do echo -n "animation.$i.gif "; done) > ${DATASET}.gif
done