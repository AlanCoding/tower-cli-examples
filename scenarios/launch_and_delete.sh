cli_flag="created by tower-cli script"
pass="password"

# Organization
tower-cli organization create --name="Default" --description="$cli_flag"

# Projects
tower-cli project create --name="project for single job template" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git --monitor

# Inventories
tower-cli inventory create --name="inventory for single job template" --description="$cli_flag" --variables="ansible_connection: local" --organization=Default --description="$cli_flag"
tower-cli host create --name="127.0.0.1" --inventory="inventory for single job template"

# Credentials
tower-cli credential create --name "credential for single job template" --kind "ssh" --organization "Default" --description="$cli_flag"

# Job Templates
tower-cli job_template create --name="single demo job template" --inventory="inventory for single job template" --machine-credential="credential for single job template" --project="project for single job template" --playbook="debug.yml"


# --- launch ---
tower-cli job launch -J "single demo job template" --monitor
tower-cli job launch -J "single demo job template" --monitor
tower-cli job launch -J "single demo job template" --monitor


tower-cli project delete --name="project for single job template"

tower-cli job list

tower-cli inventory delete --name="inventory for single job template"

tower-cli job list

tower-cli job_template delete --name="single demo job template"

tower-cli job list