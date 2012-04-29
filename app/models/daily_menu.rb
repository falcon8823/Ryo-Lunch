class DailyMenu < ActiveRecord::Base
  # Scope
  default_scope order: 'daily_menus.date DESC'
  scope :from_now, where('date >= ?', Date.today)

  # Validates
  validates :date, uniqueness: :date

  def self.today
    DailyMenu.find_by_date(Date.today)
  end

  def self.tomorrow
    DailyMenu.find_by_date(Date.tomorrow)
  end
end
