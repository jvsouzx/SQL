#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
RANDOM_NUMBER=$((1 + $RANDOM % 1000))

GUESS_NUMBER_GAME() {
  NUM_GUESSES=0
  echo -e "\nGuess the secret number between 1 and 1000:"
  while true; do
    read GUESS
    if [[ "$GUESS" =~ ^[0-9]+$ ]]; then
      ((NUM_GUESSES++))
      if [[ $GUESS -lt $RANDOM_NUMBER ]]; then
        echo "It's higher than that, guess again:"
      elif [[ $GUESS -gt $RANDOM_NUMBER ]]; then
        echo "It's lower than that, guess again:"
      else
        echo -e "\nYou guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        break
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
  export NUM_GUESSES
}

CHECK_USER () {
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  if [[ -z $USER_ID ]]; then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    GUESS_NUMBER_GAME
    $PSQL "INSERT INTO users(username, games_played, best_game) VALUES ('$USERNAME', 1, $NUM_GUESSES)" > /dev/null
  else
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_id=$USER_ID" | xargs)
    BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID" | xargs)
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    GUESS_NUMBER_GAME
    GAMES_PLAYED=$((GAMES_PLAYED + 1))

    if [[ $NUM_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]]; then
      BEST_GAME=$NUM_GUESSES
    fi

    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID" > /dev/null
  fi
}

echo "Enter your username:"
read USERNAME
CHECK_USER
