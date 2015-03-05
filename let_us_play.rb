require_relative './lib/tic-tac-toe.rb'

puts "Enter the name of player 1"
p1 = gets.chomp
puts "Enter the name of player 2"
p2 = gets.chomp

game = TicTacToe::Game.new(p1, p2)
game.play
