class CreateAchievements < ActiveRecord::Migration[5.2]
  def change
    create_table :achievements do |t|
      t.references :user, foreign_key: true
      t.references :content, foreign_key: true
      t.integer :level
      t.integer :flag

      t.timestamps
    end
  end
end
