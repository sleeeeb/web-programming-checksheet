class CreateTrophies < ActiveRecord::Migration[5.2]
  def change
    create_table :trophies do |t|
      t.string :name
      t.string :text
      t.string :image_url

      t.timestamps
    end
  end
end
