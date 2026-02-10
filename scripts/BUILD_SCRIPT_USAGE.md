# Build Script Usage Guide

## Overview
The `build-all-projects.sh` script has been updated to support background execution with comprehensive logging to a master log file.

## Features
- ✅ Run in background or foreground mode
- ✅ All output logged to `master.log`
- ✅ All Maven commands run as background processes
- ✅ Individual project logs maintained
- ✅ PID tracking for background processes
- ✅ Timestamped log directories

## Usage

### Foreground Mode (Original Behavior)
Run the script normally to see output in the terminal:
```bash
cd ~/apache_src
./build-all-projects.sh
```

### Background Mode (New Feature)
Run the script in the background with all output going to master.log:
```bash
cd ~/apache_src
./build-all-projects.sh --background
# or
./build-all-projects.sh -bg
```

## Log Files

### Master Log
- **Location**: `~/apache_src/build-logs/master.log`
- **Content**: All script output, timestamps, Maven PIDs, and build status
- **Purpose**: Single file to track all build activity across runs

### Individual Project Logs
- **Location**: `~/apache_src/build-logs/YYYYMMDD_HHMMSS/`
- **Files**:
  - `drools_1.log`
  - `optaplanner_2.log`
  - `runtimes_3.log`
  - `apps_4.log`
  - `examples_5.log`

### PID File
- **Location**: `~/apache_src/build-logs/build-all-projects.pid`
- **Purpose**: Track the background process ID

## Monitoring Background Builds

### View Real-time Progress
```bash
tail -f ~/apache_src/build-logs/master.log
```

### Check if Process is Running
```bash
ps -p $(cat ~/apache_src/build-logs/build-all-projects.pid)
```

### Stop Background Process
```bash
kill $(cat ~/apache_src/build-logs/build-all-projects.pid)
```

## How It Works

### Background Execution
1. Script detects `--background` or `-bg` flag
2. Main function runs in a subshell with output redirected to master.log
3. Process ID saved to PID file
4. Script exits immediately, leaving build running in background

### Maven Background Processes
- Each `mvn` command runs as a background process using `&`
- Script captures Maven PID and logs it to master.log
- Script waits for each Maven process to complete before proceeding
- Exit codes are properly captured and handled

### Logging Strategy
- All console output goes to master.log with timestamps
- Git operations logged to master.log
- Maven output goes to both individual project logs AND master.log references
- Color codes preserved in foreground mode, stripped in background mode

## Build Sequence

1. **Clean M2 Repository** - Removes `~/.m2/repository`
2. **Update Git Repos** - Fetches and pulls latest changes for each project
3. **Build Projects 1-4** - Builds with `-DskipTests`, exits on failure
4. **Build Project 5** - Builds with tests, continues on test failures

## Exit Codes

- `0` - All builds successful
- `1` - Build failure in projects 1-4 (script exits)
- Project 5 (examples) failures don't cause script exit

## Examples

### Start Background Build and Monitor
```bash
cd ~/apache_src
./build-all-projects.sh --background
tail -f ~/apache_src/build-logs/master.log
```

### Check Build Status
```bash
# Check if still running
ps -p $(cat ~/apache_src/build-logs/build-all-projects.pid)

# View last 50 lines of master log
tail -n 50 ~/apache_src/build-logs/master.log

# Search for errors in master log
grep -i "error\|failed" ~/apache_src/build-logs/master.log
```

### Review Specific Project Build
```bash
# Find latest log directory
ls -lt ~/apache_src/build-logs/ | head -n 2

# View specific project log
cat ~/apache_src/build-logs/20260209_142700/runtimes_3.log
```

## Troubleshooting

### Script Won't Start in Background
- Check if another instance is running: `ps -p $(cat ~/apache_src/build-logs/build-all-projects.pid)`
- Remove stale PID file: `rm ~/apache_src/build-logs/build-all-projects.pid`

### Can't Find Master Log
- Ensure log directory exists: `mkdir -p ~/apache_src/build-logs`
- Check permissions: `ls -la ~/apache_src/build-logs/`

### Maven Process Stuck
- Find Maven PIDs from master.log: `grep "Maven PID" ~/apache_src/build-logs/master.log`
- Kill specific Maven process: `kill <PID>`

## Notes

- Master log appends across multiple runs (doesn't overwrite)
- Individual project logs are timestamped per run
- Background mode is ideal for long builds or remote sessions
- Foreground mode is better for interactive debugging

---
*Updated: 2026-02-09*