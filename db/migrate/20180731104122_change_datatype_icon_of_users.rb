class ChangeDatatypeIconOfUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :icon, :string
  end
end
