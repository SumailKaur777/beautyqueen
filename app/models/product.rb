# app/models/product.rb
class Product < ApplicationRecord
    # Associations
   
    has_one_attached :image
    belongs_to :category
    # Whitelist associations for searching
    def self.ransackable_associations(auth_object = nil)
      ["images_attachments", "images_blobs"]
    end
    
    # Whitelist attributes for searching
    def self.ransackable_attributes(auth_object = nil)
      %w[id name description price created_at updated_at]
    end
    
    # Validations
    validates :name, presence: true
    validates :description, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
  
