require 'spec_helper'

describe "zips/edit" do
  before(:each) do
    @zip = assign(:zip, stub_model(Zip,
      :zip => "MyString",
      :integer => "MyString"
    ))
  end

  it "renders the edit zip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => zips_path(@zip), :method => "post" do
      assert_select "input#zip_zip", :name => "zip[zip]"
      assert_select "input#zip_integer", :name => "zip[integer]"
    end
  end
end
