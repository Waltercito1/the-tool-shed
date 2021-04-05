class Listing < ApplicationRecord
    belongs_to :lender, :class_name => "User"
    belongs_to :city, required: true
    has_many :reservations
    has_many :reviews, :through => :reservations
    has_many :borrowers, :class_name => "User", :through => :reservations

end
