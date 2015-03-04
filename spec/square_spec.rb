require 'spec_helper'

module TicTacToe
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
