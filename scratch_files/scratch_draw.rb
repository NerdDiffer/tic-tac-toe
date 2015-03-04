require_relative './tic-tac-toe.rb'

board = TicTacToe::Board.new
p1 = TicTacToe::Player.new("Ralph", "X")
p2 = TicTacToe::Player.new("Esposito", "O")
board.draw

board.marks_array[1..9].each do |n|
  n = n.id

  sq = board.marks_array[n]
  puts "#{sq.id} #{sq.mark}"

  board.receive_move(p1.make_move(n)) if n % 2 == 0
  board.receive_move(p2.make_move(n)) if n % 2 > 0

  sq = board.marks_array[n]
  puts "#{sq.id} #{sq.mark}"

  puts
end

puts
board.draw
