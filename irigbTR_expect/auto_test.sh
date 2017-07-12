#!/bin/sh
ip=$1
uname=$2
passwd=$3
output_f=$4
exp_f="auto_test.exp"

# Parameter settings

if [ -z "${ip}" -o -z "${uname}" -o -z "${passwd}" -o -z "${output_f}" ]; then
    echo "Usage: auto_test.sh [ip] [username] [password] [output_file]"
    exit 1
fi

if [ ! -f ${exp_f} ]; then
    echo "Error: ${exp_f} is not found."
    exit 1
fi

# Check IP
echo -n "> Check IP... "
ping ${ip} -c 1 > /dev/null
if [ $? -ne 0 ]; then
    echo 
    echo "Error: ${ip} is not attachable."
    echo "Please make sure test host and DUT's IP are in the same subnet."
    exit 1	
else
    echo "OK !"
fi

# Execute commands
for((i=0; i<10001; i++))
do
expect ${exp_f} ${ip} ${uname} ${passwd} >> ${output_f}
done
exit 0
