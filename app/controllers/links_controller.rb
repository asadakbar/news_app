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
    user_id = nil
    if user_signed_in?
      @user = current_user
      user_id = @user.id
    end
      url = params[:link][:url].strip
      @link = Link.new(:url => url, :user_id => user_id)
      if @link.valid?
        @link.save
        redirect_to root_path
      else
        redirect_to :back
        flash[:message] =  @link.errors[:url]

      end
    # end
  end

  def update
  end
end
