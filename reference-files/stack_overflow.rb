module MyModule
  describe Section do
    before :all do
      @sq1 = Section.new(1, nil)
    end
  
    describe '#change_mark' do
      context "when it's not yet marked,"  do
        it "before trying to mark, check square for nil value" do
          expect(@sq1.mark).to be_nil
        end
        it "the square should be able to change its own mark" do
          expect{ @sq1.change_mark('X') }.not_to raise_error
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
