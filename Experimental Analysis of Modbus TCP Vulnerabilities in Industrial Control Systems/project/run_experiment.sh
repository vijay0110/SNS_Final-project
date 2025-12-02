#!/bin/bash

echo "===== Fingerprinting Modbus (Port 502) ====="
sudo nmap -sV -p502 localhost

echo "===== Running Modbus NSE Script ====="
sudo nmap --script modbus-discover -p502 localhost

echo "===== Scanning All Ports 1–1024 ====="
sudo nmap -sV -p1-1024 localhost
