class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :orders, :products

  has_many :orders, include_nested_associations: true
end
