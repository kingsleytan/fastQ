class TicketsController < ApplicationController

  def index
    # current queue
    # next number
    @branch = Branch.includes(:services).find(params[:branch_id])
    @service = Service.includes(:tickets).find(params[:service_id])
    @ticket = Ticket.all
  end

  def new
    @ticket = Ticket.new
    authorize @service
  end

  def create
    @ticket = current_user.services.build(service_params)
    authorize @ticket
    if @ticket.save
      flash[:success] = "You've taken a new ticket."
      redirect_to tickets_path
    else
      flash[:danger] = @ticket.errors.full_messages
      redirect_to new_ticket_path
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:number)
  end

end
