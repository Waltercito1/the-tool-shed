class Listing < ApplicationRecord
    belongs_to :lender, :class_name => "User"
    has_many :reservations
    has_many :reviews, :through => :reservations
    has_many :borrowers, :class_name => "User", :through => :reservations

    validates :title,  presence: true 
    validates :category, presence: true
    validates :price, presence: true

    scope :search_by_name, -> (search) {where("title LIKE ?", "%#{search}%")}

    scope :highest_rating_tool, -> {Listing.joins(:reviews).group("id").order("rating DESC").limit(1)}
end
