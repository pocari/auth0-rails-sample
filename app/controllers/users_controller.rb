class UsersController < ApplicationController
  def new
    signup_key = session[:state] = params[:state]
    @user = User.new(signup_key: signup_key)
  end

  def create
    p params
    # binding.pry
    u = User.new(user_params)
    if u.save
      state = session[:state]
      session[state] = u.id
      redirect_to "https://#{ENV.fetch('AUTH0_DOMAIN')}/continue?state=#{session[:state]}"
    else
      flash.now[:alert] = '登録できませんでした'
      render :new
    end
  end

  private
  def user_params
    params.require('user').permit(
      :extra1,
      :signup_key,
    )
  end
end
