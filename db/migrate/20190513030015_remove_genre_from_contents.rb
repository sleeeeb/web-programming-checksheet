class RemoveGenreFromContents < ActiveRecord::Migration[5.2]
  def change
    remove_column :contents, :genre, :string
  end
end
