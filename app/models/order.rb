class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :user_id, uniqueness: {scope: :product_id, :message => "already in cart"}

  after_save :check_if_processed

  # order.update(bought: true)
  # make all the products sold to true
  def check_if_processed
    if self.active == true
      # If you just got rid of your old order, grab a new one
      Order.create(user_id: self.user_id)
    end
  end
end
