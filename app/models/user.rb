

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  has_many :preferences, dependent: :destroy
  has_many :menus, dependent: :destroy
  has_one :review, through: :menus, dependent: :destroy
  has_many :meal_attendances, dependent: :destroy
  has_many :notices, dependent: :destroy

  enum role: { user: 0, admin: 1 , sup_admin: 2}
  validates :email, :phone, :role, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[A-Za-z]+\z/ }
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_plausible_phone :phone, presence: true
end
