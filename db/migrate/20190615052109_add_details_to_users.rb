class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :rank, :integer
    add_column :users, :start_date, :date
  end
end
