class OrderSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :active, :product
end
