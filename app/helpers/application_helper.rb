# frozen_string_literal: true

module ApplicationHelper
  def current_user
     @current_user ||= User.find(session[:user_id])
   end
   def logged_in?
     !!current_user
   end
end
