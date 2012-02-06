# encoding: utf-8
require 'spec_helper'

describe "daily_menus/index" do
  before(:each) do
    assign(:daily_menus, [
      stub_model(DailyMenu,
        :date => Date.today,
        :breakfast => "MyText",
        :lunch => "MyText",
        :dinner => "MyText"
      ),
      stub_model(DailyMenu,
        :date => 1.day.from_now,
        :breakfast => "MyText",
        :lunch => "MyText",
        :dinner => "MyText"
      )
    ])
  end

  it "登録された項目が表示されること" do
    render

    assert_select "tr>td>h5", text: l(Date.today, format: :short), count: 1
    assert_select "tr>td>h5", text: l(1.day.from_now, format: :short), count: 1
  end
end
