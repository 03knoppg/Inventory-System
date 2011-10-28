class ImagesValuefields < ActiveRecord::Migration
  def up
    create_table("images_valuefields", :id=>false) do |cp|
      cp.column "image_id", :integer
      cp.column "valuefield_id", :integer
    end
  end

  def down
    drop_table "images_valuefields"
  end
end
