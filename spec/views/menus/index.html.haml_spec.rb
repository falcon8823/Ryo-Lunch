# encoding: utf-8
require 'spec_helper'

describe "menus/index" do
  before(:each) do
    assign(:menus, [
      stub_model(Menu,
        date: Time.new(2012, 1, 21),
        :time => 1,
        :contents => "MyText"
      ),
      stub_model(Menu,
        date: Time.new(2012, 1, 3),
        :time => 2,
        :contents => "MyText2"
      )
    ])
  end

  it "renders a list of menus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
    assert_select "tr>td", :text => "MyText2".to_s, :count => 1
  end
end
