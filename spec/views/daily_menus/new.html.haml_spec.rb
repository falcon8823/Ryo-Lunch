require 'spec_helper'

describe "daily_menus/new" do
  before(:each) do
    assign(:daily_menu, stub_model(DailyMenu,
      :date => Date.today,
      :breakfast => "MyText",
      :lunch => "MyText",
      :dinner => "MyText"
    ).as_new_record)
  end

  it "renders new daily_menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => daily_menus_path, :method => "post" do
      assert_select "textarea#daily_menu_breakfast", :name => "daily_menu[breakfast]"
      assert_select "textarea#daily_menu_lunch", :name => "daily_menu[lunch]"
      assert_select "textarea#daily_menu_dinner", :name => "daily_menu[dinner]"
    end
  end
end
