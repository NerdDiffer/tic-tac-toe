require 'spec_helper'

module TicTacToe

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
  
end
