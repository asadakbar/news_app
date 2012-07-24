class LinksController < ApplicationController

  def index
  @links = Link.all
  end

  def show

  end

  def destroy
  end

  def new
  end

  def edit
  end

  def create
    @link = Link.create(:url => params[:link][:url])
    redirect_to root_path
  end

  def update
  end
end
