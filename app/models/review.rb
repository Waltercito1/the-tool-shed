class Review < ApplicationRecord
    belongs_to :reservation
    belongs_to :listing
    belongs_to :borrower, :class_name => "User"
    
end
