class LinksController < ApplicationController

  def index
    @links = Link.scoped.page(params[:page]).per(5)
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
    url = params[:link][:url].strip
    @link = Link.new(:url => url)
    if @link.valid?
      @link.save
      redirect_to root_path
    else
      redirect_to :back
      flash[:message] =  @link.errors[:url]

    end
  end

  def update
  end
end
