class LinksController < ApplicationController

  def index
    @links = Link.scoped.page(params[:page]).per(20)
  end

  def show

  end

  def destroy
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    user_id = nil
    if user_signed_in?
      @user = current_user
      user_id = @user.id
    end
      # url = params[:link][:url].strip
      @link = Link.new(params[:link])
      if @link.valid?
        @link.save
        redirect_to root_path
      else
        render :new
        # flash[:message] =  @link.errors[:url]
        # @link = @bad_link

      end
    # end
  end

  def update

    @link = Link.find(params[:id])
    if @link.updated_at + 1.minutes >= Time.now
      if @link.update_attributes(params[:link])
      redirect_to root_path
      else
       render "edit"
      end
    else
      redirect_to root_path, :notice => "Your time to edit a link is 15 minutes, which has currently passed."
    end

  end
end
