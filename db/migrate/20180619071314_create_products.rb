class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :qty
      t.text :description
      t.references :seller, foreign_key: true

      t.timestamps
    end
  end
end
