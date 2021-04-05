class City < ApplicationRecord
    as_many :listings
    has_many :reservations, :through => :listings

end
