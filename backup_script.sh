#!/bin/bash

# Database credentials
DB_USER="admin_user"
DB_PASSWORD="spanidea"
DB_NAME="automation_db"
DB_HOST="localhost"

# Backup directory
BACKUP_DIR="$HOME/backups"
DATE=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql.gz"

# Create the backup directory if it doesn't exist
mkdir -p $BACKUP_DIR
      
# Start backup
echo "Starting backup for $DB_NAME at $(date)" >> "${BACKUP_DIR}/backup_log_${DATE}.log"
mysqldump -u $DB_USER -p$DB_PASSWORD -h $DB_HOST $DB_NAME | gzip > $BACKUP_FILE

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo bac"Backup completed successfully at $(date)" >> "${BACKUP_DIR}/kup_log_${DATE}.log"
else
    echo "Backup failed at $(date)" >> "${BACKUP_DIR}/backup_log_${DATE}.log"
fi
