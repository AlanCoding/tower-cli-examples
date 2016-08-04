# Projects
tower-cli project delete --name="AlanCoding examples"
tower-cli project delete --name="AlanCoding testing"
tower-cli project delete --name="Ansible examples"
tower-cli project delete --name="jlaska examples"

# Inventories
tower-cli host delete --name="127.0.0.1" --inventory="localhost"
tower-cli inventory delete --name=localhost
tower-cli group delete --inventory="blank_inventory" --name="blank_group"
# tower-cli inventory delete --name="blank_inventory"

# Credentials
# tower-cli credential delete --name "blank_credential"

# Job Templates
tower-cli job_template delete --name="Hello World"
tower-cli job_template delete --name="Hello World prompting"


# User structure examples
tower-cli team delete --name="ateam"
tower-cli organization delete --name "CLI_org"
tower-cli user delete --username="org_admin"
tower-cli user delete --username="org_member"

tower-cli user delete --username="team_member"
tower-cli user delete --username="team_admin"

tower-cli organization delete --name "CLI_org2"
tower-cli user delete --username="dual_member"
tower-cli user delete --username="foreign_team_member"

tower-cli user delete --username="former_member"

