# frozen_string_literal: true

class PagesController < ActionController::Base
  layout 'application'
  include ApplicationHelper

  def home
    redirect_to(articles_path) if logged_in?
  end

  def about; end
end
