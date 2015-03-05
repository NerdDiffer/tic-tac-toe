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
      print_intro
      is_game_over = false
      while not is_game_over
        move = prompt_and_check_input
        print_move(move)

        # important to do these before switching turns:
        is_game_over = @board.check_game_over(move) 
        switch_players unless is_game_over
      end
      print_outcome(is_game_over)
    end

    def prompt_and_check_input
      begin
        puts
        @board.print_board
        puts "#{@current_player.name}: Make a move. Enter a number between 1 & 9."
        input = gets.chomp.to_i
        move = @current_player.make_move(input)
        @board.receive_move(move)
      rescue StandardError => e
        puts e.message
        retry
      else
        move
      end
    end

    def print_intro
      puts
      puts "**** TIC-TAC-TOE TO-THE-DEATH ****"
      puts "#{@player1.name} representing #{@player1.mark} VS. #{@player2.name} representing #{@player2.mark}"
      puts "Shuffling players..."
      randomly_assign_turns
      puts "#{@current_player.name} goes first"
    end

    def print_move(move)
      puts
      puts "#{@current_player.name} marked #{@current_player.mark} on square ##{move[:square_id]}"
    end

    def print_outcome(outcome)
      puts
      case outcome
      when :win
        puts "Congratulations #{@current_player.name}! You win!"
      when :tie
        puts "The game is a tie"
      else
        puts "**This game should still be going!**"
      end
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

  end
end
