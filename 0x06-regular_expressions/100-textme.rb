#!/usr/bin/env ruby

# Function to extract sender, receiver, and flags from a log entry
def extract_info(log_entry)
  # Regular expression pattern to extract relevant information
  pattern = /\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/

  # Match the pattern in the log entry
  match_data = log_entry.match(pattern)

  # Return captured groups if there's a match, else return nil
  match_data ? match_data.captures : nil
end

# Read log entries from the command line arguments
log_entries = ARGV

# Process each log entry and output the required information
log_entries.each do |log_entry|
  info = extract_info(log_entry)
  puts info.join(',') if info
end

