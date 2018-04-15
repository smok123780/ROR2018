class User < ActiveRecord::Base
    enum status: [:active, :suspended]
    
    validates :email, format: /\A.+@.+\..+\z/
    validates :token, null: false, length: { minimum: 3 }
end
