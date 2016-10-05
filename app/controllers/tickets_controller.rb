class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find_by()

  end

end
