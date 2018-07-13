class RemoveImageFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :image, :string
  end
end
