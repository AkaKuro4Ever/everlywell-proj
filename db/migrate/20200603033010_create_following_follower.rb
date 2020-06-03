class CreateFollowingFollower < ActiveRecord::Migration[5.2]
  def change
    create_table :following_followers do |t|
      t.integer :following_id
      t.integer :follower_id
    end
  end
end
