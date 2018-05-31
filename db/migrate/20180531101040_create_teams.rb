class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :owner_id, index: true

      t.timestamps
    end
    add_foreign_key :teams, :users, column: :owner_id
  end
end
