#!/usr/bin/env python

import os
import json
 
inv = dict(_meta=dict(hostvars={}), hosts=[])
 
NUM_HOSTS = os.getenv('NUM_HOSTS', '1')
 
if NUM_HOSTS and isinstance(NUM_HOSTS, str) and NUM_HOSTS.isdigit():
    NUM_HOSTS = int(NUM_HOSTS)
 
for num in range(0, NUM_HOSTS):
    host = u"host-%0.2d" % num
    inv['hosts'].append(host)
    inv['_meta']['hostvars'][host] = dict(ansible_ssh_host='127.0.0.1', ansible_connection='local')
 
print json.dumps(inv, indent=2)