require 'spec_helper'

describe "daily_menus/show" do
  before(:each) do
    @daily_menu = assign(:daily_menu, stub_model(DailyMenu,
      :morning => "MyText",
      :lunch => "MyText",
      :dinner => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
