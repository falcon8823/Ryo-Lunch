class AddFooterToDailyMenus < ActiveRecord::Migration
  def change
    add_column :daily_menus, :footer, :text
  end
end
