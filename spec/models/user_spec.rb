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
    it '存在する id の場合，1件取得できる．' do
      pending
    end

    it '存在しない id の場合，取得できない．' do
      pending
    end

    it '存在する email の場合，1件取得できる．' do
      pending
    end

    it '存在しない email の場合，取得できない．' do
      pending
    end
  end

  describe 'を削除するとき' do
    it 'id が存在する場合，削除できる．' do
      pending
      # TODO: 件数チェック
    end

  end


  describe 'をするとき' do
    it '場合，．' do
      pending
    end
  end

end
