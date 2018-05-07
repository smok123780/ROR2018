class User < ActiveRecord::Base
  validates :email, presence: true, format: /\A.+@.+\..+\z/, uniqueness: true
  belongs_to :manager, class_name: "User", required: false
  has_many :regular_user, class_name: "User", foreign_key: "manager_id"
end
