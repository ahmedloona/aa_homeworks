class ChangeCatsAddColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string :password_digest, null: false
    end
  end
end
