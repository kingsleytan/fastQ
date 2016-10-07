class Lineup < ApplicationRecord
  belongs_to :service
  has_many :tickets

  def self.add_one
    # add ticket to all services?
    #
    self.create(currentticket: 1)
  end


end
