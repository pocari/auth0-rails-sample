class Auth0Controller < ApplicationController
  def callback
    # binding.pry
    puts "-------------------------------------------------------------="
    p [:callback]
    # This stores all the user information that came from Auth0
    # and the IdP

    # 新規作成時
    user = User.find_by(signup_key: session[:state])
    msg = ""
    if user
      user.provider = request.env['omniauth.auth']['provider']
      user.uid = request.env['omniauth.auth']['uid']
      user.name = request.env['omniauth.auth']['info']['name']
      user.email = request.env['omniauth.auth']['info']['email']
      user.avatar = request.env['omniauth.auth']['info']['image']

      if user.save
        msg = "サインアップしました"
      else
        redirect_to '/', alert: "failed auth0 callback" and return
      end
    else
      user = User.find_by(
        provider: request.env['omniauth.auth']['provider'],
        uid: request.env['omniauth.auth']['uid']
      )
      msg = "ログインしました"
    end

    session[:user_id] = user.id
    redirect_to '/dashboard', notice: msg
  end

  def failure
    puts "-------------------------------------------------------------="
    p [:failure]
    p [:request_env, request.env]
    p [:request_msg, request.params['message']]
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
