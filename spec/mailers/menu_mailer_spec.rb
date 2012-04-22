# coding: utf-8
require "spec_helper"

describe MenuMailer do
  describe "today" do
    let(:mail) { MenuMailer.today }

    it "renders the headers" do
      mail.subject.should eq("#{l(@menu.date, format: :short)}のRyo-Lunch")
      mail.to.should eq([APP_CONFIG['suppprt-mail']])
      mail.from.should eq([APP_CONFIG['sender-mail']])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
