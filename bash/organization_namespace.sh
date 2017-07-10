cli_flag="created in organization namespace tower-cli script"

# Organization
tower-cli organization create --name="org1" --description="$cli_flag"
tower-cli organization create --name="org2" --description="$cli_flag"

# Inventories
tower-cli inventory create --name="namespace" --description="$cli_flag" --variables="ansible_connection: local" --organization="org1" --description="$cli_flag"
tower-cli host create --name="127.0.0.1" --inventory="namespace"

tower-cli inventory create --name="namespace" --description="$cli_flag" --variables="ansible_connection: local" --organization="org2" --description="$cli_flag"
# tower-cli host create --name="127.0.0.1" --inventory="namespace" --organization="org2"
