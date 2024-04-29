#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME
USERNAME_EXIST=$($PSQL "SELECT username FROM users WHERE username='$USERNAME';")

if [[ -z $USERNAME_EXIST ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING (user_id) WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING (user_id) WHERE username='$USERNAME';")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# grab user id
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

# Generate a random number within 1-1000
SECRET_NUMBER=$((1 + RANDOM % 1000))
echo Guess the secret number between 1 and 1000:
read GUESSED_NUMBER
#INIT_GUESSES_TRIED=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, 1) RETURNING guesses;")
GUESSES_TRIED=0

while [[ $GUESSED_NUMBER -ne $SECRET_NUMBER ]]
do
  if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    read GUESSED_NUMBER
    ((GUESSES_TRIED++))
  else
    if [[ $GUESSED_NUMBER -gt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
      read GUESSED_NUMBER
      ((GUESSES_TRIED++))
    elif [[ $GUESSED_NUMBER -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
      read GUESSED_NUMBER
      ((GUESSES_TRIED++))
    fi
  fi
done

#loop ends when the answer is correct so, update guess.
((GUESSES_TRIED++))

INSERT_DATA=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES_TRIED)")

#CURRENT_GAME_ID=$($PSQL "SELECT MAX(game_id) FROM games WHERE user_id=$USER_ID;")

#TOTAL_GUESSES=$($PSQL "SELECT guesses FROM games WHERE game_id=$CURRENT_GAME_ID;")
echo "You guessed it in $GUESSES_TRIED tries. The secret number was $SECRET_NUMBER. Nice job!"

# Print the random number
#echo "The random number is $random_number"
