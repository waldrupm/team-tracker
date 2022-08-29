class TeamsController < ApplicationController
  def index
    @teams = Team.order(created_at: :desc)
  end

  def show
    if(@team = Team.find_by_id(params[:id])).present?

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
        redirect_to teams_url, notice: "Team was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  def player_list
    @team = Team.find(params[:id])
  end

  private
  def team_params
    params.require(:team).permit(:name, :last_year_finish, :pro)
  end
end