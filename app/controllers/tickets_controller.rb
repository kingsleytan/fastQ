class TicketsController < ApplicationController

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to root_path
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:number, :service_id)
    end

end
