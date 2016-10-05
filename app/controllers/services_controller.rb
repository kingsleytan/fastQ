class ServicesController < ApplicationController

  def show
    @branch = Branch.includes(:services).friendly.find(params[:branch_id])
    @office = @branch.office
    @service = Service.friendly.find(params[:id])
    @order = Order.new
  end

  def index
    @branch = Branch.includes(:services).friendly.find(params[:branch_id])
    @office = @branch.office
    @services = @branch.services
  end

  def new
    @branch = Branch.friendly.find(params[:branch_id])
    @office = @branch.office
    @service = Service.new
  end

  def create
    @branch = Branch.friendly.find(params[:branch_id])
    @office = @branch.office
    @service = @branch.services.build(service_params)
    if @service.save
      flash[:success] = "You've created a new service."
      redirect_to office_branch_services_path(@service)
    else
      flash[:danger] = @service.errors.full_messages
      redirect_to new_office_branch_service_path
    end
  end

  def edit
    # @branch = Branch.friendly.find(params[:id])
    # @office = @branch.office
    @service = Service.friendly.find(params[:id])
    # binding.pry
  end

  def update
    # @branch = Branch.friendly.find(params[:id])
    # @office = @branch.office
    @service = Service.friendly.find(params[:id])

    if @service.update(service_params)
      redirect_to office_branch_services_path(@service)
    else
      redirect_to edit_office_branch_service_path(@service)
    end
  end

  def destroy
    # @branch = Branch.friendly.find(params[:id])
    # @office = @branch.office
    @service = Service.friendly.find(params[:id])

    if @service.destroy
      redirect_to office_branch_services_path
    else
      redirect_to office_branch_service_path(@service)
    end
  end

  private

  def service_params
    params.require(:service).permit(:name)
  end
end
