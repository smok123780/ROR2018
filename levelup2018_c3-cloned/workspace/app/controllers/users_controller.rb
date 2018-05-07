class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :admin_check, only: [:update, :destroy]
  
  def index
    render json: User.where(admin: false)
  end

  def show
    render json: user
  end
  
  def create
    user = User.create(user_params)
    if user.valid?
      render json: user, status: 201
    else
      render json: user, serializer: UserErrorsSerializer, status: 422
    end
  end
  
  def update
    if user.update(user_params)
      render json: user
    else
      render json: user, serializer: UserErrorsSerializer, status: 422
    end
  end
  
  def destroy
    user.destroy!
    render json: user, status: 204
  end
  
  private
  
  def user
    @user ||= User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:email, :admin)
  end
  
  def admin_check
    head 401 if user.admin? && !params.has_key?(:force)
  end
end
