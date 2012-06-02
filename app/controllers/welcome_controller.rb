# coding: utf-8

class WelcomeController < ApplicationController
  def top
    @title = "Ryo-Lunch - 長野高専 寮食堂の献立をお届け！"
    @today = DailyMenu.today
  end
end
