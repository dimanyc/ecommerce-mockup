class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.text :sample
      t.string :author
      t.string :image_url
      t.decimal :price

      t.timestamps
    end
  end
end
