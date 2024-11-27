class HomeController < ApplicationController
  def index
    @authors = Author.all
    @books = Book.all
    @users = User.all
    @profiles = Profile.all
    @appointments = Appointment.all
  end
end
