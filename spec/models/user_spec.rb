# encoding: utf-8
require 'spec_helper'

describe User do
  describe 'を作成，編集するとき' do
    # blank のテスト
    it 'email が空である場合，保存できない．' do
      user = User.new(email: '')

      user.should_not be_valid
      user.save.should be_false
    end
    
    # フォーマットのテスト
    it 'email が正しいフォーマットである場合，保存できる．' do
      # Wikipedia より
      # http://ja.wikipedia.org/wiki/%E3%83%A1%E3%83%BC%E3%83%AB%E3%82%A2%E3%83%89%E3%83%AC%E3%82%B9
      emails = [
        'hoge@example.com',
        'hoge.1a2@example.com',
        'Abc@example.com',
        'Abc.123@example.com',
        'user+mailbox/department=shipping@example.com',
        "!\#$%&'*+-/=?^_`.{|}~@example.com",
        '"Fred\ Bloggs"@example.com',
        '"Joe.\\Blow"@example.com'
      ]

      emails.each do |mail|
        user = User.new(email: mail)

        user.should be_valid
        user.save.should be_true
      end
    end

    it 'email が正しいフォーマットでない場合，保存できない．' do
      
      emails = [
        'hoge',
        'hoge@example',
        '@example',
        '@example.com',
        'hogehoge@',
        'hogehoge@hogehoghhhhhhhhhhhhhhhhhhhhhhogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeogeehhhhhhhhhhhhhhogeogeogeogeogeogeogeogeogeogeogeogeogeogehhhhhhogeogeogeogeogeogehhhhhhhhhhhogeogeogeogeogeogeogeogeogeogeogehhhhhhhhhogeogeogeogeogeogeog.com'
      ]
      emails.each do |mail|
        user = User.new(email: mail)

        user.should_not be_valid
        user.save.should be_false
      end
    end

    # presence のテスト
    it 'email が存在しない場合，保存できる．' do
      user = User.new(email: 'example@example.com')

      user.should be_valid
      user.save.should be_true
    end

    it 'email が既に存在する場合，保存できない' do
      email = 'example@example.com'
      User.new(email: email).save!

      user = User.new(email: email)

      user.should_not be_valid
      user.save.should be_false
    end
  end

  describe 'を取得するとき' do
    before :all do
      @active = [
        {email: "hoge@hoge.com", active: true},
        {email: "hoge1@hoge.com", active: true},
        {email: "hoge2@hoge.com", active: true},
        {email: "hoge3@hoge.com", active: true},
        {email: "hoge4@hoge.com", active: true}
      ]
      @inactive = [
        {email: "huga@hoge.com", active: false},
        {email: "huga1@hoge.com", active: false},
        {email: "huga2@hoge.com", active: false}
      ]

      (@active + @inactive).each do |l|
        User.create! l
      end
    end

    it 'activeなユーザのみ取得できる' do
      User.active.should have(@active.count).items
      @active.each do |l|
        User.active.find_by_email(l[:email]).should_not be_nil
      end
      @inactive.each do |l|
        User.active.find_by_email(l[:email]).should be_nil
      end
    end

    it 'inactiveなユーザのみ取得できる' do
      User.inactive.should have(@inactive.count).items
      @inactive.each do |l|
        User.inactive.find_by_email(l[:email]).should_not be_nil
      end
      @active.each do |l|
        User.inactive.find_by_email(l[:email]).should be_nil
      end
    end
  end

  describe 'を削除するとき' do
    before :each do
      @email = "hoe@hoe.com"
      @user = User.create! email: @email
    end

    it 'email が存在する場合，削除できる．' do
      user = User.find_by_email @email
      user.destroy
      
      User.find_by_email(@email).should be_nil
    end
  end

end
