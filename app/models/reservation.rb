class Reservation < ApplicationRecord
    belongs_to :listing
    belongs_to :borrower, :class_name => "User"
    has_one :review
    
    scope :pending_approval, -> { where status: "Pending"}
    scope :reservations_of_listing, -> (current_user_id, params_listing_id) {where("borrower_id = ? and listing_id = ?", current_user_id, params_listing_id).order(created_at: :asc)}
    scope :find_reservation_for_review, -> (current_user_id, params_listing_id) {where("borrower_id = ? and listing_id = ?", current_user_id, params_listing_id).ids[0]}

    validates :check_in, presence: true
    validates :check_out, presence: true
    validate :available
    validate :check_out_is_after_check_in
    validate :check_in_is_in_the_future

    
    def duration
        (check_out - check_in).to_i
      end
    
    def total_price
        listing.price * duration
    end

    def check_in_is_in_the_future
      if check_in && check_in < Date.today
        errors.add(:error, "Your check-in date must be inthe future.")
      end
    end

    def check_out_is_after_check_in
      if check_out && check_in && check_out <= check_in
        errors.add(:error, "Your check-out date needs to be after your check-in.")
      end
    end

    def available
        Reservation.where(listing_id: listing.id).where.not(id: id).each do |r|
          booked_dates = r.check_in..r.check_out
          if booked_dates === check_in || booked_dates === check_out
            errors.add(:error, "Sorry, this tool isn't available during your requested dates.")
          end
        end
    end
    
end
