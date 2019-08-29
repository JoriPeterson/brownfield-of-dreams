require 'rails_helper'

describe "As a registered user", :vcr do
  before :each do
    @user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit dashboard_path
    click_on "Send an Invite"

    expect(current_path).to eq(new_invite_path)
  end

  it 'can invite a valid github handle w email' do
    @user.user_credentials.create!(token: ENV['GITHUB_API_KEY'], nickname: "Jake0Miller", website: 'github')

    fill_in "Github Handle", with: "jake0miller"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Successfully sent invite!")
    expect(page).to_not have_content("The Github user you selected doesn't have an email address associated with their account.")
  end

  it 'can send an invite to a valid github handle' do
    @user.user_credentials.create!(token: ENV['GITHUB_API_KEY'], nickname: "Jake0Miller", website: 'github')

    fill_in "Github Handle", with: "joripeterson"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("The Github user you selected doesn't have an email address associated with their account.")
  end

  it "cannot send if github handle is not valid" do
    @user.user_credentials.create!(token: ENV['GITHUB_API_KEY'], nickname: "Jake0Miller", website: 'github')

    fill_in "Github Handle", with: "purple_rain"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("Github user not found!")
    expect(page).to_not have_content("The Github user you selected doesn't have an email address associated with their account.")
    expect(page).to_not have_content("Successfully sent invite!")
  end

  it "cannot send if not logged in to github" do
    fill_in "Github Handle", with: "jake0miller"
    click_on "Send Invite"

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content("You must be connected to GitHub to invite new users")
    expect(page).to_not have_content("The Github user you selected doesn't have an email address associated with their account.")
    expect(page).to_not have_content("Successfully sent invite!")
  end
end
