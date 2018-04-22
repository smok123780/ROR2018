class UserCountsController < ApplicationController
  
  def show
    render :json {users_count: User.all.size}
  end
  
end
