# db/migrate/YYYYMMDDHHMMSS_create_categories.rb
class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      # Add any additional columns here
      t.timestamps
    end
  end
end
