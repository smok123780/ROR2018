class UserCountsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def show
    render json: { user_count: User.count }
  end
end
