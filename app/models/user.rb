class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 #  validates :nickname, length: { maximum: 12 }
#   validates :lastname, length: { maximum: 12 }
  #    validates :lastname, presence:true
  #   validates :firstname,  presence:true
  #    validates :phone, presence:true
  #    validates :country, presence:true
   # validates :city,  presence:true
  has_many :products, dependent: :destroy     
end
