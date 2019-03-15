#!/bin/bash
# Exporting all WPA/2 passwords to a file on my external
# Shutting down afterwards
# 2,181,085,471 <-- billion

pyrit -o /media/root/16312989719ED100/Vault/passwords/wpamasterlist.txt export_passwords
shutdown -P
