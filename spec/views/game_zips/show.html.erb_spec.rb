require 'spec_helper'

describe "game_zips/show" do
  before(:each) do
    @game_zip = assign(:game_zip, stub_model(GameZip,
      :zip => "Zip",
      :timestamp => "Timestamp"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip/)
    rendered.should match(/Timestamp/)
  end
end
