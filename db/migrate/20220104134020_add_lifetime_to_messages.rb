class AddLifetimeToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :lifetime, :integer
  end
end
