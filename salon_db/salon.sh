#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~ Salon ~~~~\n"
echo -e "Welcome to My Salon, how can I help you?"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "What service do you want to schedule?"
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SCHEDULE_SERVICE $SERVICE_ID_SELECTED;;
    2) SCHEDULE_SERVICE $SERVICE_ID_SELECTED;;
    3) SCHEDULE_SERVICE $SERVICE_ID_SELECTED;;
    4) SCHEDULE_SERVICE $SERVICE_ID_SELECTED;;
    5) SCHEDULE_SERVICE $SERVICE_ID_SELECTED;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac
}

SCHEDULE_SERVICE () {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]] 
  then
    echo -e "\nI don't find a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi
  echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME ?"
  read SERVICE_TIME

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $1)")
  
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$1")

  EXIT "I have put you down for a $SERVICE at $SERVICE_TIME,$CUSTOMER_NAME."
 }


EXIT() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "\nThank you for the visit!\n"
}

MAIN_MENU
