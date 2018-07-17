class AddTeamIconToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :icon, :string
  end
end
