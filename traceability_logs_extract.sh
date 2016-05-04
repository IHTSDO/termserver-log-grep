#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters. Please give the task id"
    exit 1
fi
task=$1
echo "Extracting task $task"
for file in `ls ../snomed-traceability_* | grep gz`; do echo $file; gunzip -c $file | grep $task | tee tmp.log; done
for file in `ls ../snomed-traceability* | grep -v gz`; do echo $file; cat $file | grep $task | tee -a tmp.log; done
cat tmp.log | sort > "${task}-traceability.log"
rm -f tmp.log
echo "Extraction complete"

