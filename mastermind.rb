@peg_colors = ["cyan", "green", "yellow", "blue", "red", "pink", "orange", "purple"]
@player1_score = 0
@player2_score = 0
@random = Random.new

def init_board
  return [
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"],
    ["empty", "empty", "empty", "empty"]
  ]
end

def check_guess
  @result = []

  temp_secret_code = @secret_code.dup
  temp_breaker_guess = @breaker_guess.dup

  # --- Check for "black" pegs (correct color and position) ---
  4.times do |i|
    if temp_secret_code[i] == temp_breaker_guess[i]
      @result << "black"
      temp_secret_code[i] = nil
      temp_breaker_guess[i] = nil
    end
  end
  
  # --- Check for "white" pegs (correct color, wrong position) ---
  temp_breaker_guess.compact.each do |guess_peg|
    if temp_secret_code.include?(guess_peg)
      @result << "white"
      temp_secret_code.delete_at(temp_secret_code.index(guess_peg))
    end
  end

  # Check for win condition and announce result
  if @result.length == 4 && !@result.include?("white")
    return true 
  else
    puts "Result: " + @result.join(",")
    return false
  end
end

def announce_win(player_number, number_of_guesses)
  if player_number == 1
    @player1_score += (number_of_guesses-1)
  else
    @player2_score += (number_of_guesses-1)
  end
end

def play_round(player_number)
  puts "Player #{player_number}'s turn!"

  @board = init_board()
  @secret_code = ["empty", "empty", "empty", "empty"]
  4.times do |i|
    peg_choice = @random.rand(@peg_colors.length)
    @secret_code[i] = @peg_colors[peg_choice]
  end
  @breaker_guess = ["empty", "empty", "empty", "empty"]

  guess_number = 1
  game_won = false

  while guess_number <= 10 && !game_won
    print "Guess #{guess_number}: Enter guess (color,color,color,color): "
    @breaker_guess = gets.chomp.split(",")

    if @breaker_guess.length != 4
      puts "Invalid guess. Please enter 4 colors separated by commas."
      next
    end
    
    game_won = check_guess()
    guess_number += 1
  end

  if game_won
    announce_win(player_number, guess_number)
  else
    puts "Round Over. You ran out of guesses."
    puts "The secret code was: " + @secret_code.join(",")
    puts "Switching players..."
  end
end

def get_random_player
  if @random.rand(1..2) == 1
    return 1
  else
    return 2
  end
end

def play_game
  print "Enter number of rounds: "
  number_of_rounds = gets.chomp.to_i

  current_round = 1
  current_player = get_random_player()
  puts "Player #{current_player} starts!"

  while current_round <= number_of_rounds
    play_round(current_player)
    if current_player == 1
      current_player = 2
    else
      current_player = 1
    end
  end
end

# --- Main Game Loop ---
puts "| -- MasterMind --- |"
puts "|-------------------|\n"

play_game()

if @player1_score > @player2_score
  puts "Player 1 Wins!"
elsif @player2_score > @player1_score
  puts "Player 2 Wins!"
else
  puts "It's a tie! Most players use an even number of rounds to avoid this."
end