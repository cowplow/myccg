class FixJoinTables < ActiveRecord::Migration
  def change
    create_table :card_types_cards, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :card_type, index: true
    end

    create_table :card_subtypes_cards, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :card_subtype, index: true
    end

    drop_table :cards_card_subtypes
    drop_table :cards_card_types
  end
end
