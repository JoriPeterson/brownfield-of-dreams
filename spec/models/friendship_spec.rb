require 'rails_helper'

RSpec.describe Friendship, type: :model do
	describe 'relationships' do
		it {should belong_to :user}
	end

	describe 'methods' do
		it 'methods' do
			user_1 = create(:user)
			user_2 = create(:user)
			user_1.friendships.create!(friend_id: user_2.id)

			expect(Friendship.count).to eq(2)
			expect(Friendship.first.inverses.count).to eq(1)

			Friendship.first.destroy_inverses

			expect(Friendship.count).to eq(0)
		end
	end
end
