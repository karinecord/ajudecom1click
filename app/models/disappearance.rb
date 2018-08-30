class Disappearance < ApplicationRecord
  has_one :disappeared
  paginates_per 2

end
