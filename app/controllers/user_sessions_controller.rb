class UserSessionsController < ApplicationController

  skip_before_action :require_login, only: %i[ new create ]

  def new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(songs_path, notice: "You have logged in successfully")
    else
      flash.now[:alert] = "Log in failed"
      render :new
    end
  end
end