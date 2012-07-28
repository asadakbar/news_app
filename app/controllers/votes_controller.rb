class VotesController < ApplicationController
   # before_filter :find_resource

  def create
    @vote = Vote.create(user_id: current_user.id, link_id: params[:link_id])
    link = @vote.link
    current_vote_total = link.vote_total
    current_vote_total += 1
    link.update_attributes(:vote_total => current_vote_total)
    redirect_to root_path
  end

  def edit
  end

  def new
  end

  def delete
  end

  def update
  end
end
