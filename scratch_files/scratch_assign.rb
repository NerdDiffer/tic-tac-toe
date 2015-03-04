require_relative '../lib/tic-tac-toe.rb'

game = TicTacToe::Game.new("Abby", "Bob")
arr = []
1000.times do
  #game.players.each {|p| print p.name}
  game.randomly_assign_turns
  curr = game.current_player
  other = game.other_player
  #puts "does #{curr.name} == #{other.name}? #{curr == other}"
  arr << (curr == other)
end

#arr.each_with_index {|v, i| puts "#{i}. #{v}"}
puts arr.any? { |b| b }
