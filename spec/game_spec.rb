require 'spec_helper'

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
end
