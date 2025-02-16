#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# if argument is not found
if [[ -z $1 ]]
then 
  echo Please provide an element as an argument.
else
  # if argument is found
  if [[ $1 ]]
  then
    DATA_QUERY=$($PSQL "SELECT * FROM types FULL JOIN properties USING(type_id) FULL JOIN elements USING(atomic_number) WHERE atomic_number::TEXT = '$1' OR symbol = '$1' OR name = '$1'")
    echo "$DATA_QUERY" | while IFS="|" read ATOMIC_NUMBER TYPE_ID TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT SYMBOL NAME
    do
      # if the query data is not found
      if [[ -z $DATA_QUERY ]]
      then
        echo I could not find that element in the database.
      else
      # print the requested data
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      fi
    done
  fi
fi