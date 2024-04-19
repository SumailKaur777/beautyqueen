# app/models/admin_user.rb
class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  
  #validates :email, presence: true, uniqueness: true
 # validates :encrypted_password, presence: true
end
