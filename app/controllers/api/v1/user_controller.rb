class Api::V1::UserController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.save

    if @user.save
      created_jwt = issue_token(id: @user.id)
      render json: { username: @user.username, jwt: created_jwt }
    else
      render json: {
        error: 'Username already exists'
      }, status: 422
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: { user: @user }
  end

  def show
    render json: { user: User.find(params[:id]) }
  end

  def index
    render json: { user: User.all }
  end

  def delete
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: 'deleted user' }
  end

  private

  def user_params
    params.permit(:username, :password, :email, :current_city)
  end
end
