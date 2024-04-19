# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 # validates :email, presence: true, uniqueness: true
 # validates :password, presence: true
end
