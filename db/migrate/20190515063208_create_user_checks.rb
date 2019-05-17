class CreateUserChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_checks do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end


rails generate migration AddDetailsToUserChecks genre_id:integer