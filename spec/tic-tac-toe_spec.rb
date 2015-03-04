require_relative '../lib//tic-tac-toe.rb'

module TicTacToe

  describe Game do
    before :all do
      @game = Game.new("Abby", "Bob")
    end
  
    describe "#new" do
      it 'creates an instance of Game class' do
        expect(@game).to be_an_instance_of(Game)
      end
    end

    describe "#randomly_assign_turns" do
      game2 = Game.new("Zulu", "Yellow")
      game2.randomly_assign_turns
      it 'will automatically return the player picked as @current_player' do
        expect(game2.randomly_assign_turns).to eq(game2.current_player)
      end
      context 'randomly picks one player to be the role of @current_player,' do
        it 'while selecting the remaining player to be role of @other_player' do
          expect(game2.current_player).not_to eq(game2.other_player)
        end
      end
    end
  end
  
  describe Player do
    before :all do
      @p1 = Player.new("Alf", "X")
      @p2 = Player.new("Bruce", "O")
    end
  
    context 'name' do
      it 'returns the name of the player' do
        expect(@p1.name).to eq 'Alf'
        expect(@p2.name).to eq 'Bruce'
      end
    end
  
    context 'mark' do
      it 'returns the mark of the player' do
        expect(@p1.mark).to eq 'X'
        expect(@p2.mark).to eq 'O'
      end
    end

    describe '#make_move' do
      context "when selected square is not yet marked" do
        it "can send the game board an ID, which updates the board" do
          expect{ @p1.make_move(3) }.not_to raise_error
        end
      end
    end
  end
  
  describe Board do
    before :all do
      @board = Board.new
    end

    describe '#populate_new_board' do
      it 'this should be a private method' do
        expect{ @board.populate_new_board }.to raise_error(NoMethodError)
      end
      it 'when called from #initialize, populates the marks_array' do
        are_all_square = @board.marks_array[1..9].all? do |m|
          m.class == Square
        end
        expect(are_all_square).to eq true
      end
      it 'should not let you change the array outside of this method' do
        expect{ @board[0] = true }.to raise_error
      end
    end

    describe '#receive_move' do
      context 'accepted parameters:' do
        it 'should be one hash object with the keys `id` and `mark`' do
          
        end
      end

      context 'before applying the player move to the board,' do
        square_id = 1
        board = Board.new
        board.marks_array[square_id] = Square.new(square_id, nil)

        it 'the mark should be nil' do
          expect(board.marks_array[square_id].mark).to be_nil
        end
      end

      context 'effects on targeted square:' do
        square_id = 1
        board = Board.new
        p1 = Player.new("Alf", "X")
        board.marks_array[square_id] = Square.new(square_id, nil)
        changed_square = board.receive_move(p1.make_move(square_id))

        it 'returns the selected square' do
          expect(changed_square).to be_instance_of(Square)
        end

        it 'the selected square has an updated value' do
          expect(changed_square.mark).not_to(be_nil)
          expect(changed_square.mark).to eq('X')
        end
      end
    end

    describe '#has_someone_won?' do
      b = Board.new
      context 'before making any moves at all' do
        xit 'it should return false' do
          expect(b.has_someone_won?()).to eq false
        end
      end

      context 'before making winning move' do
        b1 = Board.new
        p1 = Player.new("Alf", 'X')
        sq1 = Square.new(1, 'X')  
        sq2 = Square.new(2, 'X')  
        b1.marks_array[1] = sq1
        b1.marks_array[2] = sq2
        p1_move_bad = p1.make_move(6)
        b1.receive_move(p1_move_bad)
        xit 'should return false because nobody has won' do
          expect(b.has_someone_won?(p1_move_bad)).to eq false
        end
      end

      context 'after making a winning move' do
        b = Board.new
        p = Player.new("Alf", 'X')
        sq1 = Square.new(1, 'X')  
        sq2 = Square.new(2, 'X')  
        b.marks_array[1] = sq1
        b.marks_array[2] = sq2
        p_move_ftw = p.make_move(3)
        b.receive_move(p_move_ftw)
        it 'should return true when marks are all the same within a row' do
          expect(b.has_someone_won?(p_move_ftw)).to eq true
        end
      end

    end

  end
  
  describe Square do
    before :all do
      @sq1 = Square.new(1, nil)
    end
  
    context '#new' do
      it 'is initialized with an id' do
        expect(@sq1.id).to eq 1
      end
      it 'has a mark of nil' do
        expect(@sq1.mark).to eq nil
      end
    end

    describe '#change_mark' do
      before :all do
        @sq1 = Square.new(1, nil)
      end
      context "when it's not yet marked,"  do
        it "before trying to mark, check square for nil value" do
          expect(@sq1.mark).to be_nil
        end
        it "the square should be able to change its own mark" do
          @sq1.change_mark('X')
          expect(@sq1.mark).to eq 'X'
        end
      end
      context "when it is already marked," do
        it "the square won't change itself" do
          expect{ @sq1.change_mark('X') }.to raise_error
        end
      end
    end
  end

end
