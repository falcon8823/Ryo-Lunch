class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.date :date, null: false
      t.integer :time, null: false
      t.text :contents, null: false

      t.timestamps
    end

    add_index :menus, [:date, :time], unique: true
  end
end
