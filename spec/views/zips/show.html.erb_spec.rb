require 'spec_helper'

describe "zips/show" do
  before(:each) do
    @zip = assign(:zip, stub_model(Zip,
      :zip => "Zip",
      :integer => "Integer"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Zip/)
    rendered.should match(/Integer/)
  end
end
