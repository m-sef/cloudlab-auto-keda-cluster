#!/usr/bin/env bash
# Author(s): Han Dong (hdong@hamilton.edu)
#            Seth Moore (slmoore@hamilton.edu)

# --- CONFIGURATION (Hardcoded for simplicity) ---
TOTAL_RUNS=1 # How many times to rerun the whole experiment
TARGET_URL="http://$(kubectl get svc webserver-service -n webserver -o jsonpath='{.spec.clusterIP}')"

BENCHMARK_NAME=$1

run_experiment()
{
    # --- MAIN LOOP FOR RERUNS ---
    for run_id in $(seq 1 ${TOTAL_RUNS}); do
    echo "=========================================="
    echo " STARTING EXPERIMENT RUN: ${run_id} @ ${TARGET_URL}"
    echo "=========================================="
    
    # 1. Create a clean folder for this specific run's results
    FOLDER_NAME="results/${BENCHMARK_NAME}/experiment_run_${run_id}"
    mkdir -p "${FOLDER_NAME}"

    # 2. Start HPA monitoring in the background and log to watch.log
    echo "NAME   REFERENCE        TARGETS        MINPODS   MAXPODS   REPLICAS   AGE" > "${FOLDER_NAME}/watch.log"
    
    # This loop runs silently in the background ($! grabs its process ID)
    while true; do
        kubectl get hpa -n webserver | tail -n 1 >> "${FOLDER_NAME}/watch.log" 2>/dev/null
        sleep 1
    done &
    WATCHER_PID=$!

    BURN=40
    
    {
        echo "GET ${TARGET_URL}:8080/?burn=${BURN}" | vegeta attack -rate=10/s -duration=1m
        echo "GET ${TARGET_URL}:8080/?burn=${BURN}" | vegeta attack -rate=60/s -duration=3m
        echo "GET ${TARGET_URL}:8080/?burn=${BURN}" | vegeta attack -rate=10/s -duration=1m
    } | vegeta report -every=1s -output="${FOLDER_NAME}/vegeta.log"

    sleep 5m

    # 5. Stop the background HPA watcher
    kill ${WATCHER_PID}
    
    echo "RUN ${run_id} COMPLETE! Output saved to folder: ${FOLDER_NAME}"
    echo "------------------------------------------"
    done

    echo "ALL RUNS COMPLETED SUCCESSFULLY."
}

run_experiment

exit 0
