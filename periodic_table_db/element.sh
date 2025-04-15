#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_ELEMENT_DATA() {
  ELEMENT_DATA=$($PSQL "
    SELECT 
      el.atomic_number,
      el.symbol,
      el.name,
      p.atomic_mass,
      p.melting_point_celsius,
      p.boiling_point_celsius,
      t.type
    FROM 
      elements AS el
    INNER JOIN 
      properties AS p ON el.atomic_number = p.atomic_number 
    LEFT JOIN 
      types as t ON p.type_id = t.type_id 
    WHERE el.atomic_number=$1;
  ")
  IFS="|" read -r -r ATOMIC_NUMBER SYMBOL NAME MASS MELT BOIL TYPE <<< "$ELEMENT_DATA"
  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
} 

if [[ -z $1 ]] 
then
  echo "Please provide an element as an argument."
  exit 0
fi

if [[ $1 =~ ^[0-9]+$ ]] 
then
  ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
else
  ELEMENT_ID=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1' OR symbol='$1'")
fi

if [[ -z $ELEMENT_ID ]] 
  then
    echo -e "I could not find that element in the database."
  else 
    GET_ELEMENT_DATA $ELEMENT_ID
fi