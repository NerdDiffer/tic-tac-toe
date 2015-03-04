#require_relative './tic-tac-toe.rb'

#game = TicTacToe::Game.new("Abby", "Bob")
#move1 = game.player1.make_move(1)
#puts game.board.has_someone_won? move1
#move2 = game.player1.make_move(2)
#puts game.board.has_someone_won? move2
#move3 = game.player1.make_move(3)
#puts game.board.has_someone_won? move3

$winning_combos = [
  [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]
]

@marks_array = [
  false,
  {id: 1, mark: nil},
  {id: 2, mark: nil},
  {id: 3, mark: nil},
  {id: 4, mark: nil},
  {id: 5, mark: nil},
  {id: 6, mark: nil},
  {id: 7, mark: nil},
  {id: 8, mark: nil},
  {id: 9, mark: nil}
]

def mm move
  target_sq = move[:square_id]
  move_mark = move[:player_mark]

  @marks_array[target_sq][:mark] = move_mark

  $winning_combos.any? do |combo|
    #puts
    #puts "combo: #{combo}"
    combo.all? do |val|
      #puts
      square = @marks_array[val]
      #c1 = val == target_sq
      c2 = square[:mark] == move_mark
      #puts "position: #{val} target_sq: #{target_sq}"
      #puts "square_mark: #{square[:mark]} move_mark: #{move_mark}"
      c2
    end
  end
end

puts mm({square_id: 2, player_mark:'X'})
puts mm({square_id: 3, player_mark:'O'})
puts mm({square_id: 5, player_mark:'X'})
puts mm({square_id: 4, player_mark:'O'})
puts mm({square_id: 8, player_mark:'X'})
