class DropUnnecessaryTables < ActiveRecord::Migration[5.2]
	def change
		drop_table :user_books
		drop_table :users
		drop_table :genres
		drop_table :following_followers
		drop_table :comments
		drop_table :book_genres
  end
end
