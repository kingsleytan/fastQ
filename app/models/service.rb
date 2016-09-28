class Service < ApplicationRecord
  belongs_to :branch
  has_many :tickets
end
