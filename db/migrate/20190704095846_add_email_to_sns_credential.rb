class AddEmailToSnsCredential < ActiveRecord::Migration[5.2]
  def change
    add_column :sns_credentials, :email, :string, null: false
  end
end
