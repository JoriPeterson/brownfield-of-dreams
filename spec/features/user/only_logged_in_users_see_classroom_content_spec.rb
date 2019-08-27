require 'rails_helper'

describe 'Only a registered user' do
	before :each do
		@tutorial= create(:tutorial, title: "How to Tie Your Shoes", classroom: true)
		@video = create(:video, title: "The Bunny Ears Technique", tutorial: @tutorial)
		@video_3 = create(:video, title: "The Loop Swoop & Pull Technique", tutorial: @tutorial)

		@tutorial_2 = create(:tutorial, title: "How to Untie Your Shoes", classroom: false)
		@video_2 = create(:video, title: "The Pull-Through Effect", tutorial: @tutorial_2)
	end

  it 'can see videos marked with classroom content' do
		user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

		expect(page).to have_content(@tutorial.title)
		expect(page).to have_content(@tutorial_2.title)
		expect(page).to have_css('.tutorial', count: 2)
	end

	it 'Non-registered users cannot see classroom content' do
		visit root_path

		expect(page).to have_content(@tutorial_2.title)
		expect(page).to_not have_content(@tutorial.title)
		expect(page).to have_css('.tutorial', count: 1)
	end
end
