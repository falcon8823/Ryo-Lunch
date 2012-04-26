# coding: utf-8

class RegistrationController < ApplicationController
  # GET /registration/activate
  def activate
    code = params[:activation_code]
    if code
      user = User.inactive.find_by_activation_code(code)
      if user && user.activation_start > 2.hours.ago
          # 登録処理
          user.active = true
          user.activation_code = nil
          user.save!

          render text: 'Ryo-Lunchの配信登録が完了しました。', layout: true
      else
        render text: '指定されたURLは無効か期限切れです。', layout: true
      end
    else
      render text: '指定されたURLは無効です。', layout: true
    end
  end
  
  # GET /registration/stopping
  def stopping
    code = params[:activation_code]
    if code
      user = User.active.find_by_activation_code(code)
      if user && user.activation_start > 2.hours.ago
          # 解除処理
          user.destroy
          render text: 'Ryo-Lunchの配信停止が完了しました。', layout: true
      else
        render text: '指定されたURLは無効か期限切れです。', layout: true
      end
    else
      render text: '指定されたURLは無効です。', layout: true
    end

  end
end
