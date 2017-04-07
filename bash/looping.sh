tower-cli organization create --name Default
tower-cli user create --username res_perm --password password --email asdf@asdf.com
tower-cli role grant --type member --organization Default --user res_perm
cli_flag="created in Tower-CLI looping script"

for i in `seq 1 25`; do
    echo $i
    tower-cli inventory create --name=inv$i --organization=Default --description="$cli_flag"
    tower-cli group create --inventory=inv$i --name=group$i --description="$cli_flag"
    tower-cli host create --name=group$i --inventory=inv$i --description="$cli_flag"
    tower-cli project create --name=proj$i --organization=Default --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git --description="$cli_flag" --wait
    tower-cli credential create --name=cred$i --username="pi" --password="pass" --organization=Default --kind=ssh --description="$cli_flag"
    tower-cli job_template create --name=jt$i --inventory=inv$i --machine-credential=cred$i --project=proj$i --playbook=helloworld.yml --description="$cli_flag"
    tower-cli organization create --name=org$i --description="$cli_flag"

    tower-cli role grant --type use --inventory inv$i --user res_perm
    tower-cli role grant --type use --project proj$i --user res_perm
    tower-cli role grant --type use --credential cred$i --user res_perm
    tower-cli role grant --type execute --job-template jt$i --user res_perm
    tower-cli role grant --type admin --organization=org$i --user res_perm
done