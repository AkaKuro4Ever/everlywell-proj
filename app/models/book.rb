class Book < ApplicationRecord
  has_many :comments
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :user_books
  has_many :users, through: :user_books
  accepts_nested_attributes_for :users
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'FollowingFollower'
  has_many :followers, through:  :follower_relationships, source: :follower

  validates :title, presence: true
  validates :user_ids, presence: true
end
