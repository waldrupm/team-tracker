class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    if(@team = Team.find_by_id(params[:id])).present?

    else
      content_not_found
    end

  end

  def player_list
    @team = Team.find(params[:id])
  end
end