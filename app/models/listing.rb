class Listing < ApplicationRecord
    belongs_to :lender, :class_name => "User"
    has_many :reservations
    has_many :reviews, :through => :reservations
    has_many :borrowers, :class_name => "User", :through => :reservations

    validates :title,  presence: true 
    validates :category, presence: true
    validates :price, presence: true

    scope :search_by_name, -> (search) {where("title LIKE ?", "%#{search}%")}

    def self.available(start_date, end_date)
      if start_date && end_date
        joins(:reservations).
          where.not(reservations: {check_in: start_date..end_date}) &
        joins(:reservations).
          where.not(reservations: {check_out: start_date..end_date})
      else
        []
      end
    end
    
end
