class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.belongs_to :borrower
      t.belongs_to :reservation

      t.timestamps
    end
  end
end
