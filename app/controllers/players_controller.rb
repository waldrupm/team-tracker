class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  def index
    @players = Player.where(drafted: true).order(name: :asc)
  end

  def show
  end
  def new
    @team = Team.find(params[:team_id])
    @form_path = create_team_player_path(@team)
    @player = Player.new
  end
  def create
    @team = Team.find(params[:team_id])
    @player = @team.players.new(player_params)

    if @player.save
      redirect_to team_player_list_path(@team), notice: 'Player was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @team = @player.team
    @form_path = update_player_path(@player)
  end

  def update
    if @player.update(player_params)
      redirect_to player_url(@player), notice: "Player was successfully updated."
    else
      @team = @player.team
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    redirect_to players_path, status: :see_other, notice: "Player was successfully destroyed."
  end

  private
  def set_player
    @player = Player.find(params[:id])
  end
  
  def player_params
    params.require(:player).permit(:name, :rating, :drafted, :team_id)
  end
end