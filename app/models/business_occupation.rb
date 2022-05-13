class BusinessOccupation < ApplicationRecord
  belongs_to :businesses
  belongs_to :occupations
end
