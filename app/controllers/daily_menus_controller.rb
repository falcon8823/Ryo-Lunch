class DailyMenusController < ApplicationController
  # GET /daily_menus
  # GET /daily_menus.json
  def index
    @daily_menus = DailyMenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @daily_menus }
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

  # GET /daily_menus/new
  # GET /daily_menus/new.json
  def new
    @daily_menu = DailyMenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @daily_menu }
    end
  end

  # GET /daily_menus/1/edit
  def edit
    @daily_menu = DailyMenu.find(params[:id])
  end

  # POST /daily_menus
  # POST /daily_menus.json
  def create
    @daily_menu = DailyMenu.new(params[:daily_menu])

    respond_to do |format|
      if @daily_menu.save
        format.html { redirect_to @daily_menu, notice: 'Daily menu was successfully created.' }
        format.json { render json: @daily_menu, status: :created, location: @daily_menu }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /daily_menus/1
  # PUT /daily_menus/1.json
  def update
    @daily_menu = DailyMenu.find(params[:id])

    respond_to do |format|
      if @daily_menu.update_attributes(params[:daily_menu])
        format.html { redirect_to @daily_menu, notice: 'Daily menu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_menus/1
  # DELETE /daily_menus/1.json
  def destroy
    @daily_menu = DailyMenu.find(params[:id])
    @daily_menu.destroy

    respond_to do |format|
      format.html { redirect_to daily_menus_url }
      format.json { head :no_content }
    end
  end
end
