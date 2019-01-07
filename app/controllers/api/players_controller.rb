module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      render json: Player.order(:id)
    end

    # GET /api/players/1
    def show
      render json: Player.find(params[:id])
    end

    # POST /api/players
    def create

    end

    # PATCH/PUT /api/players/1
    def update
      player = Player.find(params[:id])
      player.update_attributes(player_params)
      render json: player
    end

    # DELETE /api/players/1
    def destroy

    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :position)
    end
  end
end
