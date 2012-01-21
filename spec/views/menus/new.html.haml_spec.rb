require 'spec_helper'

describe "menus/new" do
  before(:each) do
    assign(:menu, stub_model(Menu,
      :time => 1,
      :contents => "MyText"
    ).as_new_record)
  end

  it "renders new menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menus_path, :method => "post" do
      assert_select "input#menu_time", :name => "menu[time]"
      assert_select "textarea#menu_contents", :name => "menu[contents]"
    end
  end
end
