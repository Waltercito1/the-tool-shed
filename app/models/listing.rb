class Listing < ApplicationRecord
    belongs_to :lender, :class_name => "User"
    has_many :reservations
    has_many :reviews, :through => :reservations
    has_many :borrowers, :class_name => "User", :through => :reservations

    validates :title,  presence: true #, length: {minimum: 8}
    validates :category, presence: true
    validates :price, presence: true


end
