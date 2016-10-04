class ServicesController < ApplicationController

  def index
    @branch = Branch.includes(:services).friendly.find(params[:branch_id])
    @services = Service.all
  end

  def new
    @branch = Branch.friendly.find(params[:branch_id])
    @service = Service.new
  end

  def create
    @branch = Branch.friendly.find(params[:branch_id])
    @service = @branch.services.build(service_params)
    # authorize @service
    if @service.save
      flash.now[:success] = "You've created a new service."
      render :index
    else
      flash[:danger] = @service.errors.full_messages
      redirect_to new_service_path
    end
  end

  def edit
    @service = Service.friendly.find(params[:id])
    authorize @service
  end

  def update
    @service = Service.friendly.find(params[:id])
    authorize @service
    if @service.update(service_params)
      redirect_to service_path(@service)
    else
      redirect_to edit_service_path(@service)
    end
  end

  def destroy
    @service = service.friendly.find(params[:id])
    authorize @service
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
