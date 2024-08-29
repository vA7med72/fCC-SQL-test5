#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
SEC_NUM=$((1 + RANDOM % 1000))

echo -e "\nEnter your username:"
read USER_INP
USERNAME=$($PSQL "select name from users where name='$USER_INP'")
if [[ -z $USERNAME ]]
then 
INSERT_USERNAME=$($PSQL "insert into users(name) values('$USER_INP')")
USERNAME=$($PSQL "select name from users where name='$USER_INP'")
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
echo "Welcome, $USERNAME! It looks like this is your first time here."
else
USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
GAMES_PLAYED=$($PSQL "select max(user_game) from games where user_id=$USER_ID")
LEAST=$($PSQL "select guesses from users where user_id=$USER_ID")
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $LEAST guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS
GUESS_NUM=1
while [[ $GUESS -ne $SEC_NUM ]]
do
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then 
echo "That is not an integer, guess again:"
read GUESS
else 
if [[ $GUESS -lt $SEC_NUM ]]
then
echo "It's higher than that, guess again:"
((GUESS_NUM++))
read GUESS
elif [[ $GUESS -gt $SEC_NUM ]]
then 
echo "It's lower than that, guess again:"
((GUESS_NUM++))
read GUESS
fi
fi
done
GAME_COUNT=$(($GAMES_PLAYED + 1))
if [[ -z $GAME_COUNT ]]
then 
GAME_COUNT=1
fi
INSERT_GAME=$($PSQL "insert into games(user_id, user_game, guesses) values($USER_ID, $GAME_COUNT, $GUESS_NUM)")
echo "You guessed it in $GUESS_NUM tries. The secret number was $SEC_NUM. Nice job!"
if [[ $LEAST ]]
then
if [[ $LEAST -gt $GUESS_NUM ]]
then
UPDATE_LEAST=$($PSQL "update users set guesses=$GUESS_NUM where user_id=$USER_ID")
fi
else
UPDATE_LEAST=$($PSQL "update users set guesses=$GUESS_NUM where user_id=$USER_ID")
fi
