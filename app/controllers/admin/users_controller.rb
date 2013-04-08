# encoding: utf-8

class Admin::UsersController < Admin::ApplicationController
  before_filter :set_user, only: [ :edit, :update, :destroy ]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      if params[:to_index]
        url = admin_users_url
      elsif params[:to_new]
        url = new_admin_user_url
      else
        url = edit_admin_user_url(@user)
      end

      redirect_to url, notice: "#{@user.email}を追加しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      if params[:to_index]
        url = admin_users_url
      elsif params[:to_new]
        url = new_admin_user_url
      else
        url = edit_admin_user_url(@user)
      end

      redirect_to url, notice: "#{@user.email}を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to admin_users_url, notice: "#{@user.email}を削除しました。"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
