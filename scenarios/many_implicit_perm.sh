# Script create the situation where a single user has permission to a single
# resource by an extrordinarily large number of implicit means

cli_flag="created in Tower-CLI looping script"
tower-cli organization create --name Default
tower-cli user create --username many_perm --password password --email asdf@asdf.com
tower-cli inventory create --name=inv_perm --organization=Default --description="$cli_flag"

for i in `seq 1 300`; do
    echo $i
    tower-cli team create --organization Default --name=team$i

    tower-cli role grant --type member --target-team=team$i --user=many_perm
    tower-cli role grant --type use --inventory=inv_perm --team team$i
done