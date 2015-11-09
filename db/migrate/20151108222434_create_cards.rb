class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, :text1, :text2, :text3, :text4, :text5, :text6, :text7, :text8
      t.integer :set_id, :faction_id
      t.timestamps
    end

    create_table :card_types do |t|
      t.string :name
      t.integer :card_id
      t.timestamps
    end

    create_table :card_subtypes do |t|
      t.string :name
      t.integer :card_types_id
      t.timestamps
    end

    create_table :factions do |t|
      t.string :name, :color
      t.timestamps
    end

    create_table :sets do |t|
      t.string :name
      t.timestamps
    end
  end
end
