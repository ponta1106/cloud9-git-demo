class Trash < ApplicationRecord
  belongs_to :user
  attachment :trash_image
  
  with_options presence: true do
    validates :title
    validates :prefecture
    validates :city
  end
end
