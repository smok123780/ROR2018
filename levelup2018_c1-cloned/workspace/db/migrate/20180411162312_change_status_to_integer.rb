class ChangeStatusToInteger < ActiveRecord::Migration
  class User < ActiveRecord::Base; end

  def up
    statuses = User.pluck(:id, :status)
    change_column :users, :status, :integer, null: false, default: 0
    statuses.each do |(id, status)|
      if User.statuses.keys.include?(status)
        User.find(id).update(status: status) 
      end
    end
  end
  
  def down
    statuses = User.pluck(:id, :status)
    change_column :users, :status, :string
    statuses.each do |(id, status)|
      User.find(id).update(status: User.statuses.key(status)) 
    end
  end
end
