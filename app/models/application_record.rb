# app/models/application_record.rb
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # Common validations
 # validates :created_at, presence: true
 # validates :updated_at, presence: true
end
