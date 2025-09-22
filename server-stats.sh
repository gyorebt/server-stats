#!/bin/bash

Cpu_Usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
echo "============================="
echo "CPU usage: $Cpu_Usage%"

Mem_Usage=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')
echo "============================="
echo "Memory usage: $Mem_Usage%"

Disk_Info=$(df -h --total | grep 'total')
Total_Size=$(echo $Disk_Info | awk '{print $2}')
Used_Size=$(echo $Disk_Info | awk '{print$3}')
Free_Size=$(echo $Disk_Info | awk '{print$4}')
Used_Percent=$(echo $Disk_Info | awk '{print$5}')
echo "============================="
echo "Disk usage:"
echo "	Total: $Total_Size""B"
echo "	Used: $Used_Size""B"
echo "	Free: $Free_Size""B"
echo "	Usage: $Used_Percent"

echo "============================="
echo "Top 5 CPU usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "Top 5 Memory usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo "============================="
echo -n "OS Version: "
grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"'

echo "============================="
echo -n "Uptime: "
uptime -p

echo "============================="
echo -n "Logged in users: "
who

echo "============================="
echo -n "Failed login attempts: "
grep "Failed password:" /var/log/auth.log | wc -l
echo "============================="
