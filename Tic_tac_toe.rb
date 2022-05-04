# 3/3/22 Update columns/diagonals in board 
# 

=begin Improvements to make:
- Update Tie
- Update initial game prompts 
- Board algorithm 
=end
 
# Class to collect each player's name, symbol, and turn order


# Board display via array
class Board

  def initialize(board)
    @board = board
  end

  def get
  end

  def set(spot, symbol)
    @board[spot] = symbol
  end

  def []=(spot, symbol)
    @board[spot] = symbol
  end  

  def display
    puts " #{@board[0] || "1"} | #{@board[1] || "2"} | #{@board[2] || "3"} "
    puts "--------------"
    puts " #{@board[3] || "4"} | #{@board[4] || "5"} | #{@board[5] || "6"} "
    puts "--------------"
    puts " #{@board[6] || "7"} | #{@board[7] || "8"} | #{@board[8] || "9"} "
  end
  
  def rows
    [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]]
    ]
  end
  
  def columns
    [
      [@board[0], @board[3], @board[6]],
      [@board[1], @board[4], @board[7]],
      [@board[2], @board[5], @board[8]]
    ]
  end
  
  def diagonals
    [
      [@board[0], @board[4], @board[8]],
      [@board[2], @board[4], @board[6]],
    ]
  end

  def tie?
    @board.all? { |spot| spot != nil }
  end
end



def game_condition()

  triples = $current_board.diagonals + $current_board.columns + $current_board.rows
  triples.each do |current_diagonal|
    if current_diagonal.compact.uniq.size == 1  # Update this line
      $condition = 1 
      player_name = nil
      if current_diagonal[0] == $update_player_one_symbol
        player_name = $update_player_one_name
      elsif current_diagonal[0] == $update_player_two_symbol
        player_name = $update_player_two_name
      end
      puts "#{player_name} won the game!"
    end
  end

  if $current_board.tie?
    $condition = 2
    puts "The game ended in a tie!"
  end
end


class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

def game_setup
  puts "Welcome to the game of tic-tac-toe! Player one, what is your name?"
  $update_player_one_name = gets.chomp

  puts "What symbol will you use?" 
  $update_player_one_symbol = gets.chomp

  puts "You'll be playing as #{$update_player_one_name} and using the #{$update_player_one_symbol}!"

  puts "Player two, what is your name?"
  $update_player_two_name = gets.chomp

  puts "What symbol will you use?"
  $update_player_two_symbol = gets.chomp

  puts "You'll be playing as #{$update_player_two_name} and using the #{$update_player_two_symbol}!"

  puts "Now let the game begin!"

  $player1 = Player.new($update_player_one_name, $update_player_one_symbol)
  $player2 = Player.new($update_player_two_name, $update_player_two_symbol)
  $current_player = $player1

  $current_board = Board.new([nil,nil,nil,nil,nil,nil,nil,nil,nil])

  $current_board.display
end

def game_over?
  $condition == 1 || $condition == 2
end

def game_turn
  if !game_over? 
    puts "#{$current_player.name} what is your move?"
    response = gets.chomp.to_i - 1
    $current_board[response] = $current_player.symbol
    $current_player = $current_player == $player1 ? $player2 : $player1
  end

  $current_board.display
  game_condition
end

def game_run
  9.times do
    game_turn
  end
end

game_setup
game_run