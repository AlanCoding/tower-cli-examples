tower-cli organization create --name Default
cli_flag="created in Tower-CLI inventory stress test"

tower-cli inventory create --name="tower-cli large" --organization=Default --description="$cli_flag"

for i in `seq 1 25`; do
    echo $i
    tower-cli inventory_script create --name=script$i --script='#!/usr/bin/env python\nimport json\nprint json.dumps({"ungrouped": ["foobar"]})' --organization=Default
done


for i in `seq 1 25`; do
    echo $i
    tower-cli group create --inventory="tower-cli large" --name=l_group$i --description="$cli_flag"
    tower-cli host create --name=l_host$i --inventory="tower-cli large" --description="$cli_flag"
    tower-cli inventory_source create --name=l_source$i --source=custom --source-script=script$i --inventory="tower-cli large"
    tower-cli host associate --group=l_group$i --host=l_host$i
done
