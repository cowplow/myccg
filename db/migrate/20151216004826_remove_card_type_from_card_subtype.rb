class RemoveCardTypeFromCardSubtype < ActiveRecord::Migration
  def change
    remove_column :card_subtypes, :card_types_id
    add_column :card_subtypes, :cards_id, :integer
  end
end
