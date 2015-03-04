module TicTacToe
  class Game; end
  class Board; end
  class Square; end
  class Player; end
end

TicTacToe.constants.each do |c|
  c_length = c.to_s.length
  class_file = TicTacToe.const_get(c).
    to_s.slice('TicTacToe::'.length, c_length).downcase
  require_relative class_file
end
