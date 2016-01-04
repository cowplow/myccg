class AddCardToComments < ActiveRecord::Migration
  def change
    add_column :comments, :card_id, :integer
    add_column :comments, :user_id, :integer
  end
end
