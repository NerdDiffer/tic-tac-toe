require 'spec_helper'

module TicTacToe

  describe Player do
    context 'querying player attributes,' do
      before :all do
        @p1 = Player.new("Alf", "X")
        @p2 = Player.new("Bruce", "O")
      end
  
      it 'returns the name of the player' do
        expect(@p1.name).to eq('Alf')
        expect(@p2.name).to eq('Bruce')
      end
      it 'returns the mark of the player' do
        expect(@p1.mark).to eq('X')
        expect(@p2.mark).to eq('O')
      end
    end

    describe '#make_move' do
      before :all do
        @p1 = Player.new("Alessio", "X")
        @p2 = Player.new("Bruno", "Y")
        @p3 = Player.new("Carl", "Z")
      end
      it "accepts an integer, square_id, and returns a hash with the keys: square_id, player_mark" do
        alessio_move = { square_id: 3, player_mark: "X" }
        bruno_move = { square_id: 4, player_mark: "Y" }
        carl_move = { square_id: 5, player_mark: "Z" }
        expect(@p1.make_move(3)).to eq alessio_move
        expect(@p2.make_move(4)).to eq bruno_move
        expect(@p3.make_move(5)).to eq carl_move
      end
    end
  end
  
end
