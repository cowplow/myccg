class AddSlugToCardsFactionsExpansions < ActiveRecord::Migration
  def change
    add_column :cards, :slug, :string
    add_column :factions, :slug, :string
    add_column :expansions, :slug, :string
  end
end
