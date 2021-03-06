class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.decimal :deposit, :precision => 8, :scale => 2
      t.string :status, default: "Pending"
      t.belongs_to :listing #, foreign_key: {on_delete: :cascade}
      t.belongs_to :borrower #, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
