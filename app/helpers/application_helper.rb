# frozen_string_literal: true

module ApplicationHelper

   def logged_in_user
 unless logged_in?

 flash[:danger] = "Please log in."
 redirect_to login_url
 end
 end
end
