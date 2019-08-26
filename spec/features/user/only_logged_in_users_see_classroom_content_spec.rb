require 'rails_helper'

describe 'Only a registered user' do
	before :each do
		@tutorial= create(:tutorial, title: "How to Tie Your Shoes", classroom: true)
		@video = create(:video, title: "The Bunny Ears Technique", tutorial: @tutorial)

		@tutorial_2 = create(:tutorial, title: "How to Untie Your Shoes", classroom: false)
		@video_2 = create(:video, title: "The Pull-Through Effect", tutorial: @tutorial_2)
	end

  it 'can see videos marked with classroom content' do

		user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit tutorials_path

		expect(page).to have_content(@tutorial.title)
		expect(page).to have_content(@tutorial_2.title)
	end

	it 'Non-registered users cannot see classroom content' do

		visit tutorials_path

		expect(page).to have_content(@tutorial_2.title)
		expect(page).to_not have_content(@tutorial.title)
	end
end
