class Branch < ApplicationRecord
  belongs_to :office
  has_many :tickets
end
