#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"
MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "1) Cut\n2) Trim\n3) Color\n4) Exit"
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in 
    1) CUT ;;
    2) TRIM ;;
    3) COLOR ;;
    4) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}
CUT() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CHECK_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CHECK_PHONE ]]; then

    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_NAME_PH=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # insert all gather data into appointments table
    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}
TRIM() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CHECK_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CHECK_PHONE ]]; then

    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_NAME_PH=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # insert all gather data into appointments table
    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a trim at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
COLOR() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CHECK_PHONE=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  if [[ -z $CHECK_PHONE ]]; then

    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    INSERT_NAME_PH=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # insert all gather data into appointments table
    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
  else
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
    read SERVICE_TIME

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    INSERT_INTO_APP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    echo -e "\nI have put you down for a color at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}
EXIT() {
  echo -e "\nThank you for visiting My Salon\n"
}
MAIN_MENU
