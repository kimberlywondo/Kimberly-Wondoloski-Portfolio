class WelcomeController < ApplicationController
  before_filter :disable_nav, only: [:index_page]
  #changed from ':welcome_page'
  # render navbar on all pages except for welcome

  def index
  end

  def about
  end

  def Projects
  end

  def Contact
  end

  def Blog
  end

  def Resume
  end

end
