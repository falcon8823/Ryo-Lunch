class WelcomeController < ApplicationController
  def top
    @today = DailyMenu.today
  end
end
