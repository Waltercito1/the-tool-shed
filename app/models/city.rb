class City < ApplicationRecord
    has_many :listings
    has_many :reservations, :through => :listings

end
