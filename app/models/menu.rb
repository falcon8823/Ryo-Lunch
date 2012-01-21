# encoding: utf-8
class Menu < ActiveRecord::Base
  validates :date,
    presence: true,
    uniqueness: {
      scope: :time,
      message: '日付もしくは時が重複していませんか？'
    }

  validates :time,
    presence: true,
    inclusion: {in: 0..2},
    numericality: true,
    uniqueness: {
      scope: :date,
      message: ''
    }


  def when
    %w(朝 昼 夕)[self.time]
  end
end
