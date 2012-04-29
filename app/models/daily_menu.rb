class DailyMenu < ActiveRecord::Base
  # Scope
  scope :desc_by_date, order('daily_menus.date DESC')
  scope :asc_by_date, order('daily_menus.date DESC')
  
  scope :from_now,
    where('date >= ?', Date.today).order('daily_menus.date ASC')

  # Validates
  validates :date, uniqueness: :date

  def self.today
    DailyMenu.find_by_date(Date.today)
  end

  def self.tomorrow
    DailyMenu.find_by_date(Date.tomorrow)
  end
end
