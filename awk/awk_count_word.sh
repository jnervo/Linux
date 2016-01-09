awk -v RS='\\<a\\>' 'END {print --NR}' input.txt
