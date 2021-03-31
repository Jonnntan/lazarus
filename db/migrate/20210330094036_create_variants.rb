class CreateVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :variants do |t|
      t.string :name
      t.integer :inventory
      t.decimal :price

      t.references :product
      t.timestamps
    end
  end
end
