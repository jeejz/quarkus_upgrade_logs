#!/bin/bash

# Build script for all Kogito projects
# This script cleans m2 folder and builds projects in sequence with logging
# Modified to run in background with master.log

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Get current date for log naming (includes time for multiple runs per day)
DATE=$(date +%Y%m%d_%H%M%S)

# M2 repository path
M2_REPO="$HOME/.m2/repository"

# Log directory - all logs will be saved here in a timestamped folder
LOG_BASE_DIR="/home/jijo/apache_src/build-logs"
LOG_DIR="${LOG_BASE_DIR}/${DATE}"

# Master log file for all output
MASTER_LOG="${LOG_BASE_DIR}/master.log"

# PID file to track background process
PID_FILE="${LOG_BASE_DIR}/build-all-projects.pid"

# Project definitions
declare -A PROJECTS=(
    [1]="drools:/home/jijo/apache_src/incubator-kie-drools"
    [2]="optaplanner:/home/jijo/apache_src/ioptaplanner"
    [3]="runtimes:/home/jijo/apache_src/kogito-runtimes"
    [4]="apps:/home/jijo/apache_src/kogito-apps"
    [5]="examples:/home/jijo/apache_src/kogito-examples"
)

# Function to print colored messages (to both console and master log)
print_message() {
    local color=$1
    local message=$2
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "${color}${message}${NC}"
    echo "[$timestamp] ${message}" >> "$MASTER_LOG"
}

# Function to log to master log only
log_to_master() {
    local message=$1
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] ${message}" >> "$MASTER_LOG"
}

# Function to clean m2 repository
clean_m2() {
    print_message "$YELLOW" "=========================================="
    print_message "$YELLOW" "Cleaning M2 repository: $M2_REPO"
    print_message "$YELLOW" "=========================================="
    
    if [ -d "$M2_REPO" ]; then
        rm -rf "$M2_REPO"
        print_message "$GREEN" "✓ M2 repository cleaned successfully"
    else
        print_message "$YELLOW" "⚠ M2 repository not found, skipping cleanup"
    fi
    echo ""
}

# Function to update git repository
update_git_repo() {
    local project_path=$1
    local project_name=$2
    
    print_message "$YELLOW" "Updating Git repository for $project_name..."
    
    cd "$project_path"
    
    # Fetch latest from origin
    print_message "$GREEN" "  Fetching from origin..."
    if git fetch origin >> "$MASTER_LOG" 2>&1; then
        print_message "$GREEN" "  ✓ Fetch successful"
    else
        print_message "$RED" "  ✗ Fetch failed"
        return 1
    fi
    
    # Get current branch
    local current_branch=$(git rev-parse --abbrev-ref HEAD)
    print_message "$GREEN" "  Current branch: $current_branch"
    
    # Pull latest changes
    print_message "$GREEN" "  Pulling latest changes..."
    if git pull origin "$current_branch" >> "$MASTER_LOG" 2>&1; then
        print_message "$GREEN" "  ✓ Pull successful"
    else
        print_message "$RED" "  ✗ Pull failed"
        return 1
    fi
    
    echo ""
    return 0
}

# Function to build a project
build_project() {
    local project_num=$1
    local project_info=${PROJECTS[$project_num]}
    local project_name=$(echo $project_info | cut -d: -f1)
    local project_path=$(echo $project_info | cut -d: -f2)
    local log_file="${LOG_DIR}/${project_name}_${project_num}.log"
    
    print_message "$YELLOW" "=========================================="
    print_message "$YELLOW" "Building project $project_num/5: $project_name"
    print_message "$YELLOW" "Path: $project_path"
    print_message "$YELLOW" "Log: $log_file"
    print_message "$YELLOW" "=========================================="
    
    # Check if project directory exists
    if [ ! -d "$project_path" ]; then
        print_message "$RED" "✗ Error: Project directory not found: $project_path"
        return 1
    fi
    
    # Update git repository before building
    update_git_repo "$project_path" "$project_name"
    if [ $? -ne 0 ]; then
        print_message "$RED" "✗ Git update failed, aborting build"
        return 1
    fi
    
    # Change to project directory and build
    cd "$project_path"
    
    local start_time=$(date +%s)
    
    # Build based on project number
    if [ "$project_num" -eq 5 ]; then
        # For examples project: don't skip tests, don't fail on test failures
        print_message "$GREEN" "Running: mvn clean install (with tests, continue on failure)"
        log_to_master "Starting Maven build for $project_name (background process)"
        
        # Run mvn in background and capture its PID
        mvn clean install -fn > "$log_file" 2>&1 &
        local mvn_pid=$!
        log_to_master "Maven PID for $project_name: $mvn_pid"
        
        # Wait for the background process to complete
        wait $mvn_pid
        local exit_code=$?
    else
        # For other projects: skip tests
        print_message "$GREEN" "Running: mvn clean install -DskipTests"
        log_to_master "Starting Maven build for $project_name (background process)"
        
        # Run mvn in background and capture its PID
        mvn clean install -DskipTests > "$log_file" 2>&1 &
        local mvn_pid=$!
        log_to_master "Maven PID for $project_name: $mvn_pid"
        
        # Wait for the background process to complete
        wait $mvn_pid
        local exit_code=$?
    fi
    
    local end_time=$(date +%s)
    local duration=$((end_time - start_time))
    local duration_min=$((duration / 60))
    local duration_sec=$((duration % 60))
    
    if [ $exit_code -eq 0 ]; then
        print_message "$GREEN" "✓ Build completed successfully in ${duration_min}m ${duration_sec}s"
        print_message "$GREEN" "  Log saved to: $log_file"
    else
        if [ "$project_num" -eq 5 ]; then
            print_message "$YELLOW" "⚠ Build completed with test failures in ${duration_min}m ${duration_sec}s"
            print_message "$YELLOW" "  Log saved to: $log_file"
            print_message "$YELLOW" "  (Continuing as expected for examples project)"
        else
            print_message "$RED" "✗ Build failed in ${duration_min}m ${duration_sec}s"
            print_message "$RED" "  Log saved to: $log_file"
            return 1
        fi
    fi
    
    echo ""
    return 0
}

# Main execution
main() {
    local overall_start=$(date +%s)
    
    # Create log directory with timestamp
    mkdir -p "$LOG_DIR"
    mkdir -p "$LOG_BASE_DIR"
    
    # Initialize master log
    echo "=========================================" >> "$MASTER_LOG"
    echo "Build started at: $(date)" >> "$MASTER_LOG"
    echo "=========================================" >> "$MASTER_LOG"
    
    print_message "$GREEN" "=========================================="
    print_message "$GREEN" "Kogito Projects Build Script"
    print_message "$GREEN" "Started at: $(date)"
    print_message "$GREEN" "Log directory: $LOG_DIR"
    print_message "$GREEN" "Master log: $MASTER_LOG"
    print_message "$GREEN" "=========================================="
    echo ""
    
    # Clean m2 repository
    clean_m2
    
    # Build projects 1-4 (will exit on error)
    for i in {1..4}; do
        build_project $i
        if [ $? -ne 0 ]; then
            print_message "$RED" "Build failed for project $i, exiting..."
            log_to_master "Build process terminated due to failure in project $i"
            exit 1
        fi
    done
    
    # Build project 5 (examples) - won't exit on error
    print_message "$YELLOW" "Building final project (examples) with tests enabled..."
    echo ""
    build_project 5
    
    local overall_end=$(date +%s)
    local total_duration=$((overall_end - overall_start))
    local total_min=$((total_duration / 60))
    local total_sec=$((total_duration % 60))
    
    print_message "$GREEN" "=========================================="
    print_message "$GREEN" "All builds completed!"
    print_message "$GREEN" "Total time: ${total_min}m ${total_sec}s"
    print_message "$GREEN" "Finished at: $(date)"
    print_message "$GREEN" "=========================================="
    echo ""
    print_message "$YELLOW" "Log files created in: $LOG_DIR"
    for i in {1..5}; do
        local project_info=${PROJECTS[$i]}
        local project_name=$(echo $project_info | cut -d: -f1)
        local log_file="${LOG_DIR}/${project_name}_${i}.log"
        if [ -f "$log_file" ]; then
            print_message "$GREEN" "  ✓ ${project_name}_${i}.log"
        fi
    done
    
    log_to_master "========================================="
    log_to_master "Build completed at: $(date)"
    log_to_master "========================================="
}

# Check if script should run in background
if [[ "$1" == "--background" || "$1" == "-bg" ]]; then
    # Run in background
    echo "Starting build process in background..."
    echo "Master log: $MASTER_LOG"
    echo "PID file: $PID_FILE"
    
    # Run main function in background and redirect all output to master log
    (
        main
        rm -f "$PID_FILE"
    ) >> "$MASTER_LOG" 2>&1 &
    
    # Save PID
    echo $! > "$PID_FILE"
    echo "Background process started with PID: $(cat $PID_FILE)"
    echo "Monitor progress with: tail -f $MASTER_LOG"
    echo "Check if running: ps -p \$(cat $PID_FILE)"
    exit 0
else
    # Run in foreground (original behavior)
    main
    exit 0
fi

# Made with Bob
