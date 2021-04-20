class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :trashes, dependent: :destroy
  has_many :pick_ups, dependent: :destroy
  attachment :image
  with_options presence: true do
    validates :name
    validates :prefecture
    validates :city
  end
end
