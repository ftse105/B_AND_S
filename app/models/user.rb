class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: { case_sensitive: false }

  has_many :orders
  has_many :products

  def current_order
    # user.orders.last
    user.orders.where(active: false)
  end

end
