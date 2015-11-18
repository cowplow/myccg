class ChangeAuthorityColumnOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :authority, :integer, default: 0
  end
end
