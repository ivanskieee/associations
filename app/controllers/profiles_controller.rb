class ProfilesController < ApplicationController
  def index
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    redirect_to root_path, status: :see_other
  end
end
