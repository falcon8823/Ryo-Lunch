class Admin::DailyMenusController < Admin::ResourcesController
  def new
    @item = DailyMenu.new date: Date.today
  end
end
