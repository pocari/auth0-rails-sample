module Secured
  extend ActiveSupport::Concern
  include SecuredHelper

  included do
    before_action :logged_in_using_omniauth?
  end

  def logged_in_using_omniauth?
    # binding.pry
    redirect_to '/', alert: 'ログインしてください' unless current_user
  end
end
