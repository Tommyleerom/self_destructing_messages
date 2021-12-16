class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :report
      t.string :password

      t.timestamps
    end
  end
end
