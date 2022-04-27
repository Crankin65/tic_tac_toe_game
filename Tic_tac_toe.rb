# 3/3/22 Update columns/diagonals in board 
# 

=begin Improvements to make:
- Each turn doesn't need to be a method.
- Add error message if you don't take your turn or if you put in a number for a square that's already been entered or more than 9

- Check on turn advancement, winner
- Use cases (outside of 1-9) in $board array
- Increase player count
- Change win conditions

=end
 
# Class to collect each player's name, symbol, and turn order


# Board display via array
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "--------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "--------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

$board = ["1","2","3","4","5","6","7","8","9"]

$board2 = ["X","X","X","4","5","6","7","8","9"]
# 3 in a row, but only starting at 0,4,7

$board3 = ["X","2","3","X","5","6","X","8","9"]
# Any 3 , only start 0 (+3, +3), 1, 2

$board4 = ["X","2","3","4","X","6","7","8","X"]
# Any 3, only starting, 0 or 2, 4 has to (center), 6(2) or 8 (0)
# 0,4,8
# 2,4,6

def rows
  [
    [$board[0], $board[1], $board[2]],
    [$board[3], $board[4], $board[5]],
    [$board[6], $board[7], $board[8]]
  ]
end

def column
  [
  [$board[0], $board[3], $board[6]],
  [$board[1], $board[4], $board[7]],
  [$board[2], $board[5], $board[8]]
  ]
end

def diagonal
  [
    [$board[0], $board[4], $board[8]],
    [$board[2], $board[4], $board[6]],
  ]
end


# Lists winning conditions possible
def game_condition()

  triples = diagonal + column + rows
  triples.each do |current_diagonal|
    if current_diagonal.uniq.size == 1
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

  if $board[0] and $board[1] and $board[2] and $board[3] and $board[4] and 
    $board[5] and $board[6] and $board[7] and $board[8] and $board[9] == ($update_player_one_symbol or $update_player_two_symbol)
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

#Prompt for Player One to update player class
puts "Welcome to the game of tic-tac-toe! Player one, what is your name?"

$update_player_one_name = gets.chomp

puts "What symbol will you use?" 
$update_player_one_symbol = gets.chomp



puts "You'll be playing as #{$update_player_one_name} and using the #{$update_player_one_symbol}!"

#Prompt for Player Two to update player class
puts "Player two, what is your name?"
$update_player_two_name = gets.chomp

puts "What symbol will you use?"
$update_player_two_symbol = gets.chomp

puts "You'll be playing as #{$update_player_two_name} and using the #{$update_player_two_symbol}!"

#Game Starts
puts "Now let the game begin!"

$player1 = Player.new($update_player_one_name, $update_player_one_symbol)
$player2 = Player.new($update_player_two_name, $update_player_two_symbol)
$current_player = $player1

display_board($board)

def game_over?
  $condition == 1 || $condition == 2
end

def game_turn
  if !game_over? 
    puts "#{$current_player.name} what is your move?"
    response = gets.chomp.to_i - 1
    $board[response] = $current_player.symbol
    $current_player = $current_player == $player1 ? $player2 : $player1
  end
end


9.times do
  game_turn
  display_board($board)
  game_condition
end
