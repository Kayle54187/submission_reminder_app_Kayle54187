#!/bin/bash

# Prompt user for their name
read -p "Enter your name: " name
dir="submission_reminder_$name"

# Create main directory
mkdir -p "$dir"
cd "$dir" || exit

# Create subdirectories
mkdir -p app modules assets config

# Create app/reminder.sh
cat >app/reminder.sh <<'EOL'
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# Create modules/functions.sh
cat >modules/functions.sh <<'EOL'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL

# Create config/config.env
cat >config/config.env <<'EOL'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# Create assets/submissions.txt with original and additional entries
cat >assets/submissions.txt <<'EOL'
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Bob, Shell Navigation, not submitted
Alice, Git, submitted
Charlie, Shell Basics, not submitted
Dave, Shell Navigation, submitted
Eve, Git, not submitted
Frank, Shell Navigation, not submitted
Grace, Shell Basics, submitted
EOL

# Create startup.sh and make it executable
cat >startup.sh <<'EOL'
#!/bin/bash
./app/reminder.sh
EOL

chmod +x startup.sh

echo "Environment setup completed in directory: $dir"
