class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[show edit update destroy]
  before_action :require_session, except: %i[new create]

  def index
    @users = User.all
  end

  def home
    redirect_to current_user
  end

  def show; end

  def new
    redirect_to root_path if current_user
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      start_session(@user)
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
