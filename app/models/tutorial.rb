class Tutorial < ApplicationRecord
  has_many :videos, ->  { order(position: :ASC) }
  acts_as_taggable_on :tags, :tag_list
  accepts_nested_attributes_for :videos

	validates_presence_of :title
	validates_presence_of :description

	def self.user_tutorials(current_user, tag, page)
		if current_user.nil?
			if tag
				Tutorial.where("classroom = ?", "false")
					.joins(:videos)
					.select('tutorials.*')
					.tagged_with(tag)
					.paginate(:page => page, :per_page => 5)
					.having('count(videos.*) > 0')
					.group(['tutorials.id, videos.id'])
					.distinct
			else
				Tutorial.where("classroom = ?", "false")
					.joins(:videos)
					.select('tutorials.*')
					.paginate(:page => page, :per_page => 5)
					.having('count(videos.*) > 0')
					.group(['tutorials.id, videos.id'])
					.distinct
			end
		elsif current_user.admin?
			if tag
				Tutorial.tagged_with(tag)
					.paginate(:page => page, :per_page => 5)
			else
				Tutorial.all
					.paginate(:page => page, :per_page => 5)
			end
		else
			if tag
				Tutorial.joins(:videos)
					.select('tutorials.*')
					.tagged_with(tag)
					.paginate(:page => page, :per_page => 5)
					.having('count(videos.id) > 0')
					.group(['tutorials.id, videos.id'])
					.distinct
			else
				Tutorial.joins(:videos)
					.select('tutorials.*')
					.paginate(:page => page, :per_page => 5)
					.having('count(videos.id) > 0')
					.group(['tutorials.id, videos.id'])
					.distinct
			end
		end
	end
end
