require 'rails_helper'

RSpec.describe Video, type: :model do
	describe 'Validations'
		it {should validate_presence_of :title}
		it {should validate_presence_of :description}
		it {should validate_presence_of :video_id}
		it {should validate_presence_of :position}

	describe 'Relationships' do
    it {should belong_to :tutorial}
		it {should have_many :user_videos}
    it {should have_many(:users).through(:user_videos)}
	end

	it 'Position cannot by nil' do
		expect(Video.where(position: nil).empty?).to eq(true)
	end
end
