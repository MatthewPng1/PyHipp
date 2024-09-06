#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

<<<<<<< HEAD
echo "#==========================================================="
echo "Start Times"
for file in *-slurm.queue1-*.out; do
    if [[ -f "$file" ]]; then
        start_time=$(grep -oP 'time.struct_time\(.*\)' "$file" | head -n 1)
        echo "==> $file <=="
        echo "$start_time"
    fi
done

echo "End Times"
for file in *-slurm.queue1-*.out; do
    if [[ -f "$file" ]]; then
	start_time=$(grep -oP 'time.struct_time\(.*\)' "$file" | head -n 1)
        end_time=$(grep -oP 'time.struct_time\(.*\)' "$file" | tail -n 1)
	echo "==> $file <=="
	echo "$end_time"
	read -r start_hour start_minute start_second <<< $(echo "$start_time" | grep -oP 'tm_hour=\K[0-9]+|tm_min=\K[0-9]+|tm_sec=\K[0-9]+')
        #echo "Start time extracted: Hour=$start_hour Minute=$start_minute Second=$start_second"  # Debugging
	#echo "$start_seconds"
	read -r end_hour end_minute end_second <<< $(echo "$end_time" | grep -oP 'tm_hour=\K[0-9]+|tm_min=\K[0-9]+|tm_sec=\K[0-9]+')
        #echo "End time extracted: Hour=$end_hour Minute=$end_minute Second=$end_second"  # Debugging
	#echo "$end_seconds"
	start_seconds=$(( start_hour * 3600 + start_minute * 60 + start_second ))
        end_seconds=$(( end_hour * 3600 + end_minute * 60 + end_second ))
	duration=$((end_seconds - start_seconds))
	echo "$duration"
	aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:586794440329:awsnotify --message "JobDone"
    fi
done


echo "#==========================================================="
=======
echo "Start Times"
head -n 1 *.out

echo "End Times"
tail -n 5 *.out 
>>>>>>> upstream/main
