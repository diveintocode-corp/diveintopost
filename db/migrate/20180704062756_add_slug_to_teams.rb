class AddSlugToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :slug, :string, null: false
    add_index :teams, :slug, unique: true
  end
end
