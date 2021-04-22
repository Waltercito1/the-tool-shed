class Reservation < ApplicationRecord
    belongs_to :listing
    belongs_to :borrower, :class_name => "User"
    has_one :review
    
    scope :pending_approval, -> { where status: "Pending"}
    scope :reservations_of_listing, -> (current_user_id, params_listing_id) {where("borrower_id = ? and listing_id = ?", "#{current_user_id}", "#{params_listing_id}").order(:title)}

    validates :check_in, presence: true
    validates :check_out, presence: true
    validate :available
    validate :check_out_is_after_check_in

    
    def duration
        (check_out - check_in).to_i
      end
    
    def total_price
        listing.price * duration
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
            errors.add(:borrower_id, "Sorry, this tool isn't available during your requested dates.")
            #flash[:error] = "Sorry, this tool isn't available during your requested dates."
          end
        end
    end
    
end
