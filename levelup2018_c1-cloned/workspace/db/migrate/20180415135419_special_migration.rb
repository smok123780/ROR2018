class SpecialMigration < ActiveRecord::Migration
  class User < ActiveRecord::Base; end
    
  def up
    User.destroy_all(token: nil)
    add_index :users, :token 
  end
  def down
    remove_index :users, :token
  end
end
