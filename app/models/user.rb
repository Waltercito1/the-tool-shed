class User < ApplicationRecord
    has_secure_password

    #lender
    #To find lenders in controllers do @lenders = User.where(lender: true)
    has_many :open_listings, class_name: "Listing", foreign_key: :lender_id
    has_many :reservations, through: :open_listings
    has_many :reviews, through: :reservations
    has_many :borrowers, through: :reservations, source: :borrower
    #borrower
    has_many :created_reservations, class_name: "Reservation", foreign_key: :borrower_id
    has_many :written_reviews, class_name: "Review", foreign_key: :borrower_id
    #scopes
    scope :lenders, -> {where is_lender: true}
    scope :borrowers, -> { where is_lender: false}

    validates :first_name,  presence: true
    validates :last_name,  presence: true
    validates :email,  presence: true, uniqueness: true, format: {with: /\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}

    def full_name
        self.first_name.capitalize + " " + self.last_name.capitalize
    end

    def full_address
        self.street.try(:titleize) + ", " + self.city.capitalize + ", " + self.state.upcase + " " + self.zipcode.to_s
    end

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.first_name = auth.info.first_name
            u.last_name = auth.info.last_name
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
    end

    # m = User.first
    # w = User.last
    # r = Reservation.first
    # rev = Review.first 

end
