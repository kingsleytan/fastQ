class Branch < ApplicationRecord
  belongs_to :office
  has_many :services
end
