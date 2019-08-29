require 'rails_helper'

RSpec.describe Tutorial, type: :model do
	describe 'Validations' do
		it {should validate_presence_of :title}
		it {should validate_presence_of :description}
	end

	describe 'Relationships' do
		it {should have_many :videos}
	end

	describe 'methods' do
		it 'methods' do
			tutorial = create(:tutorial)
			tutorial.videos << create(:video)
			expect(Tutorial.visitor_tutorials(nil, 1)).to eq([tutorial])
			expect(Tutorial.visitor_tutorials('ruby', 1)).to eq([])
			expect(Tutorial.user_tutorials(nil, 1)).to eq([tutorial])
			expect(Tutorial.user_tutorials('ruby', 1)).to eq([])
			expect(Tutorial.admin_tutorials(nil, 1)).to eq([Tutorial.first, Tutorial.last])
			expect(Tutorial.admin_tutorials('ruby', 1)).to eq([])
		end
	end
end
