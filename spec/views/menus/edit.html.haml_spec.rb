require 'spec_helper'

describe "menus/edit" do
  before(:each) do
    @menu = assign(:menu, stub_model(Menu,
      :time => 1,
      :contents => "MyText"
    ))
  end

  it "renders the edit menu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => menus_path(@menu), :method => "post" do
      assert_select "input#menu_time", :name => "menu[time]"
      assert_select "textarea#menu_contents", :name => "menu[contents]"
    end
  end
end
