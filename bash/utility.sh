# Organization
tower-cli organization create --name="Default" --description="created by tower-cli RBAC script"

# Projects
tower-cli project create --name="permission testing playbooks" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/permission-testing-playbooks.git --monitor
tower-cli project create --name="utility playbooks" --organization "Default" --scm-type git --scm-url https://github.com/AlanCoding/utility-playbooks.git --monitor
tower-cli project create --name="Ansible examples" --organization "Default" --scm-type git --scm-url https://github.com/ansible/ansible-examples.git --monitor

# Inventories
tower-cli inventory create --name=localhost --description="local machine" --organization=Default
tower-cli host create --name="127.0.0.1" --inventory="localhost"

