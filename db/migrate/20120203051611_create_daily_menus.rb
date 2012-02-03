class CreateDailyMenus < ActiveRecord::Migration
  def change
    create_table :daily_menus do |t|
      t.date :date
      t.text :morning
      t.text :lunch
      t.text :dinner

      t.timestamps
    end
  end
end
