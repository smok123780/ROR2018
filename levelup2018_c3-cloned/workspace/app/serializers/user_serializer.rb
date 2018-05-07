class UserSerializer < ActiveModel::Serializer
  attributes :email, :admin, :manager
  attribute :email_domain, if: :include_email_domain?
  
  def email_domain
    object.email.split('@').last
  end
  def include_email_domain?
    true if object.admin?
  end
end
