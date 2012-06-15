class DailyMenu < ActiveRecord::Base
  # Scope
  scope :desc_by_date, order('daily_menus.date DESC')
  scope :asc_by_date, order('daily_menus.date DESC')


  # 現在から先のメニューすべて
  scope :from_now,
    lambda { where('date >= ?', Date.today).order('daily_menus.date ASC') }
  
  # 14日前から2日後まで
  scope :for_rss,
    lambda {
      where(
        'date >= ? AND date <= ?', 14.days.ago(Date.today), 
        2.days.from_now(Date.today)
      ).order('daily_menus.date DESC')
    }
  # Validates
  validates :date, uniqueness: :date

  def self.today
    DailyMenu.find_by_date(Date.today)
  end

  def self.tomorrow
    DailyMenu.find_by_date(Date.tomorrow)
  end
end
