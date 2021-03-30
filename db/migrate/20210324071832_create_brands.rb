class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :slug_url

      t.timestamps
    end
  end
end
