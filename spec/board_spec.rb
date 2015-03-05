require 'spec_helper'

module TicTacToe
  describe Board do
    before :each do
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

    describe '#validate_square_id' do
      context 'rejecting a player move:' do
        let(:b) { Board.new }
        let(:p) { Player.new("Lloyd", "X") }
        it 'it raises a TypeError when user enters a non-integer' do
          badly_typed_value = p.make_move('ten')[:square_id]
          expect{b.validate_square_id(badly_typed_value)}.to raise_error TypeError
        end
        it 'raises an IndexError, if given a value not found in array,' do
          out_of_bounds_value = p.make_move(10)[:square_id]
          expect{b.validate_square_id(out_of_bounds_value)}.to raise_error IndexError
        end
      end
    end

    describe '#receive_move' do
      let(:square_id) { 1 }
      let(:board) { Board.new }
      let(:sq1) { Square.new(square_id, nil) }
      let(:p1) { Player.new("Alf", "X") }

      it "before the board receives a move, the square's mark should be nil" do
        expect(sq1.mark).to be_nil
      end
      it 'returns the selected square' do
        sq1 = board.receive_move(p1.make_move(square_id))
        expect(sq1).to be_instance_of(Square)
      end
      it 'the selected square has an updated value' do
        sq1 = board.receive_move(p1.make_move(square_id))
        expect(sq1.mark).not_to(be_nil)
        expect(sq1.mark).to eq('X')
      end
      it 'returns TypeError when given non-integer input' do
        move = p1.make_move('NOT A NUMBER')
        expect{board.receive_move(move)}.to raise_error TypeError
      end
      it 'returns IndexError when given input too high or too low ' do
        move = p1.make_move(9999)
        expect{board.receive_move(move)}.to raise_error IndexError
      end
      it 'returns RuntimeError when given square is asked to modify itself again ' do
        valid_move = p1.make_move(9)
        repeated_move = p1.make_move(9)
        board.receive_move(valid_move)
        expect{board.receive_move(repeated_move)}.to raise_error RuntimeError
      end
    end

    describe '#has_someone_won?' do
      let(:b) { Board.new }
      let(:p) { Player.new("Alf", "X") }

      it "it should return false before making any moves at all" do
        expect(b.has_someone_won?()).to eq false
      end

      it "should return false because nobody has won, before a winning move" do
        b.receive_move(p.make_move(1))
        b.receive_move(p.make_move(2))
        p_move_bad = p.make_move(6)
        b.receive_move(p_move_bad)
        expect(b.has_someone_won?(p_move_bad)).to eq false
      end

      it "should return true when marks are all the same within a row" do
        b.receive_move(p.make_move(1))
        b.receive_move(p.make_move(2))
        p_move_ftw = p.make_move(3)
        b.receive_move(p_move_ftw)
        expect(b.has_someone_won?(p_move_ftw)).to eq true
      end

    end

  end
end
