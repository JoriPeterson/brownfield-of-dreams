require 'rails_helper'

describe 'An admin user can add tutorials' do
  before :each do
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit "/admin/dashboard"

    click_on 'New Tutorial'

    expect(current_path).to eq(new_admin_tutorial_path)
  end

  it 'clicks on add tutoral' do
    fill_in 'tutorial[title]', with: "How to Active Record"
    fill_in 'tutorial[description]', with: "Like a boss"
    fill_in 'tutorial[thumbnail]', with: "https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg"

    click_on "Save"

    expect(page).to have_content("Successfully created tutorial.")
    expect(current_path).to eq(new_admin_tutorial_video_path(Tutorial.last))
  end

  it 'cannot omit information' do
    fill_in 'tutorial[title]', with: "How to Active Record"
    fill_in 'tutorial[thumbnail]', with: "https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg"

    click_on "Save"

    expect(page).to have_content("Unable to create tutorial.")
    expect(current_path).to eq(new_admin_tutorial_path)
  end
end
