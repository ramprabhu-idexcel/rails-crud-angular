class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.decimal :price
      t.references :author, index: true
      t.references :genre, index: true

      t.timestamps null: false
    end
    add_foreign_key :books, :authors
    add_foreign_key :books, :genres
  end
end
