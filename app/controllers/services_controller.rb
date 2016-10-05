class ServicesController < ApplicationController

  def show
    @branch = Branch.includes(:services).friendly.find(params[:branch_id])
    @office = @branch.office
    @service = Service.friendly.find(params[:id])
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
    # authorize @service
    if @service.save
      flash[:success] = "You've created a new service."
      # binding.pry
      redirect_to office_branch_services_path(@service)
    else
      flash[:danger] = @service.errors.full_messages
      redirect_to new_office_branch_service_path
    end
  end

  def edit
    @branch = Branch.friendly.find(params[:id])
    @office = @branch.office

    @service = Service.friendly.find(params[:id])
    # authorize @service
  end

  def update
    @service = Service.friendly.find(params[:id])
    @office = @branch.office

    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      redirect_to edit_service_path(@service)
    end
  end

  def destroy
    @service = Service.friendly.find(params[:id])
    @office = @branch.office

    # authorize @service
    if @service.destroy
      redirect_to services_path
    else
      redirect_to service_path(@service)
    end
  end

  private

  def service_params
    params.require(:service).permit(:name)
  end
end
