class BranchesController < ApplicationController
  # before_action :authenticate!, only: [:create, :edit, :update, :new, :destroy]

  def index
    @office = Office.includes(:branches).friendly.find(params[:office_id])
    @branches = @office.branches
  end

  def new
    @office = Office.friendly.find(params[:office_id])
    @branch = Branch.new
  end

  def create
    @office = Office.friendly.find(params[:office_id])
    @branch = @office.branches.build(branch_params)
    # authorize @branch

    if @branch.save
      flash[:success] = "You've created a new branch."
      redirect_to office_branches_path(@office)
    else
      flash[:danger] = @branch.errors.full_messages
      redirect_to new_office_branch_path(@office)
    end
  end

  def show
    @office = Office.friendly.find(params[:office_id])
    @branch = Branch.find(params[:id])
  end

  def edit
    @branch = Branch.friendly.find(params[:id])
    @office = @branch.office
    # authorize @branch
  end

  def update
    @branch = Branch.friendly.find(params[:id])
    @office = @branch.office
    # authorize @branch
    if @branch.update(branch_params)
      redirect_to office_branches_path(@office)
    else
      redirect_to edit_office_branch_path(@office, @branch)
    end
  end

  def destroy
    @branch = Branch.friendly.find(params[:id])
    @office = @branch.office
    # authorize @branch
    if @branch.destroy
      redirect_to office_branches_path(@office)
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :description)
  end
end
