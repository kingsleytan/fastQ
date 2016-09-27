class OfficesController < ApplicationController

  def index
    @offices = Office.order(:id).page params[:page]
  end

  def new
    @office = Office.new
    # authorize @office
  end

  def create
    @office = current_user.offices.build(office_params)
    # authorize @office
    if @office.save
      flash[:success] = "You've created a new office."
      redirect_to offices_path
    else
      flash[:danger] = @office.errors.full_messages
      redirect_to new_office_path
    end
  end

  def edit
    @office = Office.find(params[:id])
    # authorize @office
  end

  def update
    @office = Office.find(params[:id])
    # authorize @office
    if @office.update(office_params)
      redirect_to office_path(@office)
    else
      redirect_to edit_office_path(@office)
    end
  end

  def destroy
    @office = Office.find(params[:id])
    # authorize @office
    if @office.destroy
      redirect_to offices_path
    else
      redirect_to office_path(@office)
    end
  end

  private

  def office_params
    params.require(:office).permit(:company)
  end
end
