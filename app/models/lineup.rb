class Lineup < ApplicationRecord
  belongs_to :service
  belongs_to :ticket

  def self.add_one
    # add ticket to all services?
    #
    self.create(currentticket: 1)
  end


end
