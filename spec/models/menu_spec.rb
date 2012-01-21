require 'spec_helper'

describe Menu do
  fixtures :menus
  
  # すべての項目が空(nil)の場合
  context "when all are nil" do
    before :each do
      @menu = Menu.new
    end

    # 検証に失敗すること
    it "should not be valid" do
      @menu.should_not be_valid
    end

    # エラーがあること
    it "should has errors" do
      @menu.should have(1).errors_on :date
      @menu.should have(3).errors_on :time
    end
  end

  # 正しい入力の場合
  context "when all are truth" do

    before :each do
      @menu = menus(:'ex1-br')

    end

    # 検証が通ること
    it "should be valid" do
      @menu.should be_valid
    end
    
  end
  
  # 重複した時
  context "when duplicate" do
    before :each do
      @menu = menus(:'ex1-br')
      @menu.save!
      
      @menu_dep = menus(:'ex1-br')
      # id以外を重複させる
      @menu_dep.id = 2
    end

    # 検証に失敗すること
    it "should not be valid" do
      @menu_dep.should_not be_valid
    end
  end
end

