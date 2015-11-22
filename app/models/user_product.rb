class UserProduct < ActiveRecord::Base
  validates :user_id, :product_category_id, :product_id, presence:true
  belongs_to :user
  belongs_to :product_category
  belongs_to :product
end
