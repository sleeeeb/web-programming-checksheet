class CreateChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :checks do |t|
      t.integer :user_check_id
      t.integer :content_id
      t.integer :level
      t.integer :flag

      t.timestamps
    end
  end
end
