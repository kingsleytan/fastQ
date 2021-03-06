class Ticket < ApplicationRecord
  belongs_to :service, optional: true
  belongs_to :user, optional: true
  has_one :order
  has_one :lineup

  after_create :create_lineup
end
