class DailyMenu < ActiveRecord::Base
  validates :date, uniqueness: :date
end
