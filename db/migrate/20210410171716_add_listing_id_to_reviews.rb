class AddListingIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :listing, null: false 
  end
end
