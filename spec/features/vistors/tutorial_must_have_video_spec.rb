require 'rails_helper'

describe "A tutorial must have a video" do
	it "Or admin will be rerouted to add video" do
	  tutorial = create(:tutorial)
	  
		visit '/'

		expect(page).to_not have_content(tutorial.title)
  end
end
