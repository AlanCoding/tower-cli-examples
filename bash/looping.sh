tower-cli organization create --name Default
tower-cli user create --username res_perm --password password --email asdf@asdf.com

for i in `seq 1 25`; do
    echo $i
    tower-cli inventory create --name=inv$i --organization=Default
    tower-cli project create --name=proj$i --organization=Default --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git
    tower-cli credential create --name=cred$i --username="pi" --password="pass" --organization=Default --kind=ssh
    tower-cli job_template create --name=jt$i --inventory=inv$i --machine-credential=cred$i --project=proj$i --playbook=helloworld.yml

    tower-cli role grant --type use --inventory inv$i --user res_perm
    tower-cli role grant --type use --project proj$i --user res_perm
    tower-cli role grant --type use --credential cred$i --user res_perm
    tower-cli role grant --type execute --job-template jt$i --user res_perm
done