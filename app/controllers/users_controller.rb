# encoding: utf-8
class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    redirect_to :users if current_user
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        login(@user.email, user_params[:password])
        format.html { redirect_to(:users, notice: 'Seja bem-vindo ao MYGOAL! Você se registrou com sucesso :)') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Seu perfil foi atualizado com sucesso' }
        format.json { head :no_content }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    logout
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      # Doing that to solve STI routes bug :(
      if params[:user].blank? && !params[:student].blank?
        sti_params = params.require(:student)
      elsif params[:user].blank? && !params[:teacher].blank?
        sti_params = params.require(:teacher)
      else
        sti_params = params.require(:user)
      end

      sti_params.permit(:email, :password, :password_confirmation,
        :name, :city, :document, :specialty, :type)
    end
end
