class ChangeCards < ActiveRecord::Migration
  def change
    rename_table :sets, :expansions
    rename_column :cards, :set_id, :expansion_id
  end
end
