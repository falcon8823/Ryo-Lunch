class DailyMenu < ActiveRecord::Base
  # Scope
  default_scope order: 'daily_menus.date ASC'

  # Validates
  validates :date, uniqueness: :date
end
