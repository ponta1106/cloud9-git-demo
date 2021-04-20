class PickUp < ApplicationRecord
  belongs_to :user
  attachment :pick_up_image
    
  with_options presence: true do
    validates :title
    validates :prefecture
    validates :city
  end
end
