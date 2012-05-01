class DailyMenusController < ApplicationController
  # GET /daily_menus
  # GET /daily_menus.json
  def index
    @daily_menus = DailyMenu.desc_by_date
    @menus_from_now = DailyMenu.from_now

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_menus }
      format.atom
    end
  end

  # GET /daily_menus/1
  # GET /daily_menus/1.json
  def show
    @daily_menu = DailyMenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @daily_menu }
    end
  end
end
