# Provides CLI interactive functionality
module DisplayMessagesCli
  def ask_human_for_name
    puts 'What is your name?'
    name = nil
    loop do
      name = gets.chomp.capitalize
      break if name.match?(/[a-z]+/)
      puts "You didn't enter a name: Please enter a name"
    end
    @human_name = name
  end

  def ask_human_for_marker_choice
    puts "What would you prefer to use as a marker? 'X' or 'O'?"
    reply = nil
    loop do
      reply = gets.chomp.downcase
      break if reply.match?(/[xo]/)
      puts "Incorrect input: I need a 'X' or 'O'"
    end
    update_markers(reply)
  end

  def present_score_board
    puts 'Current score:'
    puts "#{human_name}: #{score[:human]} wins"
    puts "#{computer_name}: #{score[:computer]} wins"
  end

  def display_welcome_message
    puts 'Welcome to Tic Tac Toe!'
    puts ''
  end

  def human_to_choose_who_moves_first
    reply = nil
    puts "Would you like to go first? 'y' or 'n'"
    loop do
      reply = gets.chomp
      break if reply.match?(/[yn]/)
      puts "Incorrect input: I need a 'y' or 'n'"
    end
    reply == 'n' ? computer_marker : human_marker
  end

  def display_goodbye_message
    puts 'Thanks for playing Tic Tac Toe! Goodbye!'
  end

  def display_board
    puts "You're a #{@marker_selection[:human]}"
    puts "Computer is a #{@marker_selection[:computer]}"
    puts ''
    present_score_board
    puts ''
    board.draw
    puts ''
  end

  def human_moves
    puts "Choose a square #{joiner(board.unmarked_keys)}:"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human_marker
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human_marker
      puts 'You won!'
    when computer_marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts 'Would you like to play again? (y/n)'
      answer = gets.chomp.downcase
      break if answer.match?(/[yn]/)
      puts "Incorrect input: I need a 'y' or 'n'"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end
end
