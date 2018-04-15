class AddTokenToUser < ActiveRecord::Migration
  class User < ActiveRecord::Base; end
    
  def change
    add_column :users, :token, :string
  end
end
