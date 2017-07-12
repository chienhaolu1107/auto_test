#/bin/bash
target_f=$1
output_f=$2

# Check parameters
if [ -z "${target_f}" -o -z "${output_f}" ]; then
    echo "Usage: parse.sh [target_file] [output_file]"
    exit 1
fi

grep "module#*" $target_f |awk 'BEGIN {FS=" "}; {print $2,$3}' > $output_f
