module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      render json: Player.order(:id)
    end

    # GET /api/players/1
    def show
      if @player.present?
        render json: @player
      else 
        render :show, status: :unprocessable_entity
      end
    end

    # POST /api/players
    def create
      @player = Player.create(player_params)
      if @player.valid?
        render json: @player, status: :created
      else 
        render :new, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/players/1
    def update
      @player.update_attributes(player_params)
      if @player.valid?
        render json: @player
      else 
        render :edit, status: :unprocessable_entity
      end
    end

    # DELETE /api/players/1
    def destroy
      if @player.present?
         @player.destroy
        render json: @player
      else
        render :destroy, status: :unprocessable_entity
      end
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
