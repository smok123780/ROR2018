class User < ActiveRecord::Base
  validates :email, presence: true, format: /\A.+@.+\..+\z/, uniqueness: true
end
