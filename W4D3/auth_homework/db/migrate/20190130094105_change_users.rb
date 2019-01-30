class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :username, null: false
      t.string :username, null: false, limit: 10
    end
  end
end
