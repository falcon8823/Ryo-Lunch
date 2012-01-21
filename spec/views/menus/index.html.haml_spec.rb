require 'spec_helper'

describe "menus/index" do
  before(:each) do
    assign(:menus, [
      stub_model(Menu,
        :time => 1,
        :contents => "MyText"
      ),
      stub_model(Menu,
        :time => 1,
        :contents => "MyText"
      )
    ])
  end

  it "renders a list of menus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
