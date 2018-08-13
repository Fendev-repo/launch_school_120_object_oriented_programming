# Provides game play functionality
module GamePlayMethods
  WIN_SCORE = 5

  def human_marker
    marker_selection[:human]
  end

  def computer_marker
    marker_selection[:computer]
  end

  private

  def first_move_marker
    @first_to_move
  end

  def update_markers(human_choice)
    return if human_choice == 'x'
    # Switch markers from default if selected by human
    @marker_selection[:human] = 'O'
    @marker_selection[:computer] = 'X'
  end

  def reset_first_player
    @current_marker = first_move_marker
  end

  def winning_score_reached?
    score.values.any? { |v| v >= WIN_SCORE }
  end

  def update_score
    case board.winning_marker
    when human_marker then @score[:human] += 1
    when computer_marker then @score[:computer] += 1
    end
  end

  def choose_who_moves_first
    if @current_marker == 'choose'
      first_plyr = human_to_choose_who_moves_first
      @current_marker = first_plyr
      @first_to_move = first_plyr
      clear
    else
      @current_marker = human_marker
    end
  end

  def human_turn?
    @current_marker == human_marker
  end

  def joiner(unmarked_keys, delimiter = ', ', last_num_seperator = ' or ')
    copy_of_keys = unmarked_keys.dup
    return unmarked_keys.first if unmarked_keys.length < 2
    last_num = copy_of_keys.pop
    "#{copy_of_keys.join(delimiter)} #{last_num_seperator} #{last_num}"
  end

  def try_for_win
    if board.opportunity_to_win
      board[board.opportunity_to_win] = computer_marker
      true
    else
      false
    end
  end

  def try_to_defend
    if board.square_under_threat
      board[board.square_under_threat] = computer_marker
      true
    else
      false
    end
  end

  def square_5_is_available
    if board.square_five_available?
      board[5] = computer_marker
      true
    else
      false
    end
  end

  def select_random_square
    board[board.unmarked_keys.sample] = computer_marker
  end

  def computer_moves
    return if try_for_win
    return if try_to_defend
    return if square_5_is_available
    select_random_square
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer_marker
    else
      computer_moves
      @current_marker = human_marker
    end
  end
end
