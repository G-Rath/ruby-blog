class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :lockable,
         :trackable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  validates :first_name,
            presence: true,
            allow_nil: false,
            allow_blank: false
  validates :last_name,
            presence: true,
            allow_nil: false,
            allow_blank: false
  validates :password_confirmation,
            presence: true
end
