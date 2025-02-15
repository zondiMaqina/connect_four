# frozen_string_literal: true

# class for searching 4 connected moves for win
class GameWinner
  def initialize
    @player_attempts = []
  end

  def search_win(board, player_moves, move_icon)
    @chosen_move = move_icon
    player_moves.reverse.each do |move|
      search_down(board, move)
    end

    game_over if board_full?(board)
  end

  def search_down(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x += 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_up(board, player_move)
  end

  def search_up(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x -= 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_left(board, player_move)
  end

  def search_left(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      y -= 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_right(board, player_move)
  end

  def search_right(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      y += 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_diagonally_right_up(board, player_move)
  end

  def search_diagonally_right_up(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x -= 1
      y += 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_diagonally_right_down(board, player_move)
  end

  def search_diagonally_right_down(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x += 1
      y += 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_diagonally_left_up(board, player_move)
  end

  def search_diagonally_left_up(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x -= 1
      y -= 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
    search_diagonally_left_down(board, player_move)
  end

  def search_diagonally_left_down(board, player_move)
    x = player_move[0].to_i
    y = player_move[1].to_i
    until index_valid?(x, y)
      @player_attempts << @chosen_move if matches?(board[x][y], @chosen_move)
      x += 1
      y -= 1
    end
    return player_wins(@chosen_move) if @player_attempts.size >= 4

    clear_attempts
  end

  def index_valid?(x, y)
    x.negative? || y.negative? || x > 5 || y > 6
  end

  def matches?(current_position, player_move)
    current_position == player_move
  end

  def clear_attempts
    @player_attempts = []
  end

  def player_wins(move)
    puts "#{move} wins"
    exit
  end

  def board_full?(board)
    board.all? do |row|
      row.include?(' ') == false
    end
  end

  def game_over
    puts 'Board is full.... game over Yall both lost :)'.colorize(:red).bold
    exit
  end
end
