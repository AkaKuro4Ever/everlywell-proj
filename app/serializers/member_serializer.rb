class MemberSerializer < ActiveModel::Serializer
	attributes :id, :name, :website
	has_many :following
	has_many :follower
end
