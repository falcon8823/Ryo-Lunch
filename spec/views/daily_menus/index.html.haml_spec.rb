require 'spec_helper'

describe "daily_menus/index" do
  before(:each) do
    assign(:daily_menus, [
      stub_model(DailyMenu,
        :morning => "MyText",
        :lunch => "MyText",
        :dinner => "MyText"
      ),
      stub_model(DailyMenu,
        :morning => "MyText",
        :lunch => "MyText",
        :dinner => "MyText"
      )
    ])
  end

  it "renders a list of daily_menus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
