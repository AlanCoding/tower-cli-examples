cli_flag="created by inventory_script of tower-cli examples"

# Organization
tower-cli organization create --name="Default" --description="$cli_flag"

# Inventories, groups, and scripts
tower-cli inventory create --name="script example - small" --description="$cli_flag" --variables="ansible_connection: local" --organization=Default
tower-cli inventory_script create --name="example-simple-script" --script="@bash/inv_scripts/simple.py" --organization="Default"
tower-cli group create --inventory="script example - small" --name="grp_w_src" --source="custom" --source-script="example-simple-script"

