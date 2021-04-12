class Reservation < ApplicationRecord
    belongs_to :listing
    belongs_to :borrower, :class_name => "User"
    has_one :review
    
    scope :pending_approval, -> { where status: "pending"}

    validates :check_in, presence: true
    validates :check_out, presence: true

    def duration
        (check_out - check_in).to_i
      end
    
    def total_price
        listing.price * duration
    end

    def available
        Reservation.where(listing_id: listing.id).where.not(id: id).each do |r|
          booked_dates = r.check_in..r.check_out
          if booked_dates === check_in || booked_dates === check_out
            errors.add(:borrower_id, "Sorry, this tool isn't available during your requested dates.")
          end
        end
    end
end
