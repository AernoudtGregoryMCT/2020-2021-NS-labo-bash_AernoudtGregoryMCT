#!/bin/bash

# Purpose: Alert about the TLS/SSL cert expiry date in advance
# -------------------------------------------------------------------------------
PEM="/etc/nginx/ssl/letsencrypt/cyberciti.biz/cyberciti.biz.fullchain.cer"
 
# 14 days in seconds 
DAYS="1209600" 
 
sub="$PEM will expire within $DAYS (14 days)."
openssl="/usr/bin/openssl"
dest_dir="/home/student/certificates_dir/"
$openssl x509 -enddate -noout -in "$PEM"  -checkend "$DAYS" | grep -q 'Certificate will expire'

echo "$sub" >> expire_certs.txt
