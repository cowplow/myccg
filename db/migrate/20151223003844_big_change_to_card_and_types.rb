class BigChangeToCardAndTypes < ActiveRecord::Migration
  def change
    create_table :cards_card_types, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :card_type, index: true
    end

    create_table :cards_card_subtypes, id: false do |t|
      t.belongs_to :card, index: true
      t.belongs_to :card_subtype, index: true
    end

    remove_column :card_types, :card_id
    remove_column :card_subtypes, :cards_id
  end
end
