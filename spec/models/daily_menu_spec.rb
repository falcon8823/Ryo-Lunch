# encoding: utf-8
require 'spec_helper'

describe DailyMenu do
  # fixturesを読み込み
  fixtures :daily_menus

  context "正常データの場合" do
    before :each do
      @date = Date.today.next_year
      DailyMenu.new(
        date: @date,
        breakfast: "パン",
        lunch: "ラーメン",
        dinner: "カレーライス"
      ).save!
    end

    it "日付に対して唯一のデータを読み込めること" do
      menus = DailyMenu.find_all_by_date(@date)
      menus.count.should == 1
    end

    it "データは検証に成功し かつ 作成できること" do
      date = @date.next
      
      # 作成されていないかチェック
      DailyMenu.find_all_by_date(date).count.should == 0

      daily_menu = DailyMenu.new(
        date: date,
        breakfast: "パン2",
        lunch: "ラーメン2",
        dinner: "カレーライス2"
      )
      daily_menu.should be_valid
      daily_menu.save.should be_true

      # 実際に作成されているかチェック
      DailyMenu.find_all_by_date(date).count.should == 1
    end

    it "データは検証に成功し かつ 更新できること" do
      daily_menu = DailyMenu.find_by_date(@date)
      daily_menu.date = @date.next_year

      daily_menu.should be_valid
      daily_menu.save.should be_true
    end
  end

  context "#date が重複した場合" do
    before :each do
      @date = Date.today.next_year
      @daily_menu = DailyMenu.new(date: @date)
      @daily_menu.save!
      
      # もう１件のデータ
      DailyMenu.new(date: @date.next).save!

      @duplicated_menu = DailyMenu.new(date: @date)
      
      # 既にデータがあるかチェック
      DailyMenu.find_all_by_date(@date).count.should == 1
    end

    after :each do
      # 実際に作成されていないかチェック
      DailyMenu.find_all_by_date(@date).count.should == 1

    end

    it "検証に失敗し かつ 作成できないこと" do
      @duplicated_menu.should_not be_valid
      @duplicated_menu.save.should be_false
    end
    
    it "検証に失敗し かつ 更新できないこと" do
      @menu = DailyMenu.find_by_date(@date.next)
      # 既に存在する日付にセット
      @menu.date = @date

      @menu.should_not be_valid
      @menu.save.should be_false
    end
  end
end
