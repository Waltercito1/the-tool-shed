class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :contact_info
      t.boolean :is_lender, default: false

      t.timestamps
    end
  end
end
