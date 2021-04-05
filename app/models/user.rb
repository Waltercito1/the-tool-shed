class User < ApplicationRecord
has_many :listings, :foreign_key => "lender_id"
has_many :reservations, :through => :listings
has_many :borrowed_tools, :foreign_key => "borrower_id", :class_name => "Reservation"
has_many :reviews, :foreign_key => "borrower_id"

  ## As a borrower
has_many :borrowed_tool_listings, :through => :borrowed_tools, :source => :listing
has_many :lenders, :through => :borrowed_tool_listings, :foreign_key => :lender_id

  ## As a lender
has_many :borrowers, :through => :reservations, :class_name => "User"
has_many :lender_reviews, :through => :listings, :source => :reviews

end
