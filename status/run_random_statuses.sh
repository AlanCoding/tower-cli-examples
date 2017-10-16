
tower-cli organization create --name="Default"

tower-cli project create --name "tower-cli examples" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/tower-cli-examples.git --wait

tower-cli inventory create --name "random status inventory" --organization="Default"

for i in `seq 1 25`; do
    HOST_NAME="random_status_host_$i"
    echo "  creating new host $HOST_NAME"
    tower-cli host create --inventory="random status inventory" --name=$HOST_NAME
done

userval=$(echo $USER_OUTPUT| cut -d' ' -f 2)
tower-cli credential create --name="blank SSH" --user=$userval --inputs="{}" --credential-type="Machine"

tower-cli job_template create --name="generate random status" --inventory="random status inventory" --credential="blank SSH" --project="tower-cli examples" --playbook="status/random_status.yml"

tower-cli job launch -J "generate random status" --monitor
