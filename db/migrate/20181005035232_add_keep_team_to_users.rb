class AddKeepTeamToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :keep_team_id, :integer
  end
end
