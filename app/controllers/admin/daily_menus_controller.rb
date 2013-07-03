# encoding: utf-8

class Admin::DailyMenusController < Admin::ApplicationController
  before_filter :set_daily_menu, only: [ :edit, :update, :destroy ]

  def index
    @daily_menus = DailyMenu.desc_by_date.page(params[:page]).per(20)
  end

  def new
    @daily_menu = DailyMenu.new
  end

  def create
    @daily_menu = DailyMenu.new(params[:daily_menu])

    if @daily_menu.save
      if params[:to_index]
        url = admin_daily_menus_url
      elsif params[:to_new]
        url = new_admin_daily_menu_url
      else
        url = edit_admin_daily_menu_url(@daily_menu)
      end

      redirect_to url, notice: "#{l @daily_menu.date}の献立を追加しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @daily_menu.update_attributes(params[:daily_menu])
      if params[:to_index]
        url = admin_daily_menus_url
      elsif params[:to_new]
        url = new_admin_daily_menu_url
      else
        url = edit_admin_daily_menu_url(@daily_menu)
      end

      redirect_to url, notice: "#{l @daily_menu.date}の献立を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @daily_menu.destroy

    redirect_to admin_daily_menus_url, notice: "#{l @daily_menu.date}の献立を削除しました。"
  end

  private

  def set_daily_menu
    @daily_menu = DailyMenu.find(params[:id])
  end
end
