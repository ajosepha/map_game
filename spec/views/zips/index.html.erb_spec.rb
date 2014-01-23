require 'spec_helper'

describe "zips/index" do
  before(:each) do
    assign(:zips, [
      stub_model(Zip,
        :zip => "Zip",
        :integer => "Integer"
      ),
      stub_model(Zip,
        :zip => "Zip",
        :integer => "Integer"
      )
    ])
  end

  it "renders a list of zips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
  end
end
