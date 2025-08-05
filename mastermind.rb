@board = [
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

@secret_code = [
  "empty", "empty", "empty", "empty"
]

@breaker_guess = [
  "empty", "empty", "empty", "empty"
]

@peg_colors = [
  "cyan", "green", "yellow", "blue", "red", "pink", "orange", "purple"
]

def init_secret_code
  random = Random.new
  4.times do |i|
    peg_choice = random.rand(@peg_colors.length)
    @secret_code[i] = @peg_colors[peg_choice]
  end
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
    announce_win()
    return true 
  else
    puts "Result: " + @result.join(",")
    return false
  end
end

def announce_win
  puts "Breaker Wins!"
end

# --- Main Game Loop ---
init_secret_code()
turns = 1
max_turns = 12
game_won = false

while turns <= max_turns && !game_won
  print "Turn #{turns}: Enter guess (color,color,color,color): "
  @breaker_guess = gets.chomp.split(",")

  if @breaker_guess.length != 4
    puts "Invalid guess. Please enter 4 colors separated by commas."
    next
  end
  
  game_won = check_guess()
  turns += 1
end

if !game_won
  puts "Game Over. You ran out of turns."
  puts "The secret code was: " + @secret_code.join(",")
end