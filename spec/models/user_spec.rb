require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:password_digest)}
  end

	describe 'relationships' do
		it {should have_many :user_credentials}
		it {should have_many :user_videos}
		it {should have_many(:videos).through(:user_videos)}
		it {should have_many :friendships}
		it {should have_many(:friends).through(:friendships)}
	end

  describe 'roles' do
    it 'can be created as default user' do
      user = User.create(email: 'user@email.com', password: 'password', first_name:'Jim', role: 0)

      expect(user.role).to eq('default')
      expect(user.default?).to be_truthy
    end

    it 'can be created as an Admin user' do
      admin = User.create(email: 'admin@email.com', password: 'admin', first_name:'Bob', role: 1)

      expect(admin.role).to eq('admin')
      expect(admin.admin?).to be_truthy
    end
  end

  describe 'methods' do
    it 'methods' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_2.user_credentials.create!(nickname: 'jake0miller', website: 'github', token: '1')
      follower = Follower.new({login: 'jake0miller', html_url: 'fake'})

      expect(user_1.friendable?(follower)).to eq(true)

      expect(user_2.token('github')).to eq('1')

      user_1.add_credential('github', {"credentials" => {"token" => '2'}, "info" => {"nickname" => 'jori'}})

      expect(user_1.token('github')).to eq('2')

      tutorial = create(:tutorial)
      video = create(:video)
      video.update_attributes(tutorial_id: tutorial.id)
      user_1.user_videos.create!(video_id: video.id)

      expect(user_1.bookmarks.first).to eq(tutorial)
      expect(user_1.github_handle).to eq('jori')
      expect(User.find_by_github_handle('jake0miller')[0]).to eq(user_2)
    end
  end
end
