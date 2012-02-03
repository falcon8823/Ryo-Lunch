require 'spec_helper'

describe "daily_menus/edit" do
  before(:each) do
    @daily_menu = assign(:daily_menu, stub_model(DailyMenu,
      :morning => "MyText",
      :lunch => "MyText",
      :dinner => "MyText"
    ))
  end

  it "renders the edit daily_menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => daily_menus_path(@daily_menu), :method => "post" do
      assert_select "textarea#daily_menu_morning", :name => "daily_menu[morning]"
      assert_select "textarea#daily_menu_lunch", :name => "daily_menu[lunch]"
      assert_select "textarea#daily_menu_dinner", :name => "daily_menu[dinner]"
    end
  end
end
