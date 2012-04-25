class AddSomeFieldForActivationToUser < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean

    add_column :users, :activation_code, :string
    add_index :users, :activation_code, length: 32, unique: true

    add_column :users, :activation_start, :datetime

  end
end
