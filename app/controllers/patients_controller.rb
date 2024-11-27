class PatientsController < ApplicationController
  def index
    @patients = Patient.includes(:appointments)
  end

  def show
    @patient = Patient.includes(:appointments).find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to @patient, notice: "Patient created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      redirect_to @patient
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path, status: :see_other
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name)
  end
end