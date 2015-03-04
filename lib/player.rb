module TicTacToe
  class Player
    attr_accessor :name, :mark

    def initialize(name, mark)
      @name = name
      @mark = mark
    end

    # send a message to board
    # @param square_id, the ID of the square you want to mark
    # returns an hash containing
    #   passed-in ID of square to mark
    #   the mark of the player making the move
    def make_move(square_id)
      { square_id: square_id, player_mark: @mark }
    end
  end
end
