class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description

      t.references :brand
      t.references :category
      t.timestamps
    end
  end
end
