class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attachment :profile_image
  has_many :customers, dependent: :delete_all

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
