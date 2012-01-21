require 'spec_helper'

describe "menus/show" do
  before(:each) do
    @menu = assign(:menu, stub_model(Menu,
      :time => 1,
      :contents => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
