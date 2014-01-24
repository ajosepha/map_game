require 'spec_helper'

describe "game_zips/index" do
  before(:each) do
    assign(:game_zips, [
      stub_model(GameZip,
        :zip => "Zip",
        :timestamp => "Timestamp"
      ),
      stub_model(GameZip,
        :zip => "Zip",
        :timestamp => "Timestamp"
      )
    ])
  end

  it "renders a list of game_zips" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Timestamp".to_s, :count => 2
  end
end
