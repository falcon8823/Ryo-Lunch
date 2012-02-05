# encoding: utf-8
require 'spec_helper'

describe DailyMenu do
  context "正常データの場合" do
    before :each do
      @daily_menu = DailyMenu.new(
        date: Date.today,
        breakfast: "パン",
        lunch: "ラーメン",
        dinner: "カレーライス"
      )
    end

    it "データは検証に成功し かつ 保存できること" do
      @daily_menu.should be_valid
    end
  end

  context "#date が重複した場合" do
    before :each do
      @date = Date.today
      @daily_menu = DailyMenu.new(date: @date)
      @daily_menu.save!
      
      @duplicated_menu = DailyMenu.new(date: @date)
    end

    it "検証に失敗し かつ 保存できないこと" do
      @duplicated_menu.should_not be_valid
      @duplicated_menu.save.should be_false
    end
  end
end
