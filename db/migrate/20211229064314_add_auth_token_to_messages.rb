class AddAuthTokenToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :auth_token, :string
    add_index :messages, :auth_token, unique: true
  end
end
