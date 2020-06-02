class Book < ApplicationRecord
  has_many :comments
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :user_books
  has_many :users, through: :user_books
  accepts_nested_attributes_for :users
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'FollowingFollower'
  has_many :followers, through:  :follower_relationships, source: :follower
  has_many :chapters

  validates :title, presence: true
  # validates :user_ids, presence: true

  def self.favs
     includes(:genres).where(genres: {name: "Yaoi"})
  end

  def self.delete_empties
    Book.all.where(title: nil).delete_all
  end

  def commenter_ids
    binding.pry
    self.comments.map {|c| c.user_id}
  end
end
