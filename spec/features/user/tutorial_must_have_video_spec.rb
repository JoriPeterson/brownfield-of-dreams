require 'rails_helper'

describe "A tutorial must have a video" do
	it "Or admin will be rerouted to add video" do
	  tutorial = create(:tutorial)
	  user   = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		visit '/'

		expect(page).to_not have_content(tutorial.title)
  end
end
