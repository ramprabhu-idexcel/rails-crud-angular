class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :product_category_id

      t.timestamps null: false
    end
  end
end
