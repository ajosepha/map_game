require 'spec_helper'

describe "game_zips/new" do
  before(:each) do
    assign(:game_zip, stub_model(GameZip,
      :zip => "MyString",
      :timestamp => "MyString"
    ).as_new_record)
  end

  it "renders new game_zip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => game_zips_path, :method => "post" do
      assert_select "input#game_zip_zip", :name => "game_zip[zip]"
      assert_select "input#game_zip_timestamp", :name => "game_zip[timestamp]"
    end
  end
end
