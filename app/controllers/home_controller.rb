class HomeController < ApplicationController
  before_filter :redirect_to_user_page_if_logged_in, :only => :index

  def index
  end

  private
  def redirect_to_user_page_if_logged_in
    redirect_to current_user if current_user
  end
end
