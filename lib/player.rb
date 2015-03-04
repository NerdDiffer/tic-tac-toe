module TicTacToe
  class Player
    attr_accessor :name, :mark

    def initialize(name, mark)
      @name = name
      @mark = mark
    end

    # sends a message to the game's board object
    # @param square_id, the ID of the square you want to mark
    # returns an hash containing
    #   the id of the square on which the player wants to make a move
    #   the mark of the player making the move
    def make_move(square_id)
      { square_id: square_id, player_mark: @mark }
    end
  end
end
