tower-cli organization create --name Default
tower-cli user create --username res_perm --password password --email asdf@asdf.com
tower-cli role grant --type member --organization Default --user res_perm

for i in `seq 1 25`; do
    echo $i
    tower-cli inventory create --name=inv$i --organization=Default --description="made in CLI looping script"
    tower-cli project create --name=proj$i --organization=Default --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git --description="made in CLI looping script" --monitor
    tower-cli credential create --name=cred$i --username="pi" --password="pass" --organization=Default --kind=ssh --description="made in CLI looping script"
    tower-cli job_template create --name=jt$i --inventory=inv$i --machine-credential=cred$i --project=proj$i --playbook=helloworld.yml --description="made in CLI looping script"
    tower-cli organization create --name=org$i --description="made in CLI looping script"

    tower-cli role grant --type use --inventory inv$i --user res_perm
    tower-cli role grant --type use --project proj$i --user res_perm
    tower-cli role grant --type use --credential cred$i --user res_perm
    tower-cli role grant --type execute --job-template jt$i --user res_perm
    tower-cli role grant --type admin --organization=org$i --user res_perm
done