class AddColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :shortened_weblink, :string
  end
end
