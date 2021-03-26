class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.references :brand
      t.timestamps
    end
  end
end
