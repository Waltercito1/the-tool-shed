class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.integer :borrower_id
      t.integer :reservation_id

      t.timestamps
    end
  end
end
