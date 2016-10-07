class TicketsController < ApplicationController

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      @ticket.lineup.update_attributes(service_id: @ticket.service_id)
      redirect_to root_path
    end
  end

  private
    def ticket_params
      params.require(:ticket).permit(:number, :service_id)
    end

end
