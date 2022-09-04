class TeamsController < ApplicationController
  before_action :set_team, only: %i[player_list edit update destroy]
  def index
    @teams = Team.order(created_at: :desc)
  end

  def show
    if (@team = Team.find_by_id(params[:id])).present?

    else
      content_not_found
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to teams_url, notice: 'Team was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
      if @team.update(team_params)
        redirect_to team_url(@team), notice: "Team was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    @team.destroy
    redirect_to teams_url, status: :see_other, notice: "Team was successfully destroyed."
  end

  def player_list
    @players = @team.players.order(name: :asc)
  end

  private

  def team_params
    params.require(:team).permit(:name, :last_year_finish, :pro)
  end

  def set_team
    @team = Team.find(params[:id])
  end
end
