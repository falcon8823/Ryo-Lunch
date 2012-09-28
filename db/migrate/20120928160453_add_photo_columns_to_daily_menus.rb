class AddPhotoColumnsToDailyMenus < ActiveRecord::Migration
  def change
    add_attachment :daily_menus, :breakfast_photo
    add_attachment :daily_menus, :lunch_photo
    add_attachment :daily_menus, :dinner_photo
  end
end
