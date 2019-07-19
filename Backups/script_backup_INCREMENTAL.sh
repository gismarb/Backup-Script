# !/usr/bin/env bash
# Title: script_backup_INCREMENTAL.sh - Backup Routine to Worskpace Folder
# Author: Gismar Barbosa
# Adapted: Jhoni Vieceli (https://www.vivaolinux.com.br/artigo/Script-de-backup-full-+-diferencial-+-compactador-+-restauracao?pagina=2)
# Backup Script to home folder (incremental copy)
# Create: 07/17/2019

# Clear the Screen
clear

Data(){
  # Folder to be copied
  SOURCE="/home/gismar/"
  # Destination folder
  TARGET="/media/gismar/Dados/Bakup_Linux/Incremental_Backup/Acer"
  # Get current date
  DATE=`date +%Y%m%d%k%M%S`
  # Backup start date
  DATESTART=`date +%c`
  # Log name output of transaction
  LOGNAME="log_incmremental_backup.log"
  # Log path
  LOGPATH="/media/gismar/Dados/Bakup_Linux/Logs/Acer" 
}

Backup(){
  echo "Incremental Backup Routine $SOURCE"
  echo " "
  echo "Starting in: $DATESTART"
  rsync -uahv --delete $SOURCE $TARGET
  if [ $? -eq 0 ] ; then
    echo "-------------------------------------------------------------------------------------------------"
    echo "Incremental Backup Completed Successfully"
    # Backup end date
    DATEEND=`date +%c`
    echo "End Date: $DATEEND"
    echo "Backup in $TARGET Performed Successfully" >> $LOGPATH/$LOGNAME
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
