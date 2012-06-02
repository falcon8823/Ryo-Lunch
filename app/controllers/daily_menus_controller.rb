# coding: utf-8
class DailyMenusController < ApplicationController
  # GET /daily_menus
  # GET /daily_menus.json
  def index
    @title = "Ryo-Lunch / 献立一覧"
    @daily_menus = DailyMenu.desc_by_date
    @menus_from_now = DailyMenu.from_now

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_menus }
    end
  end

  # GET /daily_menus/1
  # GET /daily_menus/1.json
  def show
    @daily_menu = DailyMenu.find(params[:id])
    
    
    @title = "Ryo-Lunch / #{l @daily_menu.date, format: :long}のメニュー"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_menu }
    end
  end
end
