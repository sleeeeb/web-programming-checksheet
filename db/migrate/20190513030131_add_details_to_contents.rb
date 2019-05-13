class AddDetailsToContents < ActiveRecord::Migration[5.2]
  def change
    add_reference :contents, :genre, foreign_key: true
  end
end
