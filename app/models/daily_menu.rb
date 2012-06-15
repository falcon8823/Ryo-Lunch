class DailyMenu < ActiveRecord::Base
  # Scope
  scope :desc_by_date, order('daily_menus.date DESC')
  scope :asc_by_date, order('daily_menus.date DESC')

  today = Proc.new { Date.today }

  # 現在から先のメニューすべて
  scope :from_now,
    where('date >= ?', today).order('daily_menus.date ASC')
  
  # 14日前から2日後まで
  scope :for_rss,
    where('date >= ? AND date <= ?', 14.days.ago(today), 2.days.from_now(today)).order('daily_menus.date DESC')

  # Validates
  validates :date, uniqueness: :date

  def self.today
    DailyMenu.find_by_date(Date.today)
  end

  def self.tomorrow
    DailyMenu.find_by_date(Date.tomorrow)
  end
end
