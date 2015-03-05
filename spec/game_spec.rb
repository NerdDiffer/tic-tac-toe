require 'spec_helper'

module TicTacToe
  describe Game do
    let(:game) { Game.new("Alessio", "Bruno") }

    describe "#new" do
      it 'creates an instance of Game class' do
        expect(game).to be_an_instance_of(Game)
      end
    end

    describe "#randomly_assign_turns" do
      it 'will automatically return the player picked as @current_player' do
        game.randomly_assign_turns
        expect(game.randomly_assign_turns).to eq(game.current_player)
      end
      context 'randomly picks one player to be the role of @current_player,' do
        it 'while selecting the remaining player to be role of @other_player' do
          game.randomly_assign_turns
          expect(game.current_player).not_to eq(game.other_player)
        end
      end
    end

    context '#switch_players' do
      it 'switches roles, current player becomes other player' do
        game.current_player = game.player1
        game.other_player = game.player2
        game.switch_players
        expect(game.other_player.name).to eq "Alessio"
      end
      it 'switches roles, other player becomes current player' do
        game.current_player = game.player1
        game.other_player = game.player2
        game.switch_players
        expect(game.current_player.name).to eq "Bruno"
      end
    end

  end
end
