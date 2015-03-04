module TicTacToe
  class Game
    attr_accessor :player1, :player2, :board,
      :player, :current_player, :other_player

    def initialize player1_name, player2_name
      @player1 = Player.new(player1_name, 'X')
      @player2 = Player.new(player2_name, 'O')
      @board = Board.new
      @current_player = @player1
      @other_player = @player2
      @players = [@player1, @player2]
    end

    def play
      puts "**** TIC-TAC-TOE TO-THE-DEATH ****"
      puts "#{@player1.name} representing #{@player1.mark} VS. #{@player2.name} representing #{@player2.mark}"
      puts
      randomly_assign_turns
      puts "#{@current_player.name} goes first"
      puts

      won_yet = false
      while not won_yet
        # print board at start of turn
        @board.print_board
        puts
        # get player move
        puts "#{@current_player.name}: Make your move. Enter a number between 1 & 9."
        id = gets.chomp.to_i
        move = @current_player.make_move(id)
        # report what the player chose using their name, mark and square choice
        puts "#{@current_player.name} put #{@current_player.mark} on square ##{id}"
        @board.receive_move(move)
        # before switching turns, check if a player has won
        if @board.has_someone_won?(move)
          won_yet = true 
          break
        end
        # before switching turns, switch player roles
        switch_players
      end

      puts "#{@current_player.name} won!"
      @board.print_board
      puts "GAME OVER"

    end

    def randomly_assign_turns
      @players = @players.sample(@players.length)
      @other_player = @players[1]
      @current_player = @players[0]
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    # returns true if none of array elements are empty
    def is_game_a_draw?
    end

  end
end
