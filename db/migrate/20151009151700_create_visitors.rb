class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.integer :age
      t.string :phone_no
      t.string :location
      t.string :reason
      t.string :contact_person
      t.string :id_proof
      t.string :id_number
      t.string :auto_generate_id

      t.timestamps null: false
    end
  end
end
