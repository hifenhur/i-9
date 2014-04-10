require 'spec_helper'

describe HomeController do
	describe "the signin process", :type => :feature, js: true do
	  let(:map){ Map.create(id: 1, name: "mapa_1")}

	  it "signs me in" do

	    visit '/maps/1'

	  	expect(page).to have_css "#wrapper > div.span10 > div.map-tools > a"

	  	first('#new_marker').click
	  	
	  	expect(page).to have_css "#new-point"

	  	first('#map').click

	  	expect(page).to have_css ".in"
	  end

	 
	end

end
