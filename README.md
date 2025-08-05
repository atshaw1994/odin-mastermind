<h1>Mastermind Console Game</h1>
This is a console-based implementation of the classic logic game Mastermind, built entirely in Ruby. Challenge a friend to see who can be the best codebreaker!

<h3>🎮 Features</h3>
Random Secret Code Generation: A new, random 4-color secret code is generated for each round using a set of 8 possible colors.

Accurate Scoring Logic: Implements the correct Mastermind "black" and "white" peg feedback system to guide the codebreaker.

Black Peg: Correct color in the correct position.

White Peg: Correct color in the wrong position.

Multi-Round Gameplay: Players can specify how many rounds they want to play.

Player Switching: Roles (Codemaker/Codebreaker) automatically switch between Player 1 and Player 2 each round.

Score Tracking: Keeps a running score for each player across multiple rounds. The Codemaker earns points based on how many guesses it took the Codebreaker to solve the code.

Guess Limit: Each codebreaker has 10 guesses per round to crack the code.

User-Friendly Interface: Simple text-based input and output for an engaging console experience.

<h3>🚀 How to Play</h3>
Prerequisites

Make sure you have Ruby installed on your system. You can download it from ruby-lang.org.

Running the Game

Save the code: Save the provided Ruby code into a file named mastermind.rb (or any other .rb extension).

Open your terminal/command prompt: Navigate to the directory where you saved the file.

Run the script: Execute the game using the Ruby interpreter:

ruby mastermind.rb

Gameplay

The game will first ask you to enter the number of rounds you wish to play.

It will then announce which player (Player 1 or Player 2) starts as the Codebreaker. The other player is implicitly the Codemaker for that round.

For each guess, the Codebreaker will be prompted to enter their 4-color guess, separated by commas (e.g., red,blue,green,yellow).

After each guess, the game will provide feedback as "black" and "white" pegs:

black: A color is correct and in the right position.

white: A color is correct but in the wrong position.

The round continues for up to 10 guesses, or until the Codebreaker cracks the code.

At the end of each round, scores are updated (the Codemaker gets points equal to the number of guesses taken by the Codebreaker).

Players switch roles for the next round.

After all rounds are played, the final scores are displayed, and the winner is announced.

<h3>🎯 Mastermind Rules (Brief Overview)</h3>
The objective of Mastermind is for the Codebreaker to guess the Codemaker's secret 4-color code.

The Codemaker secretly sets a code using a combination of 4 colored pegs. Duplicate colors are allowed.

The Codebreaker makes a series of guesses.

After each guess, the Codemaker provides feedback using small key pegs:

A black peg means one of the guessed colors is correct and in the correct position.

A white peg means one of the guessed colors is correct but in the wrong position.

The order of the key pegs does not indicate which specific guessed peg they refer to.

The Codebreaker wins if they guess the exact code (4 black pegs).

If the Codebreaker runs out of guesses (typically 10), the Codemaker wins the round.

<h3>🛠️ Technologies Used</h3>
Ruby