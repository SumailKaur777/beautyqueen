# app/admin/products.rb
ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image, :category_id

  filter :images_attachments
  
  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
      f.input :category_id
    end
    f.actions
  end
end
