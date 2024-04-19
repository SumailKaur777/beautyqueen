# app/models/category.rb
class Category < ApplicationRecord
    has_many :products
    def self.ransackable_associations(auth_object = nil)
      ["products"]
    end
    def self.ransackable_attributes(auth_object = nil)
      ["created_at", "id", "id_value", "name", "updated_at"]
    end  
 
    validates :name, presence: true, uniqueness: true
  end
  
