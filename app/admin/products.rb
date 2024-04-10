# app/admin/products.rb
ActiveAdmin.register Product do
  permit_params :name, :description, :price, :image

  filter :images_attachments
  
  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description
      f.input :price
      f.input :image, as: :file
    end
    f.actions
  end
end
