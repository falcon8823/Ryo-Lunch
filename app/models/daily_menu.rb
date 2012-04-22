class DailyMenu < ActiveRecord::Base
  # Scope
  default_scope order: 'daily_menus.date ASC'
  scope :today, where(date: Date.today)

  # Validates
  validates :date, uniqueness: :date
end
