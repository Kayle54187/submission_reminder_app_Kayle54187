# Submission Reminder Application

This is a simple shell script-based application designed to remind students of their pending submissions. The application checks a list of student submissions and notifies those who have not yet submitted their assignments.

## Prerequisites

- **Bash Shell**: Ensure you have a Bash shell environment available on your system.
- **Git**: Make sure Git is installed to clone the repository.

## Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/Kayle54187/submission_reminder_app_Kayle54187.git
   cd submission_reminder_app_Kayle54187
   ```

2. **Make the Script Executable**:
   Ensure the `create_environment.sh` script is executable:

   ```bash
   chmod +x create_environment.sh
   ```

3. **Run the Setup Script**:
   Execute the `create_environment.sh` script to set up the application environment.

   ```bash
   ./create_environment.sh
   ```

   The script will prompt you for your name and create the necessary directory structure and files.

4. **Navigate to the Created Directory**:
   After running the setup script, navigate to the created directory:

   ```bash
   cd submission_reminder_yourname
   ```

5. **Make the Startup Script Executable**:
   Ensure the `startup.sh` script is executable:

   ```bash
   chmod +x startup.sh
   ```

6. **Run the Application**:
   Start the application by executing the `startup.sh` script:
   ```bash
   ./startup.sh
   ```

## Directory Structure

The application directory structure is as follows:

```
submission_reminder_yourname/
├── app/
│   └── reminder.sh
├── modules/
│   └── functions.sh
├── assets/
│   └── submissions.txt
├── config/
│   └── config.env
└── startup.sh
```

## Files Description

- **`reminder.sh`**: The main script that checks and reminds students of pending submissions.
- **`functions.sh`**: Contains helper functions used by the reminder script.
- **`submissions.txt`**: A file containing student submission records.
- **`config.env`**: Configuration file with assignment details and remaining days.
- **`startup.sh`**: Script to start the reminder application.

## Adding More Student Records

To add more student records, edit the `assets/submissions.txt` file following the existing format:

```
student, assignment, submission status
```

## Testing the Application

After setting up, you can test the application by running the `startup.sh` script. It will display reminders for students who have not submitted their assignments.

## Contributing

Feel free to fork this repository, make changes, and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
