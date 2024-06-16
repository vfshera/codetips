#!/bin/sh

# Log file
LOG_FILE=deploy.log

# Function to handle errors
handle_error() {
  echo "Error: $1. Check the log file for details: $LOG_FILE"
  exit 1
}

# Check if PROJECT_PATH is set
if [ -z "$PROJECT_PATH" ]; then
  handle_error "PROJECT_PATH is not set. Please provide the project path."
fi

# Change to the project directory
cd $PROJECT_PATH 2>> $LOG_FILE || handle_error "Unable to change to the project directory at $PROJECT_PATH"

# Pull the latest changes from the git repository
echo "Pulling the latest changes from git"
git pull origin main 2>> $LOG_FILE || handle_error "Failed to pull latest changes from git."

# Install/update npm dependencies
echo "Installing dependencies"
npm install 2>> $LOG_FILE || handle_error "Failed to install dependencies."

# Build the project
echo "Building the project"
npm run build 2>> $LOG_FILE || handle_error "Failed to build the project."

echo "Deployment completed successfully."
