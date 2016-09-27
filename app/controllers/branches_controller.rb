class branchesController < ApplicationController
  # before_action :authenticate!, only: [:create, :edit, :update, :new, :destroy]

  def index
    @office = Office.includes(:branches).find(params[:office_id])
    # @branches = @office.branches.order("created_at DESC")
    @branches = Branch.all
    if params[:search]
      @branches = Branch.search(params[:search]).order("created_at DESC")
    else
      @branches = Branch.all.order('created_at DESC')
    end
  end

  def new
    @office = Office.find(params[:office_id])
    @branch = Branch.new
  end

  def create
    @office = Office.find(params[:office_id])
    @branch = current_user.branches.build(branch_params.merge(office_id: params[:office_id]))

    if @branch.save
      flash[:success] = "You've created a new branch."
      redirect_to office_branches_path(@office)
    else
      flash[:danger] = @branch.errors.full_messages
      redirect_to new_office_branch_path(@office)
    end
  end

  def edit
    @branch = Branch.find(params[:id])
    @office = @branch.office
    # authorize @branch
  end

  def update
    @branch = Branch.find(params[:id])
    @office = @branch.office
    # authorize @branch
    if @branch.update(branch_params)
      redirect_to office_branches_path(@office)
    else
      redirect_to edit_office_branch_path(@office, @branch)
    end
  end

  def destroy
    @branch = Branch.find_by(id: params[:id])
    @office = @branch.office
    # authorize @branch
    if @branch.destroy
      redirect_to office_branches_path(@office)
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name)
  end
end
