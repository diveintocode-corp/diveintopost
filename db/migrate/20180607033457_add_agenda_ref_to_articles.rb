class AddAgendaRefToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :agenda, foreign_key: true
  end
end
