class AddDetailsToUserChecks < ActiveRecord::Migration[5.2]
  def change
    add_column :user_checks, :genre_id, :integer
  end
end
