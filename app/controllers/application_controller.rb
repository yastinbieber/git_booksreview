class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    top_index_path(current_user)
  end
end
