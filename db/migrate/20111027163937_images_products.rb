class ImagesProducts < ActiveRecord::Migration
  def up
    create_table("images_products", :id=>false) do |cp|
      cp.column "image_id", :integer
      cp.column "product_id", :integer
    end
  end

  def down
    drop_table "images_products"
  end
end
