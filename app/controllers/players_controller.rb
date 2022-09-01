class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end
  def new
    @team = Team.find(params[:team_id])
    @form_path = create_team_player_path(@team)
    @player = Player.new
  end
  def create
    team = Team.find(params[:team_id])
    @player = team.players.new(player_params)

    if @player.save
      redirect_to team_player_list_path(team), notice: 'Player was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def player_params
    params.require(:player).permit(:name, :rating, :drafted, :team_id)
  end
end