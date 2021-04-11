class Reservation < ApplicationRecord
    belongs_to :listing
    belongs_to :borrower, :class_name => "User"
    has_one :review
    
    scope :pending_approval, -> { where status: "pending"}

    validates :check_in, presence: true
    validates :check_out, presence: true

end
