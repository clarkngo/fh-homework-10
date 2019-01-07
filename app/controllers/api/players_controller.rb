module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      render json: Player.order(:id)
    end

    # GET /api/players/1
    def show
      set_player
      if @player.valid?
        render json: @player
      else 
      end
    end

    # POST /api/players
    def create
      @player = Player.create(player_params)
      if @player.valid?
        render json: @player
      else 
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/players/1
    def update
      set_player
      @player.update_attributes(player_params)
      render json: @player
    end

    # DELETE /api/players/1
    def destroy
      set_player
      @player.destroy
      render json: @player
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
