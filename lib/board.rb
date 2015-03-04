module TicTacToe
  class Board
    NEW_BOARD = [false, nil, nil, nil, nil, nil, nil, nil, nil, nil]
    WINNING_COMBOS = [
      [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]
    ]

    attr_reader :marks_array

    def initialize
      @marks_array = populate_new_board
    end

    # draws a 3x3 board on screen
    # @param board, Array. mapping of marks & boolean value of game status
    def print_board
      col_separator, row_separator = " | ", "--+---+--"

      label_for_position = lambda do |col|
        mark = @marks_array[col].mark
        mark.nil? ? col : mark
      end
 
      row_for_display = lambda do |row|
        row.map(&label_for_position).join(col_separator)
      end

      row_positions = [[7,8,9], [4,5,6], [1,2,3]]

      rows_for_display = row_positions.map(&row_for_display)

      puts rows_for_display.join("\n" + row_separator + "\n")
    end
    
    # receives a move, as a hash object with 2 properties
    #   move[:square_id] is the square's id you want to mark
    #   move[:player_mark] is the mark of the player who made the move
    # sends info to the square with a matching ID through Square#change_mark
    def receive_move(move)
      id = move[:square_id]
      mark = move[:player_mark]
      selected_square = @marks_array[id]
      selected_square.change_mark(mark)
      selected_square
    end

    def is_game_over?
      @marks_array[0]
    end

    def has_someone_won?(move)
      return false if move.nil?

      WINNING_COMBOS.any? do |combo|
        combo.all? do |square_id|
          @marks_array[square_id].mark == move[:player_mark]
        end
      end
    end

    private
    # clear out board and resets the board's marks_array
    # first element value is false, the rest of the values are nil
    def populate_new_board
      arr = []
      NEW_BOARD.to_enum.with_index.map do |val, ind|
        ind == 0 ? arr << val : arr << Square.new(ind, val)
      end
      arr
    end

  end
end
