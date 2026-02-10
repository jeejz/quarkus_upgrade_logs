#!/bin/sh

# Chained build script for Apache KIE projects (POSIX sh compatible)
# Base directory
BASE_DIR="/home/jijo/apache_src"

# Create logs directory
LOG_DIR="$BASE_DIR/build-logs"
mkdir -p "$LOG_DIR"

# Timestamp for this build run
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Summary file
SUMMARY_FILE="$LOG_DIR/build-summary_${TIMESTAMP}.log"

# Function to run build in a directory
run_build() {
    dir=$1
    full_path="$BASE_DIR/$dir"
    log_file="$LOG_DIR/${dir}_${TIMESTAMP}.log"
    
    echo "========================================" | tee -a "$SUMMARY_FILE"
    echo "Building: $dir" | tee -a "$SUMMARY_FILE"
    echo "Started at: $(date)" | tee -a "$SUMMARY_FILE"
    echo "========================================" | tee -a "$SUMMARY_FILE"
    
    if [ ! -d "$full_path" ]; then
        echo "ERROR: Directory $full_path does not exist!" | tee -a "$SUMMARY_FILE" "$log_file"
        return 1
    fi
    
    cd "$full_path" || { echo "Failed to cd into $full_path" | tee -a "$SUMMARY_FILE" "$log_file"; return 1; }
    
    # Run Maven build and capture output
    mvn clean install -DskipTests 2>&1 | tee "$log_file"
    exit_code=$?
    
    cd "$BASE_DIR" > /dev/null 2>&1
    
    echo "========================================" | tee -a "$SUMMARY_FILE"
    echo "Finished: $dir" | tee -a "$SUMMARY_FILE"
    echo "Exit code: $exit_code" | tee -a "$SUMMARY_FILE"
    echo "Ended at: $(date)" | tee -a "$SUMMARY_FILE"
    echo "Log file: $log_file" | tee -a "$SUMMARY_FILE"
    echo "========================================" | tee -a "$SUMMARY_FILE"
    echo "" | tee -a "$SUMMARY_FILE"
    
    return $exit_code
}

# Main execution
echo "========================================" | tee "$SUMMARY_FILE"
echo "Apache KIE Chained Build" | tee -a "$SUMMARY_FILE"
echo "Started at: $(date)" | tee -a "$SUMMARY_FILE"
echo "Base directory: $BASE_DIR" | tee -a "$SUMMARY_FILE"
echo "Logs directory: $LOG_DIR" | tee -a "$SUMMARY_FILE"
echo "========================================" | tee -a "$SUMMARY_FILE"
echo "" | tee -a "$SUMMARY_FILE"

# Counters
total_builds=0
successful_builds=0
failed_builds=0
failed_list=""

# Build each project in order
for dir in incubator-kie-drools optaplanner kogito-runtimes incubator-kie-kogito-apps kogito-examples; do
    total_builds=$((total_builds + 1))
    
    if run_build "$dir"; then
        successful_builds=$((successful_builds + 1))
        echo "✅ SUCCESS: Build completed for $dir" | tee -a "$SUMMARY_FILE"
        echo "" | tee -a "$SUMMARY_FILE"
    else
        failed_builds=$((failed_builds + 1))
        failed_list="$failed_list  - $dir\n"
        echo "⚠️  WARNING: Build failed for $dir" | tee -a "$SUMMARY_FILE"
        echo "Continuing with next build..." | tee -a "$SUMMARY_FILE"
        echo "" | tee -a "$SUMMARY_FILE"
    fi
done

# Final Summary
echo "" | tee -a "$SUMMARY_FILE"
echo "========================================" | tee -a "$SUMMARY_FILE"
echo "BUILD SUMMARY" | tee -a "$SUMMARY_FILE"
echo "========================================" | tee -a "$SUMMARY_FILE"
echo "Completed at: $(date)" | tee -a "$SUMMARY_FILE"
echo "Total builds: $total_builds" | tee -a "$SUMMARY_FILE"
echo "Successful: $successful_builds" | tee -a "$SUMMARY_FILE"
echo "Failed: $failed_builds" | tee -a "$SUMMARY_FILE"
echo "" | tee -a "$SUMMARY_FILE"

if [ $failed_builds -gt 0 ]; then
    echo "❌ Failed builds:" | tee -a "$SUMMARY_FILE"
    printf "%b" "$failed_list" | tee -a "$SUMMARY_FILE"
    echo "" | tee -a "$SUMMARY_FILE"
    echo "Check individual log files in $LOG_DIR for details" | tee -a "$SUMMARY_FILE"
    exit 1
else
    echo "🎉 All builds completed successfully!" | tee -a "$SUMMARY_FILE"
    exit 0
fi

# Made with Bob
