require 'rails_helper'

describe "A tutorial must have a video" do
	it "Or admin will be rerouted to add video" do
	  tutorial = create(:tutorial)
	  admin   = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path(tutorial)


  end
end
