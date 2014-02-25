require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit user_signin_path }

    it { should have_selector('h1', text: 'Sign in') }

  end
end
