require 'spec_helper'

describe "zips/new" do
  before(:each) do
    assign(:zip, stub_model(Zip,
      :zip => "MyString",
      :integer => "MyString"
    ).as_new_record)
  end

  it "renders new zip form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => zips_path, :method => "post" do
      assert_select "input#zip_zip", :name => "zip[zip]"
      assert_select "input#zip_integer", :name => "zip[integer]"
    end
  end
end
