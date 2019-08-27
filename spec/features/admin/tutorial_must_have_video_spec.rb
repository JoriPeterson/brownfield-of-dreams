require 'rails_helper'

describe "A tutorial must have a video" do
	it "Or admin will be rerouted to add video" do
	  tutorial = create(:tutorial)
	  admin   = create(:admin)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit new_admin_tutorial_path(tutorial)

		fill_in 'tutorial[title]', with: "How to Active Record"
    fill_in 'tutorial[description]', with: "Like a boss"
    fill_in 'tutorial[thumbnail]', with: "https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg"

    click_on "Save"

		expect(current_path).to eq(new_admin_tutorial_video_path(Tutorial.last))



	# 	fill_in 'video[youtube_url]'
	# 	fill_in 'video[video_id]'
	#
	# 	click_on "Submit"
  end
end
