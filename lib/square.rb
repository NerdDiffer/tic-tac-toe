module TicTacToe
  class Square
    attr_reader :id, :mark

    def initialize(id, mark = nil)
      @id = id
      @mark = mark
    end

    # lets you mark the square as long as its mark is nil
    # if you try to mark a square already marked, it raises an exception
    # @param mark, the ID of the square to mark
    def change_mark(mark)
      if !@mark.nil?
        message = "Square ##{@id} with mark #{@mark}, is already marked. Choose another."
        raise RuntimeError.new(message)
      else
        @mark = mark
      end
    end

  end

end
