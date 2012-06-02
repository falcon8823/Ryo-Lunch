# coding: utf-8

class WelcomeController < ApplicationController
  def top
    @title = "Ryo-Lunch"
    @today = DailyMenu.today
  end
end
