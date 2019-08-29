require 'rails_helper'

describe 'As a visitor' do
  it 'cannot bookmark videos' do
    tutorial = create(:tutorial, title: "How to Tie Your Shoes")
    create(:video, title: "The Bunny Ears Technique", tutorial: tutorial)

    visit tutorial_path(tutorial)

    expect(page).to have_content("User must login to bookmark videos.")
  end
end
