#! /usr/bin/env python

# hide IPv6 route error message
import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

from scapy.all import *


# 1. Send packet to 10.0.0.1 (use with tcpdump -n host 10.0.0.1 and host 10.0.0.2)
sr(IP(dst="10.0.0.2")/TCP())
