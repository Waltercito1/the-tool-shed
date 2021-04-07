class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.string :category
      t.text :description
      t.decimal :price, :precision => 8, :scale => 2
      t.belongs_to :city
      t.belongs_to :lender

      t.timestamps
    end
  end
end
