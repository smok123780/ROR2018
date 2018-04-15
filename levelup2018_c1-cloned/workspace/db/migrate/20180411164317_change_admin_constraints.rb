class ChangeAdminConstraints < ActiveRecord::Migration
  class User < ActiveRecord::Base; end
    
  def up
    User.where(admin: nil).update_all(admin: false)
    change_column :users, :admin, :boolean, null: false, default: false
  end
  
  def down
    change_column :users, :admin, :boolean
  end
end
