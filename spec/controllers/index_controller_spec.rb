require 'spec_helper'

describe HomeController do
	describe "the signin process", :type => :feature do

	  it "signs me in" do
	    visit '/users/sign_in'
	    expect(page).to have_content 'Email'
	  end
	end

end
