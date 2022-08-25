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
end