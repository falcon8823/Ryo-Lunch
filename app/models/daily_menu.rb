class DailyMenu < ActiveRecord::Base
  #attr_accessible :breakfast_photo, :lunch_photo, :dinner_photo
  has_attached_file :breakfast_photo,
    {
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :url => "/photos/:hash.:extension",
      :hash_secret => "ryo-lunch-s-photo"
    }
  has_attached_file :lunch_photo,
    {
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :url => "/photos/:hash.:extension",
      :hash_secret => "ryo-lunch-s-photo"
    }
  has_attached_file :dinner_photo,
    {
      :styles => { :medium => "300x300>", :thumb => "100x100>" },
      :url => "/photos/:hash.:extension",
      :hash_secret => "ryo-lunch-s-photo"
    }


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
