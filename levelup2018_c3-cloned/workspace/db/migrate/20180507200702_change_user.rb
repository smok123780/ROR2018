class ChangeUser < ActiveRecord::Migration
  def change
    add_foreign_key :users, :manager_id
  end
  
  def down
    remove_foreign_key :users, :manager_id
  end
end
