class ApiUsersController < ApplicationController
  def index
  end

  def create
    authorize! :create, ApiUser
    if params[:name]
      token = gen_api_token(params[:name]).to_s
      u = ApiUser.create(
        :token => token,
        :name => params[:name]
      )
      redirect_to action: :show, id: u.id
    end
  end

  def update
  end

  def delete
  end

  def show
    authorize! :read, ApiUser
    @user = ApiUser.find(params[:id])
  end
end
