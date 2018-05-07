class UserErrorsSerializer < ActiveModel::Serializer
  attributes :message, :number_of_errors
  
  def message
    "stoopid"
  end
  def number_of_errors
     object.errors.size
  end
end
