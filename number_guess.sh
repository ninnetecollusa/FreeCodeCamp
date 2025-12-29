#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=username -t --no-align -c"

NUMBER=$((RANDOM % 1000+1))
echo $NUMBER

echo "Enter your username:"
read NAME

DB_NAME=$($PSQL"SELECT name FROM user_table WHERE name ='$NAME'")
# check availability
if [[ -z $DB_NAME ]]
then
  # if not found
  echo Welcome, $NAME! It looks like this is your first time here.
  INSERT_NEW_NAME=$($PSQL "INSERT INTO user_table(name, games_played) VALUES('$NAME',0)")
else
  # if found
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_table WHERE name = '$NAME'")
  BEST_GUESS=$($PSQL "SELECT best_guess FROM user_table WHERE name = '$NAME'")
  echo Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses.
fi

NUMBER_OF_GUESSES=0
echo Guess the secret number between 1 and 1000:

while true
do
  read GUESS

 if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if [[ $GUESS -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER. Nice job!"
    if [[ -z $BEST_GUESS || $NUMBER_OF_GUESSES -lt $BEST_GUESS ]]
    then
      $PSQL "UPDATE user_table SET best_guess=$NUMBER_OF_GUESSES WHERE name='$NAME'" > output.txt
    fi

    $PSQL "UPDATE user_table SET games_played=games_played+1 WHERE name='$NAME'" > output.txt
    break
  fi
done

