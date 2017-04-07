#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
inventory = {}
inventory["group-ぁあぃいぅうぇえ"] = []
inventory["group-豈更車賈滑串"].append("host-ႧႨႩႪႫႬႭႮႯ")
inventory["group-ㄲㄳㄴㄵㄶㄷㄸㄹ"].append("host-ಌಎಏಐಒಓಔಕಖಗಘ")
inventory["group-ℋℌℍℎℏℐℑℒ"].append("host-ఉఊఋఌఎ")
inventory["group-ⅢⅣⅤⅥⅦⅧⅨ"].append("host-ऋऌऍऎएऐऑ")
inventory["group-ἀἁἂἃἄἅἆἇἈἉ"].append("host-ЌЎЏАБВГД")
print json.dumps(inventory)