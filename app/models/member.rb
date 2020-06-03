class Member < ApplicationRecord

	def name_and_website
		name + " and " + website + "!"
	end

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'FollowingFollower'
	has_many :following, through: :following_relationships

	has_many :follower_relationships, foreign_key: :following_id, class_name: 'FollowingFollower'
  has_many :followers, through:  :follower_relationships, source: :follower
end
