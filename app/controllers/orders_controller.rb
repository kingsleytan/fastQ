class OrdersController < ApplicationController
  before_action :authenticate!

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_user.orders.where(status: 1)
    @interval = 20.minutes
    # @service = @orders.service
  end

  def new
    @interval = 20.minutes
    @service = Service.find(params[:service_id])
  end

  def create
    @service = Service.find(params[:service_id])
    @currentticket = Ticket.where(service_id: @service.id).last
    @ticket = Ticket.create({service_id: params[:service_id],
      number: @currentticket.number + 1})

    @order = current_user.orders.build({
      :status => 0,
      :total => 5.0,
      :ticket_id => @ticket.id
      })

    if @order.save
      @bill = Billplz.create_bill_for(@order)
      @order.update_attributes(bill_id: @bill.parsed_response['id'], bill_url: @bill.parsed_response['url'])
      redirect_to @bill.parsed_response['url']
    else
      render :new
    end

  end

end
