require 'spec_helper'

module TicTacToe
  describe Square do
    describe '#new' do
      let(:sq1) { Square.new(1, nil) }
  
      it 'is initialized with an id' do
        expect(sq1.id).to eq(1)
      end
      it 'has a mark of nil' do
        expect(sq1.mark).to eq(nil)
      end
    end

    describe '#change_mark' do
      context "before it gets marked,"  do
        let(:sq1) { Square.new(1, nil) }
        it "before trying to mark, check square for nil value" do
          expect(sq1.mark).to(be_nil)
        end
        it "the square should be able to change its own mark" do
          sq1.change_mark('X')
          expect(sq1.mark).to eq('X')
        end
      end
      context "after it is already marked," do
        let(:sq1) { Square.new(1, 'X') }
        it "it will raise a RuntimeError" do
          expect{ sq1.change_mark('X') }.to raise_error(RuntimeError)
        end
      end
    end
  end

end
