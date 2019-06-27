class UserChecks < ActiveRecord::Migration[5.2]
  def change
    add_column :user_checks, :score, :integer    
  end
end
