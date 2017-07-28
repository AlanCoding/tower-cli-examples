cli_flag="created by tower-cli script"
pass="password"

# Organization
tower-cli organization create --name="Default" --description="$cli_flag"

# Projects
tower-cli project create --name="sleep" --organization "Default" --scm-type git --scm-url https://github.com/jlaska/ansible-playbooks.git --wait

# Inventories
tower-cli inventory create --name="local" --description="$cli_flag" --variables="ansible_connection: local" --organization=Default --description="$cli_flag"
tower-cli host create --name="127.0.0.1" --inventory="local"

# Credentials
tower-cli credential create --name "stub" --kind "ssh" --organization "Default" --description="$cli_flag"

# Job Templates
tower-cli job_template create --name="simultaneous sleeping" --inventory="local" --machine-credential="stub" --project="sleep" --playbook="sleep.yml" --extra-vars='sleep_interval: 90' --allow-simultaneous=true

# --- launch many jobs ---
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"
tower-cli job launch -J "simultaneous sleeping"

