class HomeController < ApplicationController
  skip_before_filter :require_login, only: [:welcome]

  def welcome
  end
end
