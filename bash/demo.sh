cli_flag="created by tower-cli script"
pass="password"

# Organization
tower-cli organization create --name="Default" --description="$cli_flag"

# Projects
tower-cli project create --name="AlanCoding examples" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git --monitor
tower-cli project create --name="AlanCoding testing" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/utility-playbooks.git --monitor
tower-cli project create --name="Ansible examples" --organization "Default" --scm-type git --scm-url https://github.com/ansible/ansible-examples.git --monitor
tower-cli project create --name="jlaska examples" --organization "Default" --scm-type git --scm-url https://github.com/jlaska/ansible-playbooks.git --monitor

# Inventories
tower-cli inventory create --name=localhost --description="local machine" --organization=Default --description="$cli_flag"
tower-cli host create --name="127.0.0.1" --inventory="localhost"
tower-cli inventory create --name="blank_inventory" --description="$cli_flag" --organization=Default
tower-cli group create --inventory="blank_inventory" --name="blank_group" --description="$cli_flag"

# Credentials
tower-cli credential create --name "blank_credential" --kind "ssh" --organization "Default" --description="$cli_flag"

# Job Templates
tower-cli job_template create --name="Hello World" --inventory="blank_inventory" --machine-credential="blank_credential" --project="AlanCoding examples" --playbook="helloworld_multiple_plays.yml"
tower-cli job_template create --name="Hello World prompting" --inventory="blank_inventory" --machine-credential="blank_credential" --project="AlanCoding examples" --playbook="helloworld_multiple_plays.yml" --ask-variables-on-launch=true --ask-limit-on-launch=true --ask-tags-on-launch=true --ask-job-type-on-launch=true --ask-inventory-on-launch=true --ask-credential-on-launch=true --extra-vars="jt_var: value"

# Inventory sscripts
tower-cli inventory_script create --name="example-inv-script" --script='#!/usr/bin/env python\nimport os' --organization="Default"

# Example users
tower-cli user create --username="sys_admin" --password="$pass" --email="user@redhat.com" --is-superuser=true
tower-cli user create --username="sys_auditor" --password="$pass" --email="user@redhat.com" --is-system-auditor=true
tower-cli user create --username="org_auditor" --password="$pass" --email="user@redhat.com"
tower-cli role grant --type="auditor" --organization="Default" --user="org_auditor"
tower-cli role grant --type="member" --organization="Default" --user="org_auditor"
tower-cli user create --username="org_admin" --password="$pass" --email="org_admin@redhat.com"
tower-cli organization associate_admin --organization="Default" --user="org_admin"
tower-cli organization associate --organization="Default" --user="org_admin"
tower-cli user create --username="org_member" --password="$pass" --email="org_member@redhat.com"
tower-cli organization associate --organization="Default" --user="org_member"
tower-cli user create --username="orphan_user" --password="$pass" --email="rando@redhat.com"


# User structure examples
tower-cli organization create --name "CLI_org" --description="$cli_flag"
tower-cli user create --username="cli_org_member" --password="$pass" --email="member@redhat.com"
tower-cli organization associate --organization="CLI_org" --user="cli_org_member"

tower-cli team create --name="ateam" --organization="CLI_org" --description="$cli_flag"
tower-cli user create --username="cli_team_member" --password="$pass" --email="dude@ansible.com"
tower-cli user create --username="team_admin" --password="$pass" --email="admin@ansible.com"
tower-cli team associate --team="ateam" --user="cli_team_member"
tower-cli team associate --team="ateam" --user="team_admin"
tower-cli role grant --type "admin" --target-team "ateam" --user "team_admin"

tower-cli organization create --name "CLI_org2" --description="$cli_flag"
tower-cli user create --username="dual_member" --password="$pass" --email="member@redhat.com"
tower-cli organization associate --organization="CLI_org" --user="dual_member"
tower-cli organization associate --organization="CLI_org2" --user="dual_member"
tower-cli user create --username="foreign_team_member" --password="$pass" --email="member@redhat.com"
tower-cli organization associate --organization="CLI_org2" --user="foreign_team_member"
tower-cli team associate --team="ateam" --user="foreign_team_member"

tower-cli user create --username="former_member" --password="$pass" --email="member@redhat.com"
tower-cli organization associate --organization="CLI_org" --user="former_member"
tower-cli organization associate --organization="CLI_org2" --user="former_member"
tower-cli organization associate_admin --organization="CLI_org2" --user="former_member"
tower-cli team associate --team="ateam" --user="former_member"
tower-cli role grant --type "admin" --target-team "ateam" --user "former_member"
# revoke everything
tower-cli organization disassociate --organization="CLI_org" --user="former_member"
tower-cli organization disassociate --organization="CLI_org2" --user="former_member"
tower-cli organization disassociate_admin --organization="CLI_org2" --user="former_member"
tower-cli team disassociate --team="ateam" --user="former_member"
tower-cli role revoke --type "admin" --target-team "ateam" --user "former_member"

# Granting roles on normal resources
tower-cli role grant --type "use" --inventory "blank_inventory" --team "ateam"
# tower-cli role grant --type "use" --credential "blank_credential" --team "ateam"
tower-cli role grant --type "use" --project "AlanCoding examples" --team "ateam"
tower-cli role grant --type "execute" --job-template "Hello World" --team "ateam"

# resource permission examples
tower-cli user create --username="jt_admin" --password="$pass" --email="dude@ansible.com"
tower-cli role grant --type "admin" --job-template "Hello World" --user "jt_admin"
