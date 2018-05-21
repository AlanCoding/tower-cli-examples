# Playbook to Create All Statuses

This folder contains a playbook that (given a sufficient number of hosts)
will hit every one of the 4 states that may exist in the playbook
summary of an `ansible-playbook` run.

To Run this locally:

```
ansible-playbook -i "1,2,3,4,5,6,1_skip" status/random_status.yml
```

If you want to run this on Ansible Tower or AWX, then first install tower-cli.
Then, configure your credentials with tower-cli. After that, you can
reproduce this fully in the server via:

```
source status/run_random_statuses.sh
```

If you want to run against a local inventory that should behave in the
exact same way as the tower-cli example, then you can run:

```
ansible-playbook -i status/inv_ref.py status/random_status.yml
```

