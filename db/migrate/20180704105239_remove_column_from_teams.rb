class RemoveColumnFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :slug, :string, null: false
  end
end
