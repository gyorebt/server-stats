# Server Stats Script

A simple Bash script to analyze basic server performance statistics.
https://roadmap.sh/projects/server-stats

## Features
- CPU usage
- Memory usage (percent + MB)
- Disk usage
- Top 5 CPU and memory processes
- Extra info: OS version, uptime, users, failed logins

## Requirements
- Bash shell
- Standard Linux tools: `ps`, `df`, `free`, `top`, `grep`, `awk`

## Usage
```bash
chmod +x server-stats.sh
./server-stats.sh
