class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def disable_nav
    @disable_nav = true
  end
  # disable nav in welcome page
end
