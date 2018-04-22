class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    respond_to do |format|
      format.html { render text: 'ludziki' }
      format.json { render json: {query: params[:myparam]} }
    end
  end

  def show
    @user = User.find(params[:id])
    render json: {email: @user.email, admin: @user.admin}
  end
  
  def create
    @user = User.create(user_params)
    render json: {email: @user.email, admin: @user.admin}
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params)
    #@user = User.find(params[:id])
    #if @user.update_attributes(user_params)
    # #Handle a successful update.
    #else
    #  render 'edit'
  end
  
  private 
  def user_params
    params.require(:user).permit(:email, :admin)
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.admin != true || params.has_key?("force")
      @user.destroy
      status = 200
    else
      status = 401
    end

    render json: {}, status: status
    
  end
  
end
