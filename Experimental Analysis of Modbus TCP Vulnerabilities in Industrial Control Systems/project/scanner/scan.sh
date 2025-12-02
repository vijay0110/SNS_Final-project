#!/bin/bash

echo "===== Scanning Modbus Device ====="
nmap -sV -p502 modbus_device

echo "===== Modbus NSE Script ====="
nmap --script modbus-discover -p502 modbus_device

echo "===== Scanning FTP/Telnet/SSH ====="
nmap -sV -p21 ftp_server
nmap -sV -p23 telnet_server
nmap -sV -p22 ssh_server

echo "===== Default Credential Checks ====="
nmap --script ftp-brute -p21 ftp_server
nmap --script telnet-brute -p23 telnet_server
