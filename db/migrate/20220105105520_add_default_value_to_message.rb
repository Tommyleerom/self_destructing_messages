class AddDefaultValueToMessage < ActiveRecord::Migration[6.1]
  def change
    change_column_default :messages, :lifetime, 0
  end
end
