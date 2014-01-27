# encoding: utf-8
class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to :users
    else
      flash.now[:alert] = "Usuário e/ou senha inválidos"
      render action: "new"
    end
  end

  def destroy
    logout
    redirect_to :users
  end
end
