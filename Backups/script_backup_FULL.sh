# !/usr/bin/env bash
# Title: script_backup_FULL.sh - Backup Routine to Worskpace Folder
# Author: Gismar Barbosa
# Adapted: Jhoni Vieceli (https://www.vivaolinux.com.br/artigo/Script-de-backup-full-+-diferencial-+-compactador-+-restauracao?pagina=2)
# Backup Script to home folder (full copy)
# Create: 07/12/2019

# Clear the Screen
clear

Data(){
  # Folder to be copied
  SOURCE="/home/gismar/"
  # Destination folder
  TARGET="/media/gismar/Dados/Bakup_Linux/Full_Backup/Acer"
  # Computer name
  HOSTNAME=`hostname`
  # Backup file name (vendor name)
  FILENAME="acer"
  # Get current date
  DATE=`date +%Y%m%d%k%M%S`
  # number of day to detele backup file (a new feature to be implemented)
  LIFETIME=+15
  # Creating Workspace-date.tar file in target directory
  FILE=$TARGET/$FILENAME-$HOSTNAME-$DATE.tar.gz
  #Header Message
  echo "Backup Full Routine $SOURCE "
  echo " "
  # Backup start date
  DATESTART=`date +%c`
  echo "Starting in: $DATESTART"
  LOGNAME="log_full_backup.log"
  LOGPATH="/media/gismar/Dados/Bakup_Linux/Logs/Acer" 
}

Backup(){
  sync
  tar -czvf $FILE $SOURCE
  if [ $? -eq 0 ] ; then
    echo "-------------------------------------------------------------------------------------------------"
    echo "Full Backup Completed Successfully"
    # Backup end date
    DATEEND=`date +%c`
    echo "End Date: $DATEEND"
    echo "Backup $FILENAME-$HOSTNAME-$DATE.tar.gz Performed Successfully" >> $LOGPATH/$LOGNAME
    echo "Created by User: $USER" >> $LOGPATH/$LOGNAME
    echo "START: $DATESTART" >> $LOGPATH/$LOGNAME
    echo "END: $DATEEND" >> $LOGPATH/$LOGNAME
    echo "-------------------------------------------------------------------------------------------------" >> $LOGPATH/$LOGNAME
    echo " "
    echo "Logs Creted in: $LOGPATH/$LOGNAME"
  else
    echo "ERROR! Backup Day $DATESTART" >> $LOGPATH/$LOGNAME
  fi
}

Data
Backup

exit 0
