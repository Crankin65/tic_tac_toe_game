=begin Improvements to make:
- Each turn doesn't need to be a method.
- Add error message if you don't take your turn or if you put in a number for a square that's already been entered or more than 9

- Check on turn advancement, winner
- Use cases (outside of 1-9) in $board array
- Increase player count
- Change win conditions

=end
 
# Class to collect each player's name, symbol, and turn order
class Player 
  attr_accessor :name
  attr_accessor :symbol
  attr_accessor :took_first_turn
  
  def initialize(name,symbol) 
    @name = name
    @symbol = symbol
    $took_first_turn = took_first_turn
    #@player_id += 1
  end

  def set_name=(name)
    @name = name
  end

  def set_symbol=(symbol)
    @symbol = symbol
  end

  def first_turn=(took_first_turn)
    @took_first_turn = took_first_turn
  end

end

# Board display via array
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "--------------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "--------------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

$board = ["1","2","3","4","5","6","7","8","9"]

# Lists winning conditions possible
def game_condition()

  # condition (1= game over, 2 = tie)
  if [$board[0],$board[1],$board[2]].uniq.count == 1
    if $board[0] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[0] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if [$board[3],$board[4],$board[5]].uniq.count == 1 
    if $board[3] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[3] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if [$board[6],$board[7],$board[8]].uniq.count == 1
    if $board[6] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[6] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if [$board[0],$board[4],$board[8]].uniq.count == 1
    if $board[0] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[0] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end 

  if [$board[2],$board[4],$board[6]].uniq.count == 1
    if $board[2] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[2] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if [$board[0],$board[3],$board[6]].uniq.count == 1
    if $board[0] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[0] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if [$board[1],$board[4],$board[7]].uniq.count == 1
    if $board[1] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[1] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end
  
  if [$board[2],$board[5],$board[8]].uniq.count == 1 
    if $board[2] == $update_player_one_symbol
      puts "#{$update_player_one_name} won the game!"
      $condition = 1 
    elsif $board[2] == $update_player_two_symbol
      puts "#{$update_player_two_name} won the game!"
      $condition = 1 
    end
  end

  if $board[0] and $board[1] and $board[2] and $board[3] and $board[4] and 
    $board[5] and $board[6] and $board[7] and $board[8] and $board[9] == ($update_player_one_symbol or $update_player_two_symbol)
    $condition = 2
    puts "The game ended in a tie!"
  end
end

# Changes board array to symbols
def game_enter(symbol, square)
  case tac_toe
  when square = i, 
    board[i]= symbol
  end
  puts board
end

#Prompt for Player One to update player class
puts "Welcome to the game of tic-tac-toe! Player one, what is your name?"

player_one = Player.new(" "," ")
player_two = Player.new(" "," ")

player_one.set_name = gets.chomp
$update_player_one_name = player_one.name.delete("\"")

puts "What symbol will you use?"
player_one.set_symbol = gets.chomp
$update_player_one_symbol = player_one.symbol.delete("\"")

puts "You'll be playing as #{$update_player_one_name} and using the #{$update_player_one_symbol}!"

#Prompt for Player Two to update player class
puts "Player two, what is your name?"

player_two.set_name = gets.chomp
$update_player_two_name = player_two.name.delete("\"")

puts "What symbol will you use?"
player_two.set_symbol = gets.chomp
$update_player_two_symbol = player_two.symbol.delete("\"")

puts "You'll be playing as #{$update_player_two_name} and using the #{$update_player_two_symbol}!"

#Game Starts
puts "Now let the game begin!"

display_board($board)

#Randomly chooses turn order
def random_start()
  if rand(1..2) == 1
    puts "#{$update_player_one_name} starts! What square would you like?" 
    player_one_first = gets.chomp
    update_player_one_first = (player_one_first.to_i - 1)
    $board[update_player_one_first] = $update_player_one_symbol
  else rand(1..2) > 2
    puts "#{$update_player_two_name} starts! What square would you like?" 
    player_two_first = gets.chomp
    update_player_two_first = (player_two_first.to_i - 1)
    $board[update_player_two_first] = $update_player_two_symbol
  end
end

random_start()

display_board($board)

def check_on_first_turn()
  if $board.any? {|symbol| symbol == $update_player_one_symbol} 
    $player_one_took_first_turn = true
    #puts  "$player_one_took_first_turn" 
  elsif $board.any? {|symbol| symbol == $update_player_two_symbol} 
    $player_two_took_first_turn = true
    #puts "$player_two_took_first_turn"
  else puts  "WTF, check first turn didn't work" 
  end
end
   
check_on_first_turn()

# def next_turn()
#   if $player_one_took_first_turn == 1
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_second = gets.chomp
#     update_player_two_second = (player_two_second.to_i - 1)
#     $board[update_player_two_second] = $update_player_two_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1
#     puts "#{$update_player_one_name} what is your move?"
#     player_first_second = gets.chomp
#     update_player_first_second = (player_first_second.to_i - 1)
#     $board[update_player_first_second] = $update_player_one_symbol
#     display_board($board)
#   else puts "WTF? next turn didn't work"
#   end
# end

# next_turn()

# def third_turn()
#   if $player_one_took_first_turn == 1
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_third = gets.chomp
#     update_player_one_third = (player_one_third.to_i - 1)
#     $board[update_player_one_third] = $update_player_one_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_third = gets.chomp
#     update_player_two_third = (player_two_third.to_i - 1)
#     $board[update_player_two_third] = $update_player_two_symbol
#     display_board($board)
#   else puts "WTF? third turn didn't work"
#   end
# end

# third_turn()

# def fourth_turn()
#   if $player_one_took_first_turn == 1
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_fourth = gets.chomp
#     update_player_two_fourth = (player_two_fourth.to_i - 1)
#     $board[update_player_two_fourth] = $update_player_two_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_fourth = gets.chomp
#     update_player_one_fourth = (player_one_fourth.to_i - 1)
#     $board[update_player_one_fourth] = $update_player_one_symbol
#     display_board($board)
#   else puts "WTF? fourth turn didn't work"
#   end
# end

# fourth_turn()

# game_condition()

# def fifth_turn()
#   if ($player_one_took_first_turn == 1) and ($condition != (1 or 2))
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_fifth = gets.chomp
#     update_player_one_fifth = (player_one_fifth.to_i - 1)
#     $board[update_player_one_fifth] = $update_player_one_symbol
#     display_board($board)
#   elsif ($player_two_took_first_turn == 1) and ($condition != (1 or 2))
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_fifth = gets.chomp
#     update_player_two_fifth = (player_two_fifth.to_i - 1)
#     $board[update_player_two_fifth] = $update_player_two_symbol
#     display_board($board)
#   else
#   end
# end

# fifth_turn()

# game_condition()

# def sixth_turn()
#   if $player_one_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_sixth = gets.chomp
#     update_player_two_sixth = (player_two_sixth.to_i - 1)
#     $board[update_player_two_sixth] = $update_player_two_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_sixth = gets.chomp
#     update_player_one_sixth = (player_one_sixth.to_i - 1)
#     $board[update_player_one_sixth] = $update_player_one_symbol
#     display_board($board)
#   else
#   end
# end

# sixth_turn()

# game_condition()

# def seventh_turn()
#   if $player_one_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_seventh = gets.chomp
#     update_player_one_seventh = (player_one_seventh.to_i - 1)
#     $board[update_player_one_seventh] = $update_player_one_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_seventh = gets.chomp
#     update_player_two_seventh = (player_two_seventh.to_i - 1)
#     $board[update_player_two_seventh] = $update_player_two_symbol
#     display_board($board)
#   else 
#   end
# end

# seventh_turn()

# game_condition()

# def eigth_turn()
#   if $player_one_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_eigth = gets.chomp
#     update_player_two_eigth = (player_two_eigth.to_i - 1)
#     $board[update_player_two_eigth] = $update_player_two_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_eigth = gets.chomp
#     update_player_one_eigth = (player_one_eigth.to_i - 1)
#     $board[update_player_one_eigth] = $update_player_one_symbol
#     display_board($board)
#   else 
#   end
# end

# eigth_turn()

# game_condition()

# def ninth_turn()
#   if $player_one_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_one_name} what is your move?"
#     player_one_ninth = gets.chomp
#     update_player_one_ninth = (player_one_ninth.to_i - 1)
#     $board[update_player_one_ninth] = $update_player_one_symbol
#     display_board($board)
#   elsif $player_two_took_first_turn == 1 and ($condition != (1 or 2))
#     puts "#{$update_player_two_name} what is your move?"
#     player_two_ninth = gets.chomp
#     update_player_two_ninth = (player_two_ninth.to_i - 1)
#     $board[update_player_two_ninth] = $update_player_two_symbol
#     display_board($board)
#   else 
#   end
# end

# ninth_turn()

# game_condition()

def game_over?
  $condition == 1 || $condition == 2
end

def game_turn
  player_name = nil
  symbol = nil
  if $player_two_took_first_turn == 1 && !game_over?
    player_name = $update_player_one_name
    symbol = $update_player_one_symbol
  else
    player_name = $update_player_two_name
    symbol = $update_player_two_symbol
  end

  puts "#{player_name} what is your move?"
  response = gets.chomp.to_i - 1
  $board[response] = symbol
  $player_one_took_first_turn = !$player_one_took_first_turn
  $player_two_took_first_turn = !$player_two_took_first_turn
end


8.times do
  game_turn
  display_board($board)
  game_condition
end