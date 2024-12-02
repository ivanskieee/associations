class PhysiciansController < ApplicationController
  def index
    @physicians = Physician.all
  end

  def show
    @physician = Physician.find(params[:id])
  end

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    if @physician.save
      redirect_to @physician
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])

    if @physician.update(physician_params)
      redirect_to @physician
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy

    redirect_to physicians_path, status: :see_other
  end

  private
  def physician_params
    params.require(:physician).permit(:name)
  end
end
